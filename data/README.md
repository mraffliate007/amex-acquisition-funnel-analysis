# Dataset Info

**Name:** Marketing Funnel by Olist
**Source:** [Kaggle - olistbr/marketing-funnel-olist](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist)
**Files:** `olist_marketing_qualified_leads_dataset.csv`, `olist_closed_deals_dataset.csv`

## How to use
1. Download both CSVs from the Kaggle link above (free Kaggle account required)
2. Place them in this `data/` folder or load into your SQL environment
3. Join on `mql_id` to link leads to deal outcomes

## Why it's not committed directly
This raw dataset is sourced from a public Kaggle dataset and is linked here rather than duplicated in this repo, in line with standard data project practice.

## Columns (summary)

**olist_marketing_qualified_leads_dataset.csv**
| Column | Description |
|---|---|
| mql_id | Unique lead identifier |
| first_contact_date | Date of first contact |
| landing_page_id | Landing page where lead originated |
| origin | Marketing channel (organic search, paid search, social etc.) |

**olist_closed_deals_dataset.csv**
| Column | Description |
|---|---|
| mql_id | Links back to the lead |
| seller_id | Seller onboarded as result of the deal |
| won_date | Date the deal was won |
| business_segment | Business category of the seller |
| lead_type | Type of lead (online, offline etc.) |
