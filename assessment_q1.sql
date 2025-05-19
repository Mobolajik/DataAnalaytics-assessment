SELECT *
FROM (
    SELECT 
      CONCAT(u.first_name, ' ', u.last_name) AS name,
      SUM(p.is_regular_savings) AS savings_count,
      SUM(p.is_a_fund) AS total_funds,
      SUM(s.amount) AS total_amount
    FROM savings_savingsaccount s
    JOIN users_customuser u ON u.id = s.owner_id
    JOIN plans_plan p ON p.id = s.plan_id
    GROUP BY u.id, name
) AS summary
WHERE savings_count > 1
  AND total_funds = 1;