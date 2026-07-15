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