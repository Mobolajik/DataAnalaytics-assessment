SELECT 
  frequency_category,
  COUNT(*) AS customer_count,
  AVG(transaction_count) AS avg_transaction_per_month
FROM (
  SELECT 
    u.id,DATE_FORMAT(s.transaction_date, '%Y-%m') AS monthly,
    COUNT(*) AS transaction_count,
    CASE
      WHEN COUNT(*) <= 2 THEN 'low _frequency'
      WHEN COUNT(*) BETWEEN 3 AND 9 THEN 'middle_frequency'
      WHEN COUNT(*) >= 10 THEN 'high_frequency'
	
    END AS frequency_category
  FROM savings_savingsaccount s
  JOIN users_customuser u
  on u.id = s.owner_id
  GROUP BY u.id,monthly
) AS categorized

GROUP BY frequency_category
ORDER BY avg_transaction_per_month
