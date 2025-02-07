参考文档：https://blog.csdn.net/aiwodefangzhuer/article/details/137381918
压缩包已经上传到teams了，可直接从【安装Oracle】开始往下看

connect sys/password as sysdba. password

connect sys/123456 as sysdba. password

sys ： change_on_install
system ： manager

select tablespace_name from dba_tablespaces;

select username from dba_users;

ALTER SESSION SET CURRENT_SCHEMA = target_schema_name;

ALTER SESSION SET CURRENT_SCHEMA = hr;

select * from imformatiom_schema.table where table_schema='HR';
SELECT table_name FROM all_tables WHERE owner = 'HR';

--CREATE TABLE`报错“SQL 错误 【1950】 【42000】: ORA-01950: 对表空间 'USERS' 无权限”，帮大家趟过了，执行下这句就ok。
--alter user SCOTT quota unlimited on users;

oracle 如何查看当前用户的表空间名称
SELECT * FROM dba_data_files order by file_id;
SELECT * FROM dba_temp_files order by file_id;

--查询语法--
 select * from dba_users where username='SYSTEM';
 
1）查询当前用户表空间
/* 查看用户所属的表空间 */

 select default_tablespace from dba_users where username='登录用户';

2）查询所有表空间
/*查看所有的表空间 */
   -- 1 ）方式1：dba_tablespaces --
   select * from dba_tablespaces;
    --2 ）方式2：v$tablespace --
   select * from v$tablespace;

3）查询用户下所有表
/* 查看用户下面的所有的表 */ 
  -- 1 ）方式1：user_tables --
   select * from user_tables;
   --2 ）方式2: dba_tables --
   select * from dba_tables where owner='登录用户';

4）查询表空间下的用户
/*查看表空间下有多少用户，tablespace_name表空间 的名字一定要大写 */
   select distinct s.owner from dba_segments s where s.tablespace_name ='登录用户';



SELECT  DISTINCT department_id FROM employees;

SELECT * FROM employees WHERE first_name LIKE 'J%';

SELECT * FROM employees ORDER BY last_name ASC;

SELECT department_id FROM employees GROUP BY department_id;

SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;

SELECT department_id, COUNT(*) FROM employees GROUP BY department_id HAVING COUNT(*) > 5;

SELECT department_id, COUNT(*) AS num_employees, AVG(salary) AS avg_salary FROM employees GROUP BY department_id;


SELECT d.department_name, COUNT(e.employee_id) 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT e1.first_name AS Employee, e2.first_name AS Manager
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;



--26. 显示所有员工的员工名和部门名
SELECT first_name, (SELECT department_name FROM departments WHERE department_id = e.department_id) AS dept_name
FROM employees e;


--27. 显示部门名为‘Sales’的所有员工信息
SELECT * FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Sales');


--28. 显示工资高于部门平均工资员工的部门ID以及其平均工资
--SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id;
SELECT first_name, salary,department_id
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id) ORDER BY department_id;

--29. 显示IT部门的员工的名字
SELECT first_name FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d WHERE d.department_id = e.department_id AND d.department_name = 'IT');

SELECT* FROM departments d WHERE d.department_name = 'IT'

--30. 显示不属于IT部门的员工的名字
SELECT first_name FROM employees e
WHERE NOT EXISTS (SELECT 1 FROM departments d WHERE d.department_id = e.department_id AND d.department_name = 'IT');

SELECT department_id
  FROM departments d
  WHERE EXISTS
  (SELECT 1 FROM employees e
    WHERE d.department_id 
    = e.department_id)
   ORDER BY department_id;
   

--34. Insert Data from Another Table
INSERT INTO employees_backup (employee_id, first_name, last_name, department_id, salary)
SELECT employee_id, first_name, last_name, department_id, salary FROM employees;

--35. 部门名为'Sales'的员工工资增加1.1%
UPDATE employees e
SET e.salary = e.salary * 1.1
WHERE e.department_id = (SELECT department_id FROM departments WHERE department_name = 'Sales');

--36. CASE Statement
SELECT first_name, salary,
CASE 
    WHEN salary < 40000 THEN 'Low'
    WHEN salary BETWEEN 40000 AND 60000 THEN 'Medium'
    ELSE 'High'
END AS salary_grade
FROM employees;

--37. DECODE Function
SELECT first_name, salary,
DECODE(department_id, 10, 'Sales', 20, 'Marketing', 'Other') AS department_name
FROM employees;


--38. Union of Two Queries
SELECT first_name FROM employees WHERE department_id = 10
UNION
SELECT first_name FROM employees WHERE department_id = 20;


--39. Union All of Two Queries
SELECT first_name FROM employees WHERE department_id = 10
UNION ALL
SELECT first_name FROM employees WHERE department_id = 20;


SELECT  department_id FROM employees WHERE employee_id like '1%'
UNION 
SELECT  department_id FROM employees WHERE employee_id like '2%';

--40. Intersect of Two Queries
SELECT first_name FROM employees WHERE department_id = 10
INTERSECT
SELECT first_name FROM employees WHERE department_id = 20;

--41. Minus of Two Queries
SELECT first_name FROM employees WHERE department_id = 10
MINUS
SELECT first_name FROM employees WHERE department_id = 20;


SELECT  department_id FROM employees WHERE employee_id like '1%'
INTERSECT 
SELECT  department_id FROM employees WHERE employee_id like '2%';

SELECT  department_id FROM employees WHERE employee_id like '1%'
MINUS 
SELECT  department_id FROM employees WHERE employee_id like '2%';


--42. Row Limiting with ROWNUM
查询薪水最高的员工的前10条记录，ROWNUM从1开始
SELECT * FROM (SELECT * FROM employees ORDER BY salary DESC) WHERE ROWNUM <= 10;


--exercise
select * from hr.employees e where rownum<=5
查出薪水最高的5-10条数据
select * from
(select rownum r, e1.* from
  (
   select e.* from hr.employees e  order by e.salary desc
  ) e1
) e2 where e2.r >=5 and e2.r<=10


--43. Row Limiting with FETCH FIRST
--SELECT * FROM employees ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY;  --oracle do not support

--Here are two alternatives:
--1. Using ROWNUM
SELECT * FROM (SELECT * FROM employees ORDER BY salary DESC) WHERE ROWNUM <= 10;

--2. Using ROW_NUMBER() with a Common Table Expression (CTE)
WITH ranked_employees AS (
    SELECT e.*, ROW_NUMBER() OVER (ORDER BY e.salary DESC) AS rnk
    FROM employees e
)
SELECT *
FROM ranked_employees
WHERE rnk <= 10;

--String Functions
--45. Substring Function
SELECT first_name FROM employees;
SELECT SUBSTR(first_name, 1, 3) AS short_name FROM employees;

--46. Length of a String
SELECT LENGTH(first_name) AS name_length FROM employees;

--47.Uppercase Conversion
SELECT UPPER(first_name) AS upper_name FROM employees;

--48. Lowercase Conversion
SELECT LOWER(first_name) AS lower_name FROM employees;

--49. Replace Function   --do not change raw data
SELECT REPLACE(first_name, 'J', 'L') AS modified_name FROM employees; 

--50. Trim Function
SELECT TRIM(first_name) AS trimmed_name FROM employees;
SELECT TRIM(name) AS trimmed_name FROM hero;
select * from hero;

--Date Functions
--51. Current Date
SELECT SYSDATE FROM dual;

--54. Extract Year from Date
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year FROM employees;
SELECT EXTRACT(HOUR FROM hire_date) AS hire_year FROM employees;


SELECT hire_date AS hire_year FROM employees;

--55. Format Date
SELECT TO_CHAR(hire_date, 'YYYY-MM-DD') AS formatted_date FROM employees;

--56. Calculate Date Difference
SELECT hire_date, SYSDATE - hire_date AS days_in_service FROM employees;

--57. First Day of the Month
SELECT TRUNC(SYSDATE, 'MM') AS first_day_of_month FROM dual;

WITH dates AS (   
  SELECT date'2015-01-01' d FROM dual union   
  SELECT date'2015-01-10' d FROM dual union   
  SELECT date'2015-02-01' d FROM dual union   
  SELECT timestamp'2015-03-03 23:45:00' d FROM dual union   
  SELECT timestamp'2015-04-11 12:34:56' d FROM dual    
)   
SELECT d "Original Date",   
       trunc(d) "Nearest Day, Time Removed",   
       trunc(d, 'ww') "Nearest Week", 
       trunc(d, 'iw') "Start of Week",   
       trunc(d, 'mm') "Start of Month",   
       trunc(d, 'year') "Start of Year"   
FROM dates;


SELECT TRUNC(TO_DATE('2015-08-18 23:45:00','YY-MM-DD hh24:mi:ss'),'MM') "New Year" FROM DUAL;

--58. Last Day of the Month
SELECT LAST_DAY(SYSDATE) AS last_day_of_month FROM dual;

Number Functions
--59. Round a Number
SELECT ROUND(salary, 2) AS rounded_salary FROM employees;

--ROUND(n, integer) = FLOOR(n * POWER(10, integer) + 0.5) * POWER(10, -integer)

--60. Truncate a Number
SELECT TRUNC(salary, 2) AS truncated_salary FROM employees;

SELECT TRUNC(15.79,1) "Truncate" FROM DUAL;

SELECT TRUNC(15.79,-1) "Truncate" FROM DUAL;

SELECT TRUNC(15.79) "Truncate" FROM DUAL;


--61. Square Root of a Number
SELECT SQRT(salary) AS sqrt_salary FROM employees;

SELECT SQRT(16) "SQRT" FROM DUAL;

--62. Absolute Value
SELECT ABS(salary - 50000) AS diff_from_50000 FROM employees;

SELECT ABS(1000-50000) "diff_from_50000" FROM DUAL;

--63. Power of a Number
SELECT POWER(salary, 2) AS salary_squared FROM employees;

SELECT POWER(2,10) "POWER" FROM DUAL;

Data Definition Language (DDL)
--64. Create Table
CREATE TABLE new_employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    hire_date DATE,
    salary NUMBER
);

--65. Drop Table
DROP TABLE new_employees;

select * from new_employees;

--66. Alter Table - Add Column
ALTER TABLE new_employees ADD (email VARCHAR2(100));

--67. Alter Table - Modify Column
ALTER TABLE new_employees MODIFY (salary NUMBER(10, 2));


--68. Alter Table - Drop Column
ALTER TABLE new_employees DROP COLUMN email;

--69. Create Index
CREATE INDEX idx_department ON employees(department_id);

--70. DROP INDEX idx_department;
DROP INDEX idx_department;

--71. Create View
CREATE VIEW high_salary_employees AS
SELECT first_name, salary FROM employees WHERE salary > 60000;

SELECT * FROM high_salary_employees

--72. Drop View
DROP VIEW high_salary_employees;

--73. Create Synonym
CREATE SYNONYM emp_synonym FOR employees;

--74. Drop Synonym
DROP SYNONYM emp_synonym;


User Management
--75. Create User
CREATE USER new_user IDENTIFIED BY password;

--76. Grant Privileges
GRANT CREATE, SELECT, INSERT ON new_employees TO new_user;


GRANT dba to new_user;

CREATE TABLE new_user.new2_employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    hire_date DATE,
    salary NUMBER
)

--77. Revoke Privileges
--REVOKE SELECT, INSERT ON employees FROM new_user;
REVOKE dba FROM new_user;

select * from new_employees;

insert into new_employees values('1','a','b',SYSDATE,'1000');

delete  new_employees;

drop table new1_employees

--78. Drop User
DROP USER new_user CASCADE;

--79. Commit Transaction
COMMIT;

--80. Rollback Transaction
ROLLBACK;

--81. Savepoint
SAVEPOINT sp1;

--82. Rollback to Savepoint
ROLLBACK TO sp1;

Advanced Features
--84. With Clause (Common Table Expressions)
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM dept_avg;

--equal below
select * from (SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id);


--85. Hierarchical Queries
SELECT employee_id, manager_id, LEVEL
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

select * from employees


--86. Flashback Query
SELECT * FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '1' DAY);

--87. Analytical Functions - ROW_NUMBER
SELECT first_name, salary,
ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;

--88. Analytical Functions - RANK
SELECT first_name, salary,
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
FROM employees;

--89. Analytical Functions - LEAD
SELECT first_name, salary,
LEAD(salary, 1) OVER (ORDER BY salary) AS next_salary
FROM employees;

--90.Analytical Functions - LAG
SELECT first_name, salary,
LAG(salary, 1) OVER (ORDER BY salary) AS prev_salary
FROM employees;

Common Operations
--91. Case Sensitivity in Queries
SELECT * FROM employees WHERE UPPER(first_name) = 'JOHN';

--92. Concatenation with `||` Operator
SELECT first_name || ' ' || last_name AS full_name FROM employees;

--93. Using `DECODE` for Conditional Logic
SELECT first_name, DECODE(department_id, 10, 'Sales', 'Other') AS dept_name FROM employees;

--94. Using `TO_CHAR` for Formatting Dates
SELECT TO_CHAR(hire_date, 'DD-MON-YYYY') AS hire_date_formatted FROM employees;

--95. Using `TO_DATE` to Convert Strings to Dates
SELECT TO_DATE('2024-08-27', 'YYYY-MM-DD') AS converted_date FROM dual;

--96. Using `TO_NUMBER` to Convert Strings to Numbers
SELECT TO_NUMBER('12345') AS converted_number FROM dual;

--97. Combining `TRUNC` and SYSDATE for Date Calculation
SELECT TRUNC(SYSDATE, 'YYYY') AS start_of_year FROM dual;

--98. Using `NVL` to Handle Nulls
SELECT employee_id, NVL(commission_pct, 0) AS commission FROM employees;

--99. Using NULLIF to Avoid Division by Zero
SELECT employee_id, salary / NULLIF(commission_pct, 0) AS adjusted_salary FROM employees;

SELECT employee_id, salary, NULLIF(commission_pct, 0), salary/NULLIF(commission_pct, 0) AS adjusted_salary FROM employees;

--100. Creating a Table with Constraints
CREATE TABLE orders( 
    order_id NUMBER PRIMARY KEY
    , order_date DATE NOT NULL
    , customer_id NUMBER REFERENCES customers(customer_id)
    , total_amount NUMBER CHECK (total_amount > 0)
);

