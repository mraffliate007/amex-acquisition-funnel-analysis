-- 02_funnel_conversion.sql

-- 1. Core funnel: join leads to closed deals and calculate conversion by channel
SELECT
    m.origin,
    COUNT(m.mql_id)                          AS total_leads,
    COUNT(c.mql_id)                          AS total_won,
    ROUND(COUNT(c.mql_id) * 100.0 / 
          NULLIF(COUNT(m.mql_id), 0), 2)     AS conversion_rate_pct,
    ROUND(COUNT(m.mql_id) * 1.0 / 
          NULLIF(COUNT(c.mql_id), 0), 2)     AS leads_per_deal
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c ON m.mql_id = c.mql_id
GROUP BY m.origin
ORDER BY conversion_rate_pct DESC;

-- 2. Overall funnel summary
SELECT
    COUNT(DISTINCT m.mql_id)                 AS total_leads,
    COUNT(DISTINCT c.mql_id)                 AS total_closed,
    COUNT(DISTINCT m.mql_id) - 
    COUNT(DISTINCT c.mql_id)                 AS total_lost,
    ROUND(COUNT(DISTINCT c.mql_id) * 100.0 / 
          COUNT(DISTINCT m.mql_id), 2)       AS overall_conversion_pct
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c ON m.mql_id = c.mql_id;

-- 3. Monthly conversion trend
SELECT
    DATE_TRUNC('month', m.first_contact_date) AS month,
    COUNT(m.mql_id)                            AS leads,
    COUNT(c.mql_id)                            AS won,
    ROUND(COUNT(c.mql_id) * 100.0 / 
          NULLIF(COUNT(m.mql_id), 0), 2)       AS conversion_rate_pct
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c ON m.mql_id = c.mql_id
GROUP BY month
ORDER BY month;

-- 4. Best converting business segments
SELECT
    c.business_segment,
    COUNT(*)                                   AS total_won,
    ROUND(AVG(c.declared_monthly_revenue)::NUMERIC, 2) AS avg_declared_revenue
FROM closed_deals c
GROUP BY c.business_segment
ORDER BY total_won DESC
LIMIT 10;