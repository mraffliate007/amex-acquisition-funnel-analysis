-- 03_funnel_drop_off.sql

-- 1. Leads that never converted — by channel
SELECT
    m.origin,
    COUNT(m.mql_id)                          AS total_leads,
    COUNT(c.mql_id)                          AS converted,
    COUNT(m.mql_id) - COUNT(c.mql_id)        AS lost,
    ROUND((COUNT(m.mql_id) - COUNT(c.mql_id)) 
          * 100.0 / COUNT(m.mql_id), 2)      AS drop_off_rate_pct
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c ON m.mql_id = c.mql_id
GROUP BY m.origin
ORDER BY drop_off_rate_pct DESC;

-- 2. Time from first contact to deal won (sales cycle length)
SELECT
    c.business_segment,
    ROUND(AVG(c.won_date - m.first_contact_date), 1) AS avg_days_to_close,
    MIN(c.won_date - m.first_contact_date)            AS fastest_close,
    MAX(c.won_date - m.first_contact_date)            AS slowest_close,
    COUNT(*)                                           AS total_deals
FROM closed_deals c
JOIN marketing_qualified_leads m ON c.mql_id = m.mql_id
GROUP BY c.business_segment
ORDER BY avg_days_to_close ASC
LIMIT 10;

-- 3. High value channel summary for stakeholder presentation
SELECT
    m.origin                                          AS channel,
    COUNT(m.mql_id)                                   AS total_leads,
    COUNT(c.mql_id)                                   AS total_won,
    ROUND(COUNT(c.mql_id) * 100.0 / 
          NULLIF(COUNT(m.mql_id), 0), 2)              AS conversion_rate_pct,
    CASE
        WHEN ROUND(COUNT(c.mql_id) * 100.0 / 
             NULLIF(COUNT(m.mql_id), 0), 2) >= 10 
             THEN 'High Priority — Scale Up'
        WHEN ROUND(COUNT(c.mql_id) * 100.0 / 
             NULLIF(COUNT(m.mql_id), 0), 2) >= 5  
             THEN 'Medium Priority — Optimize'
        ELSE 'Low Priority — Reduce Spend'
    END AS recommended_action
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c ON m.mql_id = c.mql_id
GROUP BY m.origin
ORDER BY conversion_rate_pct DESC;