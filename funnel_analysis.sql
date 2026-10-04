-- ================================================================================
-- CASE STUDY QUERIES: 02_FUNNEL_ANALYSIS
-- Project Domain: E-Commerce & Retail Business Intelligence
-- Target Platform: Google Cloud BigQuery Standard SQL
-- Data Source Path: `insightengine-sql-analytics.raw_ecommerce.web_events`
-- ================================================================================
-- Business Goal: 
-- Map out the user conversion funnel stages chronologically to identify where 
-- friction occurs and calculate precise abandonment volumes.
-- ================================================================================

WITH funnel_stages AS (
  SELECT
    -- Step 1: Base traffic layer
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS step1_views,
    
    -- Step 2: Product engagement layer
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS step2_carts,
    
    -- Step 3: Checkout intent layer
    COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS step3_checkouts,
    
    -- Step 4: Transaction readiness layer
    COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS step4_payments,
    
    -- Step 5: Final conversion success layer
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS step5_purchases
  FROM 
    `insightengine-sql-analytics.raw_ecommerce.web_events`
)

-- Flatten the wide dataset rows into a chronological, scannable funnel report
SELECT 
  '1. Product Page View' AS funnel_step, 
  step1_views AS user_count, 
  NULL AS dropped_users, 
  NULL AS conversion_drop_rate_pct 
FROM funnel_stages

UNION ALL

SELECT 
  '2. Add to Cart', 
  step2_carts, 
  (step1_views - step2_carts), 
  ROUND((1 - (step2_carts / step1_views)) * 100, 2) 
FROM funnel_stages

UNION ALL

SELECT 
  '3. Checkout Start', 
  step3_checkouts, 
  (step2_carts - step3_checkouts), 
  ROUND((1 - (step3_checkouts / step2_carts)) * 100, 2) 
FROM funnel_stages

UNION ALL

SELECT 
  '4. Payment Info', 
  step4_payments, 
  (step3_checkouts - step4_payments), 
  ROUND((1 - (step4_payments / step3_checkouts)) * 100, 2) 
FROM funnel_stages

UNION ALL

SELECT 
  '5. Final Purchase', 
  step5_purchases, 
  (step4_payments - step5_purchases), 
  ROUND((1 - (step5_purchases / step4_payments)) * 100, 2) 
FROM funnel_stages;
