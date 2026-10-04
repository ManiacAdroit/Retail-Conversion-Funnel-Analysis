-- ================================================================================
-- CASE STUDY QUERIES: 03_USER_ENGAGEMENT
-- Project Domain: E-Commerce & Retail Business Intelligence
-- Target Platform: Google Cloud BigQuery Standard SQL
-- Data Source Path: `insightengine-sql-analytics.raw_ecommerce.web_events`
-- ================================================================================
-- Business Goal: 
-- Measure customer velocity and behavior intensity by calculating the total 
-- number of site interactions recorded by converting users before buying.
-- ================================================================================

WITH buyer_journey AS (
  SELECT 
    user_id,
    -- Count every single event row recorded for this specific user
    COUNT(event_id) AS total_touchpoints
  FROM 
    `insightengine-sql-analytics.raw_ecommerce.web_events`
  WHERE 
    user_id IN (
      -- Subquery filter: Only isolate users who have a confirmed purchase event
      SELECT DISTINCT user_id 
      FROM `insightengine-sql-analytics.raw_ecommerce.web_events` 
      WHERE event_type = 'purchase'
    )
  GROUP BY 
    user_id
)
SELECT 
  -- Find the absolute boundary metrics and the baseline average across converting users
  MIN(total_touchpoints) AS min_actions_before_purchase,
  MAX(total_touchpoints) AS max_actions_before_purchase,
  ROUND(AVG(total_touchpoints), 1) AS avg_actions_before_purchase
FROM 
  buyer_journey;
