WITH RankedSalaries AS (
    SELECT D.name AS Department,
           E.name AS Employee,
           E.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY D.id ORDER BY E.salary DESC) AS Rk
    FROM Employee E
    LEFT JOIN Department D ON E.departmentId = D.id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE Rk<4;
