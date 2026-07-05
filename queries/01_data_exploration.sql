-- 01_data_exploration.sql

-- 1. Check lead origins (marketing channels)
SELECT
    origin,
    COUNT(*) AS total_leads,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_leads
FROM marketing_qualified_leads
GROUP BY origin
ORDER BY total_leads DESC;

-- 2. Check closed deals by business segment
SELECT
    business_segment,
    COUNT(*) AS total_won,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_won
FROM closed_deals
GROUP BY business_segment
ORDER BY total_won DESC;

-- 3. Check lead types in closed deals
SELECT
    lead_type,
    COUNT(*) AS total_won
FROM closed_deals
GROUP BY lead_type
ORDER BY total_won DESC;

-- 4. Monthly lead volume trend
SELECT
    DATE_TRUNC('month', first_contact_date) AS month,
    COUNT(*) AS leads_generated
FROM marketing_qualified_leads
GROUP BY month
ORDER BY month;