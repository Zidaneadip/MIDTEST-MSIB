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

SELECT * FROM pegawai;

SELECT employee, salary
FROM employee_table
WHERE salary = (
    SELECT DISTINCT salary
    FROM employee_table
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2
);