CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

INSERT INTO employee_table (employee, salary) VALUES
('Alice', 11),
('Benn', 43),
('Charles', 33),
('Dorothy', 55),
('Emma', 22),
('Franklin', 33);
    
SELECT DISTINCT salary FROM (
  SELECT salary, 
  	DENSE_RANK() OVER(ORDER BY salary DESC) AS ranking
    FROM employee_table
) AS highest_salary
WHERE ranking = 3;