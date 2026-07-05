# Amex Acquisition Funnel Analysis

## Business Problem
Acquiring new customers efficiently requires understanding where prospects drop off between initial contact and conversion, and which channels deliver the best return per acquisition. This project analyzes a marketing-to-sales funnel to identify drop-off points and channel efficiency, mirroring acquisition analytics used to optimize digital targeting and personalization strategies.

## Dataset
**Source:** [Marketing Funnel by Olist](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist) (Kaggle, by olistbr)
Tracks marketing qualified leads (MQLs) through to closed deals, including lead origin, sales rep assignment, and deal outcome. See `data/README.md` for download instructions.

## Objective
Map the acquisition funnel from lead generation to closed deal, calculate stage-by-stage drop-off rates, segment performance by lead origin/channel, and recommend where to focus acquisition spend.

## Tools Used
- SQL (joins, CTEs, funnel stage calculations)
- Power BI / Tableau (funnel visualization, channel comparison dashboard)

## Approach
1. Joined MQL and closed deal datasets on lead ID
2. Calculated conversion rate at each funnel stage (lead → qualified → won)
3. Segmented drop-off and conversion rate by lead origin/channel
4. Built a dashboard to visualize funnel shape and channel-level efficiency

## Key Insight
> *[Fill in once analysis is done — e.g., "Organic search leads convert at 2x the rate of paid social leads, but paid social generates 3x the lead volume — suggesting a blended strategy outperforms over-indexing on either channel alone."]*

## Recommendation to Stakeholders
> *[Fill in — e.g., "Reallocate 15% of paid social budget to organic/referral channels showing higher down-funnel conversion, while testing improved lead qualification criteria for paid channels."]*

## Repo Structure
```
├── data/            → dataset source info
├── queries/         → SQL scripts
├── dashboard/       → Power BI/Tableau files
├── images/          → screenshots
└── README.md
```
