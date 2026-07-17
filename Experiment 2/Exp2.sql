------------------------(A)
SELECT 
    d.dept_name,
    ROUND(AVG(m.marks_scored), 2) AS "Average Marks"
FROM 
    Departments1 d
JOIN 
    Students1 s ON d.dept_id = s.dept_id
JOIN 
    Marks1 m ON s.student_id = m.student_id
GROUP BY 
    d.dept_name
ORDER BY 
    "Average Marks" DESC;


----------------(B)
SELECT 
    d.dept_name AS "Department Name",
    e.name AS "Employee Name",
    e.salary AS "Salary"
FROM 
    Employee2 e
JOIN 
    Department2 d ON e.department_id = d.id
WHERE 
    (e.department_id, e.salary) IN (
        SELECT department_id, MAX(salary)
        FROM Employee2
        GROUP BY department_id
    )
ORDER BY 
    d.dept_name ASC;


-------------------------(C)
SELECT
  d.dept_name,
  e.name,
  e.salary
FROM employee_02 e
JOIN department_02 d
ON e.department_id = d.id
WHERE e.salary =
(
    SELECT MAX(salary)
    FROM employee_02
    WHERE department_id = e.department_id
    AND salary <
    (
      SELECT MAX(salary)
      FROM employee_02
      WHERE department_id = e.department_id
    )
)
ORDER BY d.dept_name;


------------------------(D)
SELECT EmpID, Ename, Salary FROM A
UNION ALL
SELECT EmpID, Ename, Salary FROM B
WHERE NOT EXISTS (
    SELECT 1 FROM A WHERE A.EmpID = B.EmpID
);
