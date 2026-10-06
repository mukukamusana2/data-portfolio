-- ==========================================================
-- PROJECT: Does social media use affect students' GPA?
-- Table: social_media_impact_on_life
-- ==========================================================

-- 1.  What are the min, max and average daily usage hours, sleep hours and GPA?
-- 2.  How many students are in each academic level? (add platform and device type if you want)
-- 3.  What is the average GPA for light (<3 hrs), moderate (3-6 hrs) and heavy (6+ hrs) users?
-- 4.  Do heavy users who still sleep 7+ hours keep a GPA close to light users'?
-- 5.  Within each academic level, rank platforms by average GPA.
-- 6.  Do late-night users have lower sleep quality and GPA than non-late-night users?
-- 7.  Who are the 3 heaviest users on each platform, and what are their GPAs?
-- 8.  What are the 3-4 key findings, and what can this data NOT prove?

-- 1. What are the min, max and average daily usage hours, sleep hours and GPA?

SELECT MIN("Daily_Usage_Hours")                          AS min_daily_usage_hours,
       MAX("Daily_Usage_Hours")                          AS max_daily_usage_hours,
       ROUND(AVG("Daily_Usage_Hours")::numeric, 2)        AS avg_daily_usage_hours,
       MIN("Sleep_Duration_Hours")                       AS min_sleep_hours,
       MAX("Sleep_Duration_Hours")                       AS max_sleep_hours,
       ROUND(AVG("Sleep_Duration_Hours")::numeric, 2)     AS avg_sleep_hours,
       MIN("Academic_Performance_GPA")                   AS min_gpa,
       MAX("Academic_Performance_GPA")                   AS max_gpa,
       ROUND(AVG("Academic_Performance_GPA")::numeric, 2) AS avg_gpa
FROM social_media_impact_on_life;

-- 2. How many students are in each academic level?

select ("Academic_Level"), 
       COUNT ("Student_ID") as number_of_students,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_students
from social_media_impact_on_life
group by ("Academic_Level")
order by number_of_students DESC;

-- 3.  What is the average GPA for light (<3 hrs), moderate (3-6 hrs) and heavy (6+ hrs) users?

select case when ("Daily_Usage_Hours") < 3 then 'Light'
when ("Daily_Usage_Hours") <= 6 then 'Moderate'
else 'Heavy'
end as usage_band,
COUNT(*) as students,
ROUND(AVG("Academic_Performance_GPA")::numeric,2) as avg_gpa
FROM social_media_impact_on_life
group by usage_band
order by avg_gpa desc;

--4 Do heavy users who still sleep 7+ hours keep a GPA close to light users

select COUNT(*) AS students,
ROUND(AVG("Academic_Performance_GPA")::numeric, 2) AS avg_gpa
from social_media_impact_on_life
where "Sleep_Duration_Hours" >= 7
and "Daily_Usage_Hours" > 6;

--5 Within each academic level, rank platforms by average GPA.   

select 
      "Academic_Level",
      "Primary_Platform",
      COUNT(*) as students,
      ROUND(AVG("Academic_Performance_GPA")::numeric,2) as average_gpa,
      rank() over( partition by "Academic_Level" order by AVG("Academic_Performance_GPA") DESC) as platform_rank 
FROM social_media_impact_on_life
group by "Academic_Level","Primary_Platform"
order by "Academic_Level", platform_rank;

--6   Do late-night users have lower sleep quality and GPA than non-late-night users?


select "Late_Night_Usage",
       COUNT(*) as students,
       ROUND(AVG("Sleep_Quality_Score"):: numeric,2) as avg_sleep_quality,
       ROUND(AVG("Academic_Performance_GPA"):: numeric,2) as avg_gpa
FROM social_media_impact_on_life
group by "Late_Night_Usage";

--7  Who are the 3 heaviest users on each platform, and what are their GPAs?

with ranked AS(
	select "Primary_Platform",
	       "Student_ID",
	       "Daily_Usage_Hours",
	       "Academic_Performance_GPA",
	       row_number()over(partition by "Primary_Platform" order by "Daily_Usage_Hours" desc, "Student_ID") as usage_rank     
	FROM social_media_impact_on_life
	)
select *
from ranked
where usage_rank <= 3
order by "Primary_Platform",usage_rank;

-- KEY FINDINGS
-- About the data: 4,500 students (62% undergrad); average use is 5.3 hrs/day.
--
-- 1. Heavier use is linked to lower grades. Light users (<3 hrs) average a 3.73 GPA,
--    moderate users 3.53, and heavy users (6+ hrs) 3.09.
-- 2. Sleep explains part of the gap, not all of it. Heavy users who sleep 7+ hours
--    average 3.36: better than heavy users overall, but still below light users.
-- 3. Late-night use matters. 59% of students use social media late at night;
--    they rate their sleep worse (2.24 vs 2.81 out of 5) and average a lower GPA (3.35 vs 3.55).
-- 4. How much matters more than which app. GPA differences between platforms were
--    small (under 0.2 points), while the 3 heaviest users on each platform averaged about 2.6.
--
-- LIMITS: This data shows a link, not a cause. Heavy use might lower grades,
-- or struggling students might turn to social media more. The data also appears
-- to be synthetic, so the patterns are cleaner than real life usually is.





