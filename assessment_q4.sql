SELECT customer_id, full_name,tenure_months,total_transactions, 
total_transactions*12*profit_per_transaction AS estimated_clv
FROM
(SELECT 
    u.id AS customer_id, 
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    AVG(s.amount) AS avg_amount,
    0.001 * AVG(s.amount) AS profit_per_transaction
  FROM users_customuser u
  JOIN savings_savingsaccount s ON u.id = s.owner_id 
  GROUP BY customer_id, full_name) AS clv