-- GENERAL DASHBOARD

-- 1. What is the total number of customers?
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM credit_card_data;


-- 2. What is the total interest earned?
SELECT SUM(interest_earned) AS total_interest
FROM credit_card_data;


-- 3. What is the average customer acquisition cost?
SELECT AVG(customer_acq_cost) AS avg_acq_cost
FROM credit_card_data;


-- 4. What is the total credit amount?
SELECT SUM(credit_limit) AS total_credit
FROM credit_card_data;


-- 5. What is the average annual fee?
SELECT AVG(annual_fee) AS avg_annual_fee
FROM credit_card_data;


-- 6. What is the total revolving balance?
SELECT SUM(revolving_balance) AS total_revolving_balance
FROM credit_card_data;


-- 7. What is the average credit limit?
SELECT AVG(credit_limit) AS avg_credit_limit
FROM credit_card_data;


-- 8. What is the average transaction volume?
SELECT AVG(transaction_amount) AS avg_transaction_volume
FROM credit_card_data;

-- 9. What is the average income?
SELECT AVG(income) AS avg_income
FROM credit_card_data;

-- 10. What is the average age?
SELECT AVG(age) AS avg_age
FROM credit_card_data;

-- 11. How many customers are there by quarter?
SELECT 
    QUARTER(transaction_date) AS quarter,
    COUNT(DISTINCT customer_id) AS customer_count
FROM credit_card_data
GROUP BY quarter
ORDER BY quarter;

-- 12. What is the distribution of customers by use chip?
SELECT use_chip, COUNT(*) AS customer_count
FROM credit_card_data
GROUP BY use_chip;

-- 13. What is the distribution of customers by card category?
SELECT card_category, COUNT(*) AS customer_count
FROM credit_card_data
GROUP BY card_category;

-- 14. What is the distribution of customers by education level?
SELECT education_level, COUNT(*) AS customer_count
FROM credit_card_data
GROUP BY education_level
ORDER BY customer_count DESC;


-- RISK DASHBOARD

-- 15. What is the count of customers by risk segmentation?
SELECT risk_segmentation, COUNT(*) AS count_customers
FROM credit_card_data
GROUP BY risk_segmentation;

-- 16. What is risk distribution by use chip?
SELECT risk_segmentation, use_chip, COUNT(*) AS count_customers
FROM credit_card_data
GROUP BY risk_segmentation, use_chip;

-- 17. What is risk distribution by card category?
SELECT card_category, risk_segmentation, COUNT(*) AS count_customers
FROM credit_card_data
GROUP BY card_category, risk_segmentation;

-- 18. What is the total count of customers by personal loan status?
SELECT personal_loan, COUNT(*) AS count_customers
FROM credit_card_data
GROUP BY personal_loan;

-- 19. How many high-risk customers exist?
SELECT COUNT(*) AS high_risk_customers
FROM credit_card_data
WHERE risk_segmentation = 'High Risk';

-- 20. What percentage of customers are high risk?
SELECT 
    COUNT(CASE WHEN risk_segmentation = 'High Risk' THEN 1 END) * 100.0 / COUNT(*) AS high_risk_percentage
FROM credit_card_data;


-- INTEREST DASHBOARD

-- 21. What is the interest earned by risk segmentation?
SELECT risk_segmentation, SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY risk_segmentation;

-- 22. What is the trend of interest earned over time?
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY month
ORDER BY month;


-- 23. What is the interest earned by card category?
SELECT card_category, SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY card_category;

-- 24. What is the interest earned by use chip?
SELECT use_chip, SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY use_chip;

-- 25. What is the interest earned by expenditure type?
SELECT expenditure_type, SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY expenditure_type
ORDER BY total_interest DESC;

-- 26. Which card category generates the highest interest?
SELECT card_category, SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY card_category
ORDER BY total_interest DESC
LIMIT 1;

-- 27. Which segment is most profitable (low risk vs high risk)?
SELECT risk_segmentation, 
       SUM(interest_earned) AS total_interest
FROM credit_card_data
GROUP BY risk_segmentation
ORDER BY total_interest DESC;