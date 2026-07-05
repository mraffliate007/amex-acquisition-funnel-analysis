-- 00_create_tables.sql
-- Create tables for acquisition funnel analysis

CREATE TABLE marketing_qualified_leads (
    mql_id VARCHAR(50) PRIMARY KEY,
    first_contact_date DATE,
    landing_page_id VARCHAR(50),
    origin VARCHAR(50)
);

CREATE TABLE closed_deals (
    mql_id VARCHAR(50),
    seller_id VARCHAR(50),
    sdr_id VARCHAR(50),
    sr_id VARCHAR(50),
    won_date DATE,
    business_segment VARCHAR(100),
    lead_type VARCHAR(50),
    lead_behaviour_profile VARCHAR(50),
    has_company VARCHAR(10),
    has_gtin VARCHAR(10),
    average_stock VARCHAR(50),
    business_type VARCHAR(50),
    declared_product_catalog_size NUMERIC,
    declared_monthly_revenue NUMERIC
);