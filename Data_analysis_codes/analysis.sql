CREATE TABLE customer_shopping_behavior (
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(50),
    category VARCHAR(50),
    purchase_amount_usd INT,
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(30),
    season VARCHAR(20),
    review_rating DECIMAL(3,1),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(30),
    discount_applied VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(30),
    frequency_of_purchases VARCHAR(30),
    age_group VARCHAR(20)
);

SELECT *
FROM customer_shopping_behavior
LIMIT 5;

--OVERALL BUSINESS KPI
SELECT
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase_amount,
    ROUND(AVG(review_rating), 2) AS avg_review_rating
FROM customer_shopping_behavior;


--Which product category generates the highest total revenue?
SELECT 
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM customer_shopping_behavior
GROUP BY category
ORDER BY total_revenue DESC;


--WHICH ITEM GENRATED MORE REVENUE
SELECT
    item_purchased,
    SUM(purchase_amount_usd) AS total_revenue
FROM customer_shopping_behavior
GROUP BY item_purchased
ORDER BY total_revenue DESC
LIMIT 10;

--Which locations generate the highest total revenue?
SELECT
    location,
    SUM(purchase_amount_usd) AS total_revenue
FROM customer_shopping_behavior
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;

--REVENUE BY AGE GROUPS CREATED
SELECT
    age_group,
    SUM(purchase_amount_usd) AS total_revenue
FROM customer_shopping_behavior
GROUP BY age_group
ORDER BY total_revenue DESC;

--How does sales performance differ by gender?
SELECT
    gender,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase_amount
FROM customer_shopping_behavior
GROUP BY gender
ORDER BY total_revenue DESC;

--Subscription Analysis
SELECT 
   subscription_status,
   COUNT(*) AS TOTAL_SUBSCRIBERS,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase_amount
FROM customer_shopping_behavior
GROUP BY subscription_status
ORDER BY total_revenue DESC;


