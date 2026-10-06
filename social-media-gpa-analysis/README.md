# Does Social Media Use Affect Students' GPA?

A SQL analysis of 4,500 students looking at how daily social media use, sleep, and late-night scrolling relate to academic performance.

## Main question
Is heavier social media use linked to lower GPAs, and if so, why?

## Data
- **File:** `Social_media_impact_on_life.csv` (4,500 students, 16 columns)
- **Key columns:** daily usage hours, primary platform, sleep duration and quality, late-night usage, stress score, mental health index, GPA
- **Missing values:** 85 GPAs and 46 stress scores are blank (excluded from averages)
- - **Source:** (https://www.kaggle.com/datasets/harishyadav0506/impact-of-social-media-on-life)

## Tools
- PostgreSQL
- DBeaver

## SQL skills used
- Aggregations (`COUNT`, `AVG`, `MIN`, `MAX`) with `GROUP BY`
- `CASE WHEN` to group students into usage bands
- Common table expressions (CTEs)
- Window functions: `RANK()`, `ROW_NUMBER()`, `SUM() OVER ()`, `PARTITION BY`

## Questions
1. What are the min, max and average daily usage hours, sleep hours and GPA?
2. How many students are in each academic level?
3. What is the average GPA for light (<3 hrs), moderate (3–6 hrs) and heavy (6+ hrs) users?
4. Do heavy users who still sleep 7+ hours keep a GPA close to light users?
5. Within each academic level, how do platforms rank by average GPA?
6. Do late-night users have lower sleep quality and GPA?
7. Who are the 3 heaviest users on each platform, and what are their GPAs?

All queries are in [`social_media_gpa_analysis.sql`](social_media_gpa_analysis.sql).

## Key findings

| Group | Avg GPA |
|---|---|
| Light users (<3 hrs/day) | 3.73 |
| Moderate users (3–6 hrs) | 3.53 |
| Heavy users who sleep 7+ hrs | 3.36 |
| Heavy users (6+ hrs) | 3.09 |
| Top 3 heaviest users per platform | ~2.60 |

1. **Heavier use is linked to lower grades.** Light users average a 3.73 GPA, compared with 3.09 for heavy users.
2. **Sleep explains part of the gap, not all of it.** Heavy users who sleep 7+ hours average 3.36: better than heavy users overall, but still below light users.
3. **Late-night use matters.** 59% of students use social media late at night. They rate their sleep worse (2.24 vs 2.81 out of 5) and average a lower GPA (3.35 vs 3.55).
4. **How much matters more than which app.** GPA differences between platforms were small (under 0.2 points).

## Limitations
- This data shows a link, not a cause. Heavy use might lower grades, or struggling students might turn to social media more.
- The dataset appears to be synthetic, so the patterns are cleaner than real-world data usually is.
- Some groups are small (for example, 9 postgraduate LinkedIn users), so results for those groups are less reliable.

## How to run
1. Create a PostgreSQL database and import `Social_media_impact_on_life.csv` as a table named `social_media_impact_on_life` (DBeaver: right-click the schema → Import Data).
2. Open `social_media_gpa_analysis.sql` and run each query.
