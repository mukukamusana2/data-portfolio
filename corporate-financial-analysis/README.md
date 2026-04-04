#  Retail Financial Performance Analysis (SEC 10-K Data)

# Project Overview


This project analyzes the financial performance and capital structure of three major U.S. retail corporations — Walmart, Target, and Costco — using structured financial statement data extracted from the U.S. SEC EDGAR Company Facts XBRL API. The purpose of the analysis was to evaluate differences in company scale, revenue growth velocity, profitability quality, and leverage positioning over the period 2009–2023. By integrating income statements and balance sheet metrics, the project assesses financial stability, and the relationship between leverage and shareholder returns.


# Tools and Techniques


Financial data was retrieved directly from the SEC Company Facts XBRL API using 10-K filings. Data extraction and transformation were performed in Power Query (M language), including the cleaning of GAAP tag variations and removal of duplicate filings. A star schema data model was implemented in Power BI, consisting of a fact table (Fact_CorporateFinancials) and supporting dimension tables (Dim_Date and Dim_Company). DAX measures were developed to calculate financial ratios, year-over-year growth rates, and leverage metrics. Time-intelligence functions were applied to evaluate performance trends across fiscal years.


# Key Metrics Built


The analysis includes the construction of core financial performance and capital structure metrics. These include Total Revenue, Revenue Year-over-Year Growth (YoY %), Net Profit Margin, Return on Equity (ROE), Debt Ratio, and Debt-to-Equity Ratio. These measures were designed to compare company scale, operational efficiency, profitability stability, and leverage intensity across firms. The metrics were evaluated both independently and in combination to understand risk-return dynamics and growth-quality tradeoffs.


# Key Insights


The analysis indicates that Walmart leads in absolute revenue scale and exhibits characteristics consistent with a mature-stage corporation, including slower percentage growth and stable returns. Costco demonstrates the strongest revenue growth trajectory while maintaining stable net margins, suggesting scalable expansion supported by operational discipline. Target achieves higher net margins relative to peers but displays greater historical volatility, particularly during certain periods, indicating higher sensitivity to operational and leverage dynamics. The relationship between leverage and ROE was found to vary across companies, illustrating that increased debt does not consistently enhance shareholder returns and instead reflects nuanced capital structure tradeoffs.

# Screenshots

<img width="1909" height="862" alt="Screenshot 2026-03-09 130508" src="https://github.com/user-attachments/assets/a35ecb08-2b12-409a-bb70-f74852bda28d" />

<img width="1903" height="875" alt="Screenshot 2026-03-09 130523" src="https://github.com/user-attachments/assets/2e379e02-db52-4378-bc80-1bd2636c9d92" />

<img width="1905" height="867" alt="Screenshot 2026-03-09 130537" src="https://github.com/user-attachments/assets/255d08cb-5d2f-4dc7-a21b-36cca791611b" />


