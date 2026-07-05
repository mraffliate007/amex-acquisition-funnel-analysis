# Amex Acquisition Funnel Analysis

## Business Problem
Acquiring new customers efficiently requires understanding where prospects drop off between initial contact and conversion, and which channels deliver the best return per acquisition. This project analyzes a marketing-to-sales funnel across 8,000 leads to identify drop-off points, channel efficiency, and conversion trends — mirroring the acquisition analytics used to optimize digital targeting and personalization strategies at card issuers like Amex.

## Dataset
**Source:** [Marketing Funnel by Olist](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist) (Kaggle, by olistbr)

| Table | Rows | Description |
|---|---|---|
| `marketing_qualified_leads` | 8,000 | Lead origin, first contact date, landing page |
| `closed_deals` | 842 | Won deals with business segment, lead type, revenue |

See `data/README.md` for download instructions.

## Objective
Map the acquisition funnel from lead generation to closed deal, calculate stage-by-stage drop-off rates, segment conversion performance by channel, and recommend where to focus acquisition spend for maximum efficiency.

## Tools Used
- SQL (PostgreSQL 18) — joins, CTEs, window functions, funnel calculations
- Power BI (dashboard — in progress)

## Approach
1. Loaded and explored two datasets: marketing qualified leads and closed deals
2. Joined on `mql_id` to map each lead's journey from first contact to deal outcome
3. Calculated overall funnel conversion rate and drop-off at each stage
4. Segmented conversion rate and drop-off by marketing channel/origin
5. Analyzed monthly conversion trends to identify performance inflection points
6. Calculated sales cycle length by business segment
7. Assigned channel priority tiers based on conversion efficiency

## Key Findings

### Overall Funnel
| Metric | Value |
|---|---|
| Total Leads | 8,000 |
| Total Closed | 842 |
| Total Lost | 7,158 |
| Overall Conversion Rate | 10.53% |

### Conversion Rate by Channel
| Channel | Leads | Won | Conversion % | Priority |
|---|---|---|---|---|
| paid_search | 1,586 | 195 | 12.30% | High — Scale Up |
| organic_search | 2,296 | 271 | 11.80% | High — Scale Up |
| direct_traffic | 499 | 56 | 11.22% | High — Scale Up |
| social | 1,350 | 75 | 5.56% | Medium — Optimize |
| email | 493 | 15 | 3.04% | Low — Reduce Spend |

### Monthly Conversion Trend
Conversion rate stayed below 6% throughout 2017, then jumped to 13.32% in January 2018 and sustained above 13% through April 2018 — suggesting a significant process or strategy change in early 2018.

## Key Insight
> *"Paid search converts at 12.3% — 2.2x higher than social (5.56%) despite similar lead volume. Email performs worst at 3.04% conversion with a 96.96% drop-off rate. A dramatic conversion improvement from below 6% in 2017 to above 13% in early 2018 suggests a process change whose drivers should be identified and standardized across all channels."*

## Recommendation to Stakeholders
> *"Reallocate budget from email (96.96% drop-off) and social (94.44% drop-off) toward paid search and direct traffic which show the strongest conversion efficiency. Investigate the January 2018 conversion spike — if the driver is replicable, standardizing it could lift overall conversion from 10.5% toward the 13%+ range sustained in early 2018. Flag health_beauty data quality issue where won_date precedes first_contact_date in some records."*

## SQL Concepts Demonstrated
- LEFT JOIN across two tables on a shared key (`mql_id`)
- Window functions (`SUM() OVER()`) for portfolio percentage calculations
- `DATE_TRUNC()` for monthly time series aggregation
- `NULLIF()` to handle division-by-zero safely
- `CASE` statements for channel priority classification
- CTEs for multi-step funnel logic

## Repo Structure
```
├── data/            → dataset source info and download instructions
├── queries/
│   ├── 00_create_tables.sql
│   ├── 01_data_exploration.sql
│   ├── 02_funnel_conversion.sql
│   └── 03_funnel_drop_off.sql
├── images/          → dashboard screenshots
└── README.md
```
