SELECT 
  s.plan_id,s.owner_id,
  CASE WHEN is_regular_savings = 1 THEN 'savings'
  ELSE 'investment'
  END AS type,
  MAX(transaction_date) AS last_transaction_date,
  DATEDIFF(CURDATE(), MAX(transaction_date)) AS days_since_last_transaction
FROM savings_savingsaccount s
JOIN plans_plan p
  ON p.id = s.plan_id
GROUP BY s.plan_id, s.owner_id
HAVING last_transaction_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
