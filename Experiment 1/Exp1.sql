--------(A)
SELECT 'LOW SALARY' AS CATEGORY, COUNT(account_id) AS ACCOUNT_COUNT
FROM Accounts
WHERE INCOME<20000
UNION ALL
SELECT 'AVERAGE SALARY' AS CATEGORY, COUNT(account_id) AS ACCOUNT_COUNT
FROM Accounts
WHERE INCOME>20000 AND INCOME<50000
UNION ALL
SELECT 'HIGH SALARY' AS CATEGORY, COUNT(account_id) AS ACCOUNT_COUNT
FROM Accounts
WHERE INCOME>50000;


--------(B)
SELECT E.*, D.*, S.*
FROM 
EMPLOYEES AS E 
JOIN 
DEPARTMENTS AS D
ON 
E.DEPT_ID = D.DEPT_ID 
JOIN 
SALARIES AS S 
ON 
E.EMP_ID  = S.EMP_ID; 


UPDATE SALARIES 
SET SALARY = SALARY + SALARY * 0.10 
WHERE EMP_ID 
IN
(
SELECT E.EMP_ID 
FROM 
EMPLOYEES AS E 
JOIN 
DEPARTMENTS AS D 
ON 
E.DEPT_ID = D.DEPT_ID 
WHERE D.DEPT_NAME = 'HR'
);


SELECT E.EMP_ID 
FROM 
EMPLOYEES AS E 
JOIN 
SALARIES AS S 
ON 
E.EMP_ID = S.EMP_ID
WHERE S.SALARY >  (SELECT AVG(SALARY) FROM SALARIES);


-------(C)
SELECT
CONCAT_WS(', ',
t1.topping_name,
t2.topping_name,
t3.topping_name) AS pizza,
(t1.ingredient_cost+
t2.ingredient_cost+
t3.ingredient_cost) AS total_cost
FROM pizza_toppings t1
JOIN pizza_toppings t2
ON t1.topping_name<t2.topping_name
JOIN pizza_toppings t3
ON t2.topping_name<t3.topping_name
ORDER BY total_cost DESC,
pizza;


------(D)
SELECT DISTINCT
t1.user_id
FROM amazon_transactions t1
JOIN amazon_transactions t2
ON t1.user_id=t2.user_id
AND t2.created_at>t1.created_at
AND t2.created_at<=
t1.created_at+INTERVAL '7 days'
ORDER BY user_id;
