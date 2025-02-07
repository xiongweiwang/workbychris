
--This topic covers variables in PL/SQL, which are placeholders for storing data values.
declare
    var_countryname varchar2(50);
begin
    var_countryname :='USA';
    dbms_output.put_line('Country name is :' || var_countryname);
end;


----------
declare
    v_a number:=100;
    v_b number;
begin
    v_B:=30;
    dbms_output.put_line('The result is :' || (v_a+v_b));
end;


--constant
-- variables  constant  Data Types:=value
-- week_day constant Integer: = 7;

--This topic discusses data types in PL/SQL, defining the kind of data that can be stored in a variable.
--NUMBER,PLS_INTEGER,BINARY_INTEGER
--1. Numeric type
NUMBER PLS_INTEGER BINARY_INTEGER

--2. Character type
VARCHAR2 CHAR LONG NCHAR NVARCHAR2
VARCHAR2(m) m<32767
CHAR(m) m<32767  -- The default value is 1

--3. Date type DATE
-- Declaration part
DECLARE
date_time VARCHAR2(50);
-- Execution part
BEGIN
SELECT SYSDATE
INTO date_time
FROM DUAL;

DBMS_OUTPUT.PUT_LINE(date_time);
END;

--4. Boolean type
BOOLEAN
TURE FALSE NULL

-- 1. %TYPE type
declare
    var_name HR.EMPLOYEES.FIRST_NAME%type;
    var_sdept HR.EMPLOYEES.DEPARTMENT_ID%type;
begin
    select FIRST_NAME||' '||LAST_NAME,DEPARTMENT_ID into var_name,var_sdept from HR.EMPLOYEES where EMPLOYEE_ID='100';
    dbms_output.put_line('Name:' || (var_name ||', DEPARTMENT_ID:'||var_sdept));
end;

--2. RECORD type
type stu_type is record(
    var_sname varchar2(30),
    var_sage char(3),
    var_sdept varchar2(30)
);


DECLARE
type emp_type is record(
    var_name HR.EMPLOYEES.FIRST_NAME%type,
    var_sdept HR.EMPLOYEES.DEPARTMENT_ID%type
    );
empinfo emp_type;
begin
    select FIRST_NAME||' '||LAST_NAME,DEPARTMENT_ID into empinfo from HR.EMPLOYEES where EMPLOYEE_ID='101';
    dbms_output.put_line('Name:' || (empinfo.var_name ||', DEPARTMENT_ID:'||empinfo.var_sdept));
end;

--3.ROWTYPE type
DECLARE
rowvar_emp HR.EMPLOYEES%rowtype;
begin
    select * into rowvar_emp from HR.EMPLOYEES where EMPLOYEE_ID='102';
    dbms_output.put_line('Name:' || (rowvar_emp.FIRST_NAME || rowvar_emp.LAST_NAME || ', DEPARTMENT_ID:'||rowvar_emp.DEPARTMENT_ID));
end;


--This topic is about selection and loops (Part 1) in PL/SQL, which are control structures for decision-making and repeated execution.
---plsql selection and loop
declare
    a int;
    b int;
    c number;
begin
    dbms_output.put_line('please input a value for  a:');
    a :=&a;
    dbms_output.put_line('please input b value for  b:');
    b :=&b;
    c :=(a+b)/(a-b);
    dbms_output.put_line(c);
exception
    when zero_divide then
    dbms_output.put_line('Divisor can not be zero');
end;


--if-then statements;
if<condition_expression> then
    plsql_sentence;
end if;

declare
    v_name1 varchar2(30);
    v_name2 varchar2(30);
begin
    v_name1 :='qf';
    v_name2 :='qfedu';
    if length(v_name1) < length(v_name2) then
        dbms_output.put_line(v_name2||'is longer then'||v_name1);
    else
        dbms_output.put_line(v_name2||'is shortter then'||v_name1);
    end if;
end;

--if-then-elsif
if<condition_expression1> then
    plsql_sentence1;
elsif<condition_expression2> then
    plsql_sentence2;
else
    plsql_sentence3;
end if;


declare
    v_grade number;
begin
    dbms_output.put_line('please input b value for  grade:');
    v_grade :=&grade;
    if v_grade < 60 then
        dbms_output.put_line('fail');
    elsif v_grade < 70 then
        dbms_output.put_line('qualified');
    elsif v_grade < 90 then
        dbms_output.put_line('good');
    elsif v_grade < 100 then
        dbms_output.put_line('excellent');
    else
        dbms_output.put_line('perfect');
    end if;
end;

--This topic is the continuation (Part 2) of selection and loops in PL/SQL.
--1. loop statement
loop
    (statement block executed in a loop);
    exit when (loop end condition);
    (loop end condition modification);
end loop;


declare
    sum_i int :=0;
    i int :=0;
begin
    loop
        i:=i+1;
        sum_i:=sum_i + i;
        exit when i=100;
    end loop;
    dbms_output.put_line(sum_i);
end;

--2. while...loop statement
while (loop condition) loop
      The statement block to be executed in a loop;
      Modify the loop end condition;
end loop;

declare
    sum_i int :=0;
    i int :=0;
begin
    while i<100 loop
        i:=i+1;
        sum_i:=sum_i + i;
    end loop;
    dbms_output.put_line(sum_i);
end;

--3. for statement
for variable_counter_name in [reverse] lower_limit..upper_limit loop
    plsql_sentence;
end loop;

declare
    sum_i int :=0;
    i int :=0;
begin
    for i in 1..100 loop
        sum_i:=sum_i + i;
    end loop;
    dbms_output.put_line(sum_i);
end;

-- Declaration Department 
DECLARE 
-- Processing Department 
BEGIN 
    FOR i IN 1..12 LOOP 
        IF (i IN (2, 4, 6, 9, 11)) THEN
            DBMS_OUTPUT.PUT_LINE(i || ':The month is a "short month"'); 
        ELSE 
            DBMS_OUTPUT.PUT_LINE(i || ':The month is a "long month"');
        END IF; 
    END LOOP; 
END;


--Selection and jump statements
--1. case
declare
    season int :=0;
    aboutinfo varchar2(50);
begin
    season :=&season;
    case season
        when 1 then
            aboutinfo:='Input'||season||',month:1,2,3';
        when 2 then
            aboutinfo:='Input'||season||',month:4,5,6';
        when 3 then
            aboutinfo:='Input'||season||',month:7,8,9';
        when 4 then
            aboutinfo:='Input'||season||',month:10,11,12';
        else
            aboutinfo:='season error';
    end case;
    dbms_output.put_line(aboutinfo);
end;

--2. goto
declare
    v_result int:=1;
begin
    for v_result in 1..100 loop
        if v_result=2 then
            goto endpoint;
        end if;
        dbms_output.put_line(v_result);
    end loop;
    <<endpoint>>
    dbms_output.put_line('over');
end;


--Explicit Cursor
declare
    cursor cur_emp is select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID  from HR.EMPLOYEES where DEPARTMENT_ID='90';
    type record_emp is RECORD
    (
        var_EMPLOYEE_ID HR.EMPLOYEES.EMPLOYEE_ID%type,
        var_FIRST_NAME HR.EMPLOYEES.FIRST_NAME%type,
        var_LAST_NAME HR.EMPLOYEES.LAST_NAME%type,
        var_DEPARTMENT_ID HR.EMPLOYEES.DEPARTMENT_ID%type
    );
    emp_row record_emp;
begin
    open cur_emp;
    fetch cur_emp into emp_row;
    while cur_emp%found loop
        dbms_output.put_line('id:'||emp_row.var_EMPLOYEE_ID||', name:'||emp_row.var_FIRST_NAME||' '||emp_row.var_LAST_NAME||',DEPARTMENT_ID:'||emp_row.var_DEPARTMENT_ID);
        fetch cur_emp into emp_row;
    end loop;
    CLOSE cur_emp;
end;

--Implicit cursor
begin
    update HR.HERO set DAMAGE=DAMAGE+1 where id='4';
    if sql%notfound then
        dbms_output.put_line('not found any hero');
    else
        dbms_output.put_line(sql%rowcount || ' ,hero has changed');
    end if;
end;

declare
    type record_hero is RECORD
    (
        var_id HR.hero.id%type,
        var_name HR.hero.name%type,
        var_damage HR.hero.damage%type
    );
    hero_row record_hero;
begin
    update HR.HERO set DAMAGE=DAMAGE+1 where id='4';
    if sql%notfound then
        dbms_output.put_line('not found any hero');
    else
        dbms_output.put_line(sql%rowcount || ' ,hero has changed');
        select id, name, damage into hero_row from HR.Hero where id='4';
        dbms_output.put_line('hero:'||hero_row.var_name||', damage is ;'|| hero_row.var_damage);
    end if;
end;


select * from HR.Hero;

--Example Explicit Cursor 
declare
    cursor cur_hero is select id,name,damage from HR.hero where armor='4';
    type record_hero is RECORD
    (
        var_id HR.hero.id%type,
        var_name HR.hero.name%type,
        var_damage HR.hero.damage%type
    );
    hero_row record_hero;

begin
    update HR.HERO set DAMAGE=DAMAGE+1 where armor='4';
    if sql%notfound then
        dbms_output.put_line('not found any hero');
    else
        dbms_output.put_line(sql%rowcount || 'heros has changed');
    end if;
    
    open cur_hero;
    fetch cur_hero into hero_row;
    while cur_hero%found loop
        dbms_output.put_line('hero:'||hero_row.var_name||', damage is ;'|| hero_row.var_damage);
        fetch cur_hero into hero_row;
    end loop;
    CLOSE cur_hero;
end;

select * from HR.Hero;

--Exception
--1.
DECLARE
  v_result number;
BEGIN
  v_result:= 10/0;
  DBMS_OUTPUT.PUT_LINE(v_result);
END;

declare
 v_a VARCHAR2(1);
 v_b VARCHAR2(4):='Java';
begin
 v_a := v_b;
EXCEPTION
 when value_error then
  DBMS_OUTPUT.PUT_LINE('value error');
END;

--2.
-- Declaration section
DECLARE
       name VARCHAR2(10);
       noNameException EXCEPTION;
-- Execution section
BEGIN
     name := '';
     IF (name is not null) THEN
        DBMS_OUTPUT.PUT_LINE('The name is ' || name || '.');
     ELSE
        RAISE noNameException;
     END IF;
-- Exception processing section
EXCEPTION
     WHEN noNameException THEN
         DBMS_OUTPUT.PUT_LINE('There is no name.');
END;

--3.
--User-defined exceptions
declare
 v_data number;
 v_myexp exception;
begin
 v_data :=&inputdata;
 if v_data>100 then
  RAISE v_myexp;
 end if;
 DBMS_OUTPUT.PUT_LINE(v_data);
EXCEPTION
  WHEN v_myexp THEN
    DBMS_OUTPUT.PUT_LINE('invalid v_data');
END;

--4.
DECLARE
 e_invalid_salary EXCEPTION;
 v_salary NUMBER := 25000;
BEGIN
 IF v_salary > 20000 THEN
  RAISE e_invalid_salary; -- Raise a user-defined exception
 END IF;
 DBMS_OUTPUT.PUT_LINE('salary: ' || v_salary);
EXCEPTION
 WHEN e_invalid_salary THEN
  DBMS_OUTPUT.PUT_LINE('Error: Salary exceeds upper limit.');
END;

--Stored Procedures and Triggers - Creating and Calling Stored Procedures
create or replace procedure my_proc1 is
begin
 insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(100,'naruto',450,200,45,4,30);
 DBMS_OUTPUT.PUT_LINE('insert success');
end my_proc1;

select * from HR.Hero;

begin
 my_proc1;
end;

Drop procedure my_proc1;

--function
--create pl/sql function
create or replace function get_avg_salary(param_sdept number)
return number
is
    avg_result number;
begin
    select NVL(avg(salary), 0) into avg_result from HR.Employees where trim(Department_id) = param_sdept;
    return(round(avg_result,2));
    exception
        when no_data_found then
        dbms_output.put_line('sdept not found');
        return(0);
end;

--calling pl/sql function
declare
 avg_salary number;
begin
 avg_salary:= get_avg_salary(30);
 dbms_output.put_line(avg_salary);
end;

Drop function get_avg_salary;

select * from HR.EMPLOYEES
--drop function get_avg_age;
drop function get_avg_salary;


--Stored Procedures and Triggers - Triggers
--DBA_TRIGGERS, USER_TRIGGERS
CREATE OR REPLACE TRIGGER trg_employee
BEFORE INSERT OR UPDATE OR DELETE ON hr.employees
FOR EACH ROW
DECLARE
    var_tag varchar2(10);
BEGIN
    if inserting then
     var_tag := 'insert';
    elsif updating then
     var_tag := 'update';
    elsif deleting then
     var_tag := 'delete';
    end if;
    INSERT INTO hr.employees_logs (operate_tag, operate_time) VALUES (var_tag,sysdate);
END trg_employee;

select * from Hr.employees order by employee_id desc;
select * from Hr.employees_logs order by operate_time;
------------------------
INSERT INTO Hr.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (100001, 'John', 'Doe', 'john1@example.com', '123-456-7890', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'IT_PROG', 60000, NULL, 101, 10);

INSERT INTO Hr.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (100002, 'John', 'Doe', 'john2@example.com', '123-456-7890', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'IT_PROG', 60000, NULL, 101, 10);

INSERT INTO Hr.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (100003, 'John', 'Doe', 'john3@example.com', '123-456-7890', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'IT_PROG', 60000, NULL, 101, 10);

UPDATE  Hr.employees set salary='100001' where employee_id = '100001';

DELETE FROM Hr.employees where employee_id = '100001';

CREATE TABLE hr.employees_logs (
    operate_tag  VARCHAR2(10),
    operate_time date
);


--Replace trigger
CREATE OR REPLACE TRIGGER trg_employee_view
INSTEAD OF INSERT
ON VIEW_employees_logs
FOR EACH ROW
BEGIN

    INSERT INTO hr.employees_logs (operate_tag, operate_time) VALUES (:new.operate_tag, :new.operate_time);
END trg_employee_view;




--Stored Procedures and Triggers - Defining Packages

--Package Specification
CREATE OR REPLACE package pack_emp is
    function fun_avg_salary(num_dept_id number) return NUMBER;
    procedure pro_regulate_salary(num_emp_id number);
END pack_emp;

--Package body
CREATE package body pack_emp is
    function fun_avg_salary(num_dept_id number) return NUMBER is
         num_avg_sal number;
    begin
         select NVL(avg(salary), 0) into avg_result from HR.Employees where trim(Department_id) = num_dept_id;
         retuen(num_avg_sal)
    exception
         when no_data_found then
              dbms_output.out_line('no this department_id');
              return 0;
    end fun_avg_salary;
    
    procedure pro_regulate_salary(num_emp_id number) is
    begin
         UPDATE  Hr.employees set salary=salary+1 where employee_id = num_emp_id;
    end pro_regulate_salary;
END pack_emp;
         
--Stored Procedures and Triggers - Indexes



--view 
SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id


--pl/sql ct

--PL/SQL Programming - Introduction to PL/SQL
--A simple PL/SQL example:
DECLARE
    v_employee_name VARCHAR2(100);
BEGIN
    SELECT first_name || ' ' || last_name
    INTO v_employee_name
    FROM hr.employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name);
END;


--Basic PL/SQL Examples
--Checks if salary is less than 3000
DECLARE
  v_employee_id hr.employees.employee_id%TYPE := 1001;
  v_salary hr.employees.salary%TYPE;
BEGIN
  SELECT salary INTO v_salary
  FROM hr.employees
  WHERE employee_id = v_employee_id;

  IF v_salary < 3000 THEN
    DBMS_OUTPUT.PUT_LINE('Salary is below 3000');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary is ' || v_salary);
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred');
END;


--calculation and print the result.
DECLARE
  v_num1 NUMBER := 10;
  v_num2 NUMBER := 20;
  v_sum  NUMBER;
BEGIN
  v_sum := v_num1 + v_num2;
  DBMS_OUTPUT.PUT_LINE('The sum is: ' || v_sum);
END;

--IF, ELSIF, ELSE conditional branching
DECLARE
  v_salary NUMBER := 4000;
BEGIN
  IF v_salary < 3000 THEN
    DBMS_OUTPUT.PUT_LINE('Salary is less than 3000');
  ELSIF v_salary BETWEEN 3000 AND 5000 THEN
    DBMS_OUTPUT.PUT_LINE('Salary is between 3000 and 5000');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary is greater than 5000');
  END IF;
END;


--Exception Handling
DECLARE
  v_dividend NUMBER := 100;
  v_divisor  NUMBER := 0;
  v_result   NUMBER;
BEGIN
  -- Perform integer division
  v_result := v_dividend / v_divisor;
  DBMS_OUTPUT.PUT_LINE('Result is: ' || v_result);
EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred');
END;

--Here is an example of using a cursor to process multiple rows of data one row at a time.
--The cursor employee_cursor is used to retrieve data from the employees table and process and print the data for each row line by line.
DECLARE
  CURSOR employee_cursor IS
    SELECT employee_id, first_name, last_name FROM hr.employees;
    
  type record_emp is RECORD
  (
   v_employee_id hr.employees.employee_id%TYPE;
   v_first_name  hr.employees.first_name%TYPE;
   v_last_name   hr.employees.last_name%TYPE;
  );
  emp_row record_emp;
BEGIN
  OPEN employee_cursor;
  LOOP
    FETCH employee_cursor INTO emp_row; --FETCH employee_cursor INTO v_employee_id, v_first_name, v_last_name;
    EXIT WHEN employee_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_row.v_employee_id || ' - ' || emp_row.v_first_name || ' ' || emp_row.v_last_name);
  END LOOP;
  CLOSE employee_cursor;
END;

--Creating and Executing Stored Procedures
--Increase an employee's salary by a specified percentage

CREATE OR REPLACE PROCEDURE raise_salary(p_employee_id IN hr.employees.employee_id%TYPE, p_percentage IN NUMBER) IS
BEGIN
  UPDATE hr.employees
  SET salary = salary + (salary * p_percentage / 100)
  WHERE employee_id = p_employee_id;
  
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || p_employee_id);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary raised by ' || p_percentage || '% for employee ID: ' || p_employee_id);
  END IF;
END raise_salary;

--
BEGIN
  raise_salary(100001, 10);
END;

DROP PROCEDURE raise_salary;

select *  from HR.EMPLOYEES where EMPLOYEE_ID='100001';

--Creating a Trigger
--This is an example of a trigger that will be executed automatically based on a specific event (INSERT, UPDATE, DELETE).
--Using the above example to implement salary changes


CREATE TABLE HR.salary_changes
   (	employee_id NUMBER(6,0), 
      old_salary NUMBER(8,2), 
      new_salary NUMBER(8,2), 
      change_date date
);


CREATE OR REPLACE TRIGGER before_employee_update
BEFORE UPDATE ON hr.employees
FOR EACH ROW
BEGIN
  IF :OLD.salary <> :NEW.salary THEN
    INSERT INTO hr.salary_changes (employee_id, old_salary, new_salary, change_date)
    VALUES (:OLD.employee_id, :OLD.salary, :NEW.salary, SYSDATE);
  END IF;
END;

--The before_employee_update trigger runs before the salary in the employees table is updated and records the salary change history, if any.

select * from HR.salary_changes;
DROP TRIGGER before_employee_update;


--PL/SQL Programming - Variables
--1. Variable Declaration
DECLARE
  v_employee_id NUMBER;   -- Numeric variable
  v_employee_name VARCHAR2(50);  -- String variable
  v_hire_date DATE;  -- Date variable
BEGIN
  -- Example of variable usage
  v_employee_id := 1001;
  v_employee_name := 'John Doe';
  v_hire_date := SYSDATE;
END;

--2. Assigning values to variables
-- ":="
DECLARE
  v_salary NUMBER;
  v_bonus NUMBER;
BEGIN
  v_salary := 5000;
  v_bonus := v_salary * 0.10;  -- Calculate 10% of salary as bonus
  DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
  DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_bonus);
END;

--3. Storing database values in variables
-- "SELECT INTO"

--Use the SELECT INTO statement to retrieve the employee name and salary from the database and store them in v_employee_name and v_salary respectively.
DECLARE
  v_employee_id NUMBER := 1001;
  v_employee_name VARCHAR2(50);
  v_salary NUMBER;
BEGIN
  SELECT first_name || ' ' || last_name, salary
  INTO v_employee_name, v_salary
  FROM hr.employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_employee_name);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found');
END;

--4. Details of Data Types
PL/SQL allows the use of various data types. Below are some commonly used data types.
NUMBER: A data type for storing integers and floating-point numbers.
VARCHAR2(size): A data type for storing variable-length character strings. size specifies the maximum length.
CHAR(size): A data type for storing fixed-length character strings.
DATE: A data type for storing dates and times.
BOOLEAN: A data type for storing boolean values (TRUE, FALSE, NULL).

--Variables of different data types
DECLARE
  v_is_active BOOLEAN := TRUE;
  v_score NUMBER(5,2) := 95.50;
  v_comment VARCHAR2(255) := 'Excellent performance';
  v_join_date DATE := SYSDATE;
BEGIN
  IF v_is_active THEN
    DBMS_OUTPUT.PUT_LINE('Active employee');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Score: ' || v_score);
  DBMS_OUTPUT.PUT_LINE('Comment: ' || v_comment);
  DBMS_OUTPUT.PUT_LINE('Join Date: ' || TO_CHAR(v_join_date, 'YYYY-MM-DD'));
END;

--5. Declaring variables using %TYPE
DECLARE
  v_employee_id hr.employees.employee_id%TYPE;
  v_employee_name hr.employees.first_name%TYPE;
BEGIN
  v_employee_id := 1001;
  SELECT first_name || ' ' || last_name INTO v_employee_name
  FROM hr.employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_employee_name);
END;

--6. Declaring Constants
DECLARE
  c_tax_rate CONSTANT NUMBER := 0.08;  -- Declare tax rate as a constant
  v_price NUMBER := 100;
  v_tax NUMBER;
BEGIN
  v_tax := v_price * c_tax_rate;
  DBMS_OUTPUT.PUT_LINE('Tax: ' || v_tax);
END;

--7. Using record type variables
DECLARE
  TYPE employee_record_type IS RECORD (
    employee_id   hr.employees.employee_id%TYPE,
    first_name    hr.employees.first_name%TYPE,
    last_name     hr.employees.last_name%TYPE,
    hire_date     hr.employees.hire_date%TYPE
  );
  
  v_employee employee_record_type;
BEGIN
  SELECT employee_id, first_name, last_name, hire_date
  INTO v_employee
  FROM hr.employees
  WHERE employee_id = 1001;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.employee_id);
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_employee.first_name || ' ' || v_employee.last_name);
  DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_employee.hire_date, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('Hire Date: ' || v_employee.hire_date);
END;

--8. Using Variables with %ROWTYPE
DECLARE
  v_employee hr.employees%ROWTYPE;
BEGIN
  SELECT * INTO v_employee FROM hr.employees WHERE employee_id = 1001;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.employee_id);
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_employee.first_name || ' ' || v_employee.last_name);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee.salary);
  DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_employee.department_id);
END;

--9. Using variables with dynamic SQL
DECLARE
  v_table_name VARCHAR2(30) := 'hr.employees';
  v_column_name VARCHAR2(30) := 'salary';
  v_employee_id NUMBER := 1001;
  v_result NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'SELECT ' || v_column_name || ' FROM ' || v_table_name || ' WHERE employee_id = :1' 
  INTO v_result USING v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Salary of employee ID ' || v_employee_id || ' is ' || v_result);
END;

--10. Using variables in functions
--The calculate_bonus function takes an employee ID and returns the calculated bonus based on the employee's salary.
CREATE OR REPLACE FUNCTION calculate_bonus (p_employee_id IN NUMBER) RETURN NUMBER IS
  v_salary hr.employees.salary%TYPE;
  v_bonus NUMBER;
BEGIN
  SELECT salary INTO v_salary FROM hr.employees WHERE employee_id = p_employee_id;
  
  IF v_salary < 3000 THEN
    v_bonus := v_salary * 0.05;
  ELSE
    v_bonus := v_salary * 0.10;
  END IF;
  
  RETURN v_bonus;
END;

--Call the function to print the bonus for a particular employee.
BEGIN
  DBMS_OUTPUT.PUT_LINE('Bonus for employee ID 1001: ' || calculate_bonus(1001));
END;

DROP FUNCTION calculate_bonus;

--11. Combining Cursors and Variables
DECLARE
  CURSOR c_employees IS
    SELECT employee_id, salary FROM hr.employees WHERE department_id = 10;
  
  v_employee_id hr.employees.employee_id%TYPE;
  v_salary hr.employees.salary%TYPE;
  v_total_salary NUMBER := 0;
BEGIN
  OPEN c_employees;
  
  LOOP
    FETCH c_employees INTO v_employee_id, v_salary;
    EXIT WHEN c_employees%NOTFOUND;
    
    v_total_salary := v_total_salary + v_salary;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Salary: ' || v_salary);
  END LOOP;
  
  CLOSE c_employees;
  
  DBMS_OUTPUT.PUT_LINE('Total salary for department 10: ' || v_total_salary);
END;


Explanation:
Uses the c_employees cursor to get data for employees in a particular department and calculates the total in v_total_salary.
In the loop, prints the ID and salary of each employee, and displays the total salary after the loop ends.


--Exercise
--Calculate 1 to 100
DECLARE
  v_counter NUMBER := 1;
  v_sum     NUMBER := 0;
BEGIN
  WHILE v_counter <= 100 LOOP
    v_sum := v_sum + v_counter;
    v_counter := v_counter + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Sum of numbers from 1 to 10: ' || v_sum);
END;

--PLSQL Programming - Data Types
--1. Numeric Data Types
DECLARE
  v_num1 NUMBER(7, 2) := 12345.67;
  v_num2 INTEGER := 100;
  v_num3 PLS_INTEGER := 500;
  v_float BINARY_FLOAT := 123.45;
  v_double BINARY_DOUBLE := 6789.01;
BEGIN
  DBMS_OUTPUT.PUT_LINE('v_num1: ' || v_num1);
  DBMS_OUTPUT.PUT_LINE('v_num2: ' || v_num2);
  DBMS_OUTPUT.PUT_LINE('v_num3: ' || v_num3);
  DBMS_OUTPUT.PUT_LINE('v_float: ' || v_float);
  DBMS_OUTPUT.PUT_LINE('v_double: ' || v_double);
END;

--2. String Data Types
DECLARE
  v_name VARCHAR2(50) := 'John Doe';
  v_fixed_name CHAR(10) := 'Alice';
  v_description CLOB := 'This is a large text stored in a CLOB.';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Fixed Length Name: ' || v_fixed_name);
  DBMS_OUTPUT.PUT_LINE('Description: ' || v_description);
END;

--3. Date Data Types
DECLARE
  v_date DATE := SYSDATE;
  v_timestamp TIMESTAMP := SYSTIMESTAMP;
  v_timestamp_tz TIMESTAMP WITH TIME ZONE := CURRENT_TIMESTAMP;
  v_timestamp_ltz TIMESTAMP WITH LOCAL TIME ZONE := LOCALTIMESTAMP;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_date, 'YYYY-MM-DD HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('Timestamp: ' || TO_CHAR(v_timestamp, 'YYYY-MM-DD HH24:MI:SS.FF'));
  DBMS_OUTPUT.PUT_LINE('Timestamp with Time Zone: ' || TO_CHAR(v_timestamp_tz, 'YYYY-MM-DD HH24:MI:SS.FF TZR'));
  DBMS_OUTPUT.PUT_LINE('Timestamp with Local Time Zone: ' || TO_CHAR(v_timestamp_ltz, 'YYYY-MM-DD HH24:MI:SS.FF'));
END;

--4. Logical Data Types
DECLARE
  v_is_valid BOOLEAN := TRUE;
BEGIN
  IF v_is_valid THEN
    DBMS_OUTPUT.PUT_LINE('The value is TRUE.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The value is FALSE.');
  END IF;
END;


--5. Large Object (LOB) Data Types
DECLARE
  v_image BLOB;
  v_text CLOB := 'Sample text stored in a CLOB';
BEGIN
  -- Use the DBMS_LOB package to manipulate BLOB data.
  DBMS_OUTPUT.PUT_LINE('CLOB Text: ' || v_text);
END;

--6. %TYPE‚Æ%ROWTYPE
DECLARE
  v_employee_id employees.employee_id%TYPE;
  v_employee_record employees%ROWTYPE;
BEGIN
  v_employee_id := 1001;
  
  SELECT * INTO v_employee_record FROM employees WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_record.first_name || ' ' || v_employee_record.last_name);
END;


--7. Dynamic String Concatenation
DECLARE
  v_first_name VARCHAR2(20) := 'John';
  v_last_name VARCHAR2(20) := 'Doe';
  v_full_name VARCHAR2(50);
BEGIN
  v_full_name := v_first_name || ' ' || v_last_name;
  DBMS_OUTPUT.PUT_LINE('Full Name: ' || v_full_name);
END;


--8. Arithmetic operations using numeric data types
DECLARE
  v_num1 NUMBER := 20;
  v_num2 NUMBER := 10;
  v_sum NUMBER;
  v_diff NUMBER;
  v_product NUMBER;
  v_quotient NUMBER;
BEGIN
  v_sum := v_num1 + v_num2;
  v_diff := v_num1 - v_num2;
  v_product := v_num1 * v_num2;
  v_quotient := v_num1 / v_num2;
  
  DBMS_OUTPUT.PUT_LINE('Sum: ' || v_sum);
  DBMS_OUTPUT.PUT_LINE('Difference: ' || v_diff);
  DBMS_OUTPUT.PUT_LINE('Product: ' || v_product);
  DBMS_OUTPUT.PUT_LINE('Quotient: ' || v_quotient);
END;


--9. Date Calculations with Date Data Types
DECLARE
  v_today DATE := SYSDATE;
  v_next_week DATE;
  v_prev_week DATE;
  v_days_between NUMBER;
BEGIN
  v_next_week := v_today + 7;
  v_prev_week := v_today - 7;
  v_days_between := v_next_week - v_prev_week;
  
  DBMS_OUTPUT.PUT_LINE('Today: ' || TO_CHAR(v_today, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('Next Week: ' || TO_CHAR(v_next_week, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('Previous Week: ' || TO_CHAR(v_prev_week, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('Days Between: ' || v_days_between);
END;


--10. Conditional branching using BOOLEAN data
DECLARE
  v_is_valid BOOLEAN := TRUE;
  v_num NUMBER := 5;
BEGIN
  IF v_num > 10 THEN
    v_is_valid := FALSE;
  END IF;
  
  IF v_is_valid THEN
    DBMS_OUTPUT.PUT_LINE('The number is within the valid range.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The number is out of the valid range.');
  END IF;
END;

--11. Working with Large Binary Data Using BLOBs
DECLARE
  v_blob_data BLOB;
  v_length NUMBER;
BEGIN
  -- Initialize an empty BLOB
  DBMS_LOB.CREATETEMPORARY(v_blob_data, TRUE);
  
  -- Add binary data (for example, convert a string to BLOB as RAW data)
  DBMS_LOB.WRITE(v_blob_data, LENGTH('Sample Data'), 1, UTL_RAW.CAST_TO_RAW('Sample Data'));
  
  -- Get the length of the BLOB
  v_length := DBMS_LOB.GETLENGTH(v_blob_data);
  
  DBMS_OUTPUT.PUT_LINE('BLOB Length: ' || v_length);
  
  -- Free the BLOB if necessary
  DBMS_LOB.FREETEMPORARY(v_blob_data);
END;

--12. Working with Cursors Using ROWTYPE
DECLARE
  CURSOR c_employees IS
    SELECT employee_id, first_name, last_name FROM employees WHERE department_id = 10;
  
  v_employee_record c_employees%ROWTYPE;
BEGIN
  OPEN c_employees;
  
  LOOP
    FETCH c_employees INTO v_employee_record;
    EXIT WHEN c_employees%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_record.employee_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_employee_record.first_name || ' ' || v_employee_record.last_name);
  END LOOP;
  
  CLOSE c_employees;
END;


--13. TIMESTAMP OPERATIONS
DECLARE
  v_timestamp TIMESTAMP := SYSTIMESTAMP;
  v_future_timestamp TIMESTAMP;
BEGIN
  v_future_timestamp := v_timestamp + INTERVAL '10' DAY;
  
  DBMS_OUTPUT.PUT_LINE('Current Timestamp: ' || TO_CHAR(v_timestamp, 'YYYY-MM-DD HH24:MI:SS.FF'));
  DBMS_OUTPUT.PUT_LINE('Timestamp After 10 Days: ' || TO_CHAR(v_future_timestamp, 'YYYY-MM-DD HH24:MI:SS.FF'));
END;


--14. Storing Data Using Arrays (VARRAY)
DECLARE
  TYPE number_varray IS VARRAY(5) OF NUMBER;
  v_numbers number_varray := number_varray(1, 2, 3, 4, 5);
BEGIN
  FOR i IN 1..v_numbers.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Number ' || i || ': ' || v_numbers(i));
  END LOOP;
END;

--PLSQL Programming - Conditional Branching and Loops 1
Conditional Branching
--1. IF-THEN-ELSE Construct
DECLARE
  v_number NUMBER := 5;
BEGIN
  IF v_number > 0 THEN
    DBMS_OUTPUT.PUT_LINE('The number is positive.');
  ELSIF v_number < 0 THEN
    DBMS_OUTPUT.PUT_LINE('The number is negative.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The number is zero.');
  END IF;
END;

--2. CASE Construct
DECLARE
  v_grade CHAR(1) := 'B';
BEGIN
  CASE v_grade
    WHEN 'A' THEN
      DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN 'B' THEN
      DBMS_OUTPUT.PUT_LINE('Good');
    WHEN 'C' THEN
      DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN 'D' THEN
      DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
  END CASE;
END;


Loop Structure
--1. LOOP Syntax
DECLARE
  v_counter NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Iteration: ' || v_counter);
    v_counter := v_counter + 1;
    
    EXIT WHEN v_counter > 5;
  END LOOP;
END;

--2. WHILE Loop
DECLARE
  v_counter NUMBER := 1;
BEGIN
  WHILE v_counter <= 5 LOOP
    DBMS_OUTPUT.PUT_LINE('Iteration: ' || v_counter);
    v_counter := v_counter + 1;
  END LOOP;
END;


--3. FOR Loop
BEGIN
  FOR v_counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Iteration: ' || v_counter);
  END LOOP;
END;


Loop sample
--1. Nested IF-THEN-ELSE Example
DECLARE
  v_age NUMBER := 25;
  v_gender CHAR(1) := 'M';
BEGIN
  IF v_age > 18 THEN
    IF v_gender = 'M' THEN
      DBMS_OUTPUT.PUT_LINE('Adult Male');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Adult Female');
    END IF;
  ELSE
    IF v_gender = 'M' THEN
      DBMS_OUTPUT.PUT_LINE('Young Male');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Young Female');
    END IF;
  END IF;
END;


--2. Nested Loops Example
BEGIN
  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE('Outer loop iteration: ' || i);
    
    FOR j IN 1..2 LOOP
      DBMS_OUTPUT.PUT_LINE('  Inner loop iteration: ' || j);
    END LOOP;
  END LOOP;
END;

--3. Combining CASE constructs and loops
BEGIN
  FOR day_number IN 1..7 LOOP
    DBMS_OUTPUT.PUT_LINE('Day ' || day_number || ': ' || 
    CASE day_number
      WHEN 1 THEN 'Sunday'
      WHEN 2 THEN 'Monday'
      WHEN 3 THEN 'Tuesday'
      WHEN 4 THEN 'Wednesday'
      WHEN 5 THEN 'Thursday'
      WHEN 6 THEN 'Friday'
      WHEN 7 THEN 'Saturday'
      ELSE 'Invalid Day'
    END);
  END LOOP;
END;


--4. Example of conditional exit using loop and EXIT
DECLARE
  v_total NUMBER := 0;
  v_counter NUMBER := 1;
BEGIN
  LOOP
    v_total := v_total + v_counter;
    DBMS_OUTPUT.PUT_LINE('Adding ' || v_counter || ', total is now ' || v_total);
    v_counter := v_counter + 1;
    
    EXIT WHEN v_total >= 15;
  END LOOP;
END;


--5. WHILE Loops and Complex Conditionals
DECLARE
  v_count NUMBER := 1;
  v_sum NUMBER := 0;
BEGIN
  WHILE v_count <= 10 AND v_sum < 30 LOOP
    v_sum := v_sum + v_count;
    DBMS_OUTPUT.PUT_LINE('Count: ' || v_count || ', Sum: ' || v_sum);
    v_count := v_count + 1;
  END LOOP;
END;


--6. Reverse counting in a FOR loop
BEGIN
  FOR i IN REVERSE 10..1 LOOP
    DBMS_OUTPUT.PUT_LINE('Countdown: ' || i);
  END LOOP;
END;


--7. Loop Control Using the GOTO Statement
DECLARE
  v_num NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
    v_num := v_num + 1;
    
    IF v_num = 5 THEN
      GOTO end_loop;
    END IF;
  END LOOP;
  
  <<end_loop>>
  DBMS_OUTPUT.PUT_LINE('Exited the loop.');
END;


--8. Exception handling using loops and RAISE
DECLARE
  v_num NUMBER := 0;
  ex_too_high EXCEPTION;
BEGIN
  LOOP
    v_num := v_num + 1;
    DBMS_OUTPUT.PUT_LINE('Current Number: ' || v_num);
    
    IF v_num > 3 THEN
      RAISE ex_too_high;
    END IF;
  END LOOP;
  
EXCEPTION
  WHEN ex_too_high THEN
    DBMS_OUTPUT.PUT_LINE('Number too high! Loop exited.');
END;


--9. Example of complex CASE construct usage
DECLARE
  v_grade CHAR(1) := 'B';
  v_bonus NUMBER;
BEGIN
  v_bonus := 
    CASE
      WHEN v_grade = 'A' THEN 1000
      WHEN v_grade = 'B' THEN 750
      WHEN v_grade = 'C' THEN 500
      WHEN v_grade = 'D' THEN 250
      ELSE 0
    END;
    
  DBMS_OUTPUT.PUT_LINE('The bonus for grade ' || v_grade || ' is ' || v_bonus);
END;


--10. Exception handling using the GOTO statement
DECLARE
  v_value NUMBER := 5;
  v_limit NUMBER := 10;
BEGIN
  IF v_value > v_limit THEN
    GOTO too_high;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Value is within the limit.');
  RETURN;
  
  <<too_high>>
  DBMS_OUTPUT.PUT_LINE('Error: Value exceeds the limit!');
END;


--11. Nesting CASE constructs
DECLARE
  v_status VARCHAR2(10) := 'Completed';
  v_category VARCHAR2(10) := 'High';
  v_result VARCHAR2(50);
BEGIN
  v_result := 
    CASE 
      WHEN v_status = 'Completed' THEN
        CASE 
          WHEN v_category = 'High' THEN 'Priority A'
          WHEN v_category = 'Medium' THEN 'Priority B'
          ELSE 'Priority C'
        END
      WHEN v_status = 'Pending' THEN
        'Pending Approval'
      ELSE
        'Unknown Status'
    END;
    
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;


--12. Combining GOTO and conditional loops
DECLARE
  v_num NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
    v_num := v_num + 1;
    
    IF v_num > 5 THEN
      GOTO end_loop;
    END IF;
  END LOOP;
  
  <<end_loop>>
  DBMS_OUTPUT.PUT_LINE('Exited the loop after reaching the limit.');
END;


--13. Combining CASE constructs and error handling
DECLARE
  v_error_code NUMBER := 1002;
  v_error_message VARCHAR2(100);
BEGIN
  v_error_message := 
    CASE v_error_code
      WHEN 1001 THEN 'Error: Invalid input'
      WHEN 1002 THEN 'Error: Data not found'
      WHEN 1003 THEN 'Error: Access denied'
      ELSE 'Error: Unknown issue'
    END;
    
  DBMS_OUTPUT.PUT_LINE('Error Message: ' || v_error_message);
END;


--15. Complex conditional branching and error handling
DECLARE
  v_status VARCHAR2(20) := 'Processing';
  v_amount NUMBER := 1000;
  v_discount NUMBER := 0;
  v_final_amount NUMBER;
  
  ex_invalid_status EXCEPTION;
  ex_large_amount EXCEPTION;
BEGIN
  --Set the discount rate according to the conditions
  v_discount := 
    CASE v_status
      WHEN 'Completed' THEN
        CASE 
          WHEN v_amount > 5000 THEN 0.1
          WHEN v_amount BETWEEN 1000 AND 5000 THEN 0.05
          ELSE 0
        END
      WHEN 'Pending' THEN 0.02
      ELSE RAISE ex_invalid_status
    END;

  --Calculate the discounted amount
  v_final_amount := v_amount * (1 - v_discount);
  
  IF v_final_amount > 5000 THEN
    RAISE ex_large_amount;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Final Amount: ' || v_final_amount);

EXCEPTION
  WHEN ex_invalid_status THEN
    DBMS_OUTPUT.PUT_LINE('Error: Invalid status.');
  WHEN ex_large_amount THEN
    DBMS_OUTPUT.PUT_LINE('Error: Final amount exceeds the limit.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;


--16. Dynamic SQL and Cursors
DECLARE
  v_table_name VARCHAR2(30) := 'EMPLOYEES';
  v_sql_query VARCHAR2(1000);
  CURSOR c_emp IS
    EXECUTE IMMEDIATE v_sql_query;
  v_emp_name VARCHAR2(100);
BEGIN
  -- Create a query using dynamic SQL
  v_sql_query := 'SELECT employee_name FROM ' || v_table_name;
  
  -- Open a cursor and fetch data
  OPEN c_emp;
  LOOP
    FETCH c_emp INTO v_emp_name;
    EXIT WHEN c_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
  END LOOP;
  CLOSE c_emp;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;


--17. Combining multiple FOR loops and conditional branches
DECLARE
  v_sum NUMBER := 0;
BEGIN
  FOR i IN 1..3 LOOP
    FOR j IN 1..3 LOOP
      IF i = j THEN
        DBMS_OUTPUT.PUT_LINE('i = j: ' || i || ' = ' || j);
      ELSE
        v_sum := v_sum + i * j;
        DBMS_OUTPUT.PUT_LINE('Sum after adding ' || i || ' * ' || j || ': ' || v_sum);
      END IF;
    END LOOP;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Final Sum: ' || v_sum);
END;


--18. Loop control using cursors and GOTO
DECLARE
  CURSOR c_sales IS
    SELECT sale_amount FROM hr.sales_data;
  v_sale_amount NUMBER;
  v_threshold NUMBER := 1000;
BEGIN
  OPEN c_sales;
  LOOP
    FETCH c_sales INTO v_sale_amount;
    EXIT WHEN c_sales%NOTFOUND;
    
    IF v_sale_amount > v_threshold THEN
      GOTO exceed_threshold;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Sales Amount: ' || v_sale_amount);
  END LOOP;
  
  <<exceed_threshold>>
  DBMS_OUTPUT.PUT_LINE('Sales amount exceeded threshold.');

  CLOSE c_sales;
END;


--19. Using Multiple Cursors and Conditionals
DECLARE
  CURSOR c_emps IS
    SELECT employee_id, first_name || ' ' || last_name as employee_name FROM hr.employees where department_id BETWEEN 10 AND 30;
    
  CURSOR c_deps IS
    SELECT department_id, department_name FROM hr.departments where department_id BETWEEN 10 AND 30;
  
  v_emp_employee_id VARCHAR2(100);
  v_emp_name VARCHAR2(100);
  v_dept_department_id VARCHAR2(100);
  v_dept_name VARCHAR2(100);
BEGIN
  OPEN c_emps;
  LOOP
    FETCH c_emps INTO v_emp_employee_id, v_emp_name;
    EXIT WHEN c_emps%NOTFOUND;
    
    OPEN c_deps;
    LOOP
      FETCH c_deps INTO v_dept_department_id, v_dept_name;
      EXIT WHEN c_deps%NOTFOUND;
      
      IF v_emp_name IS NOT NULL AND v_dept_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE(v_emp_name || ' works in ' || v_dept_name);
      END IF;
    END LOOP;
    CLOSE c_deps;
  END LOOP;
  
  CLOSE c_emps;
END;

--20. Combining Transactions and Multiple Cursors
DECLARE
  CURSOR c_emps IS
    SELECT employee_id, salary FROM employees WHERE department_id = 10;
    
  CURSOR c_deps IS
    SELECT department_id, budget FROM departments WHERE department_id = 10;

  v_employee_id employees.employee_id%TYPE;
  v_salary employees.salary%TYPE;
  v_budget departments.budget%TYPE;
  
  v_total_salary NUMBER := 0;
  v_threshold NUMBER := 10000;
  
BEGIN
  -- Start transaction
  SAVEPOINT before_update;
  
  OPEN c_emps;
  LOOP
    FETCH c_emps INTO v_employee_id, v_salary;
    EXIT WHEN c_emps%NOTFOUND;
    
    v_total_salary := v_total_salary + v_salary;
  END LOOP;
  CLOSE c_emps;

  OPEN c_deps;
  FETCH c_deps INTO v_budget;
  CLOSE c_deps;
  
  IF v_total_salary > v_threshold THEN
    -- Update department budgets according to conditions
    UPDATE departments
    SET budget = budget - v_total_salary
    WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE('Budget updated.');
  ELSE
    -- Roll back transaction
    ROLLBACK TO SAVEPOINT before_update;
    DBMS_OUTPUT.PUT_LINE('Budget update rolled back.');
  END IF;
  
  -- Commit transaction
  COMMIT;
  
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;


--21. Report generation using complex CASE constructs and loops
DECLARE
  CURSOR c_sales IS
    SELECT sale_person, sale_amount, sale_date
    FROM hr.sales_data
    WHERE sale_date BETWEEN SYSDATE - 30 AND SYSDATE;
    
  v_sale_person hr.sales_data.sale_person%TYPE;
  v_sale_amount hr.sales_data.sale_amount%TYPE;
  v_sale_date hr.sales_data.sale_date%TYPE;
  
  v_total_sales NUMBER := 0;
BEGIN
  OPEN c_sales;
  LOOP
    FETCH c_sales INTO v_sale_person, v_sale_amount, v_sale_date;
    EXIT WHEN c_sales%NOTFOUND;
    
    v_total_sales := v_total_sales + v_sale_amount;
    
    DBMS_OUTPUT.PUT_LINE('Sales Person: ' || v_sale_person ||
                         ', Amount: ' || v_sale_amount ||
                         ', Date: ' || v_sale_date);
    
    DBMS_OUTPUT.PUT_LINE(
      CASE
        WHEN v_sale_amount < 1000 THEN 'Low Sales'
        WHEN v_sale_amount BETWEEN 1000 AND 5000 THEN 'Moderate Sales'
        ELSE 'High Sales'
      END
    );
  END LOOP;
  CLOSE c_sales;
  
  DBMS_OUTPUT.PUT_LINE('Total Sales in the Last 30 Days: ' || v_total_sales);
END;


--22. Multiple nested cursors and error handling
DECLARE
  CURSOR c_departments IS
    SELECT department_id, department_name FROM departments;
    
  CURSOR c_employees (p_dept_id NUMBER) IS
    SELECT employee_id, employee_name, salary FROM employees WHERE department_id = p_dept_id;
  
  v_dept_id departments.department_id%TYPE;
  v_dept_name departments.department_name%TYPE;
  v_emp_id employees.employee_id%TYPE;
  v_emp_name employees.employee_name%TYPE;
  v_salary employees.salary%TYPE;
  
  v_total_salary NUMBER;
  
BEGIN
  OPEN c_departments;
  LOOP
    FETCH c_departments INTO v_dept_id, v_dept_name;
    EXIT WHEN c_departments%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_dept_name);
    
    OPEN c_employees(v_dept_id);
    LOOP
      FETCH c_employees INTO v_emp_id, v_emp_name, v_salary;
      EXIT WHEN c_employees%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name || ', Salary: ' || v_salary);
      v_total_salary := v_total_salary + v_salary;
    END LOOP;
    CLOSE c_employees;
    
    DBMS_OUTPUT.PUT_LINE('Total Salary for Department ' || v_dept_name || ': ' || v_total_salary);
    
  END LOOP;
  CLOSE c_departments;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

--23. Transaction Management and Complex Conditional Branching
DECLARE
  v_emp_id employees.employee_id%TYPE := 100;
  v_new_salary employees.salary%TYPE := 12000;
  v_current_salary employees.salary%TYPE;
  v_department_budget departments.budget%TYPE;
  v_department_id employees.department_id%TYPE;
  
BEGIN
  -- Start transaction
  SAVEPOINT before_update;
  
  -- Get employee's current salary and department ID
  SELECT salary, department_id INTO v_current_salary, v_department_id
  FROM employees WHERE employee_id = v_emp_id;
  
  -- Get department's budget
  SELECT budget INTO v_department_budget
  FROM departments WHERE department_id = v_department_id;
  
  IF v_current_salary < v_new_salary THEN
    IF (v_department_budget - (v_new_salary - v_current_salary)) >= 0 THEN
      -- Update salary
      UPDATE employees
      SET salary = v_new_salary
      WHERE employee_id = v_emp_id;
      
      -- Update department's budget
      UPDATE departments
      SET budget = budget - (v_new_salary - v_current_salary)
      WHERE department_id = v_department_id;
      
      DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
    ELSE
      -- Processing when the budget is insufficient
      ROLLBACK TO SAVEPOINT before_update;
      DBMS_OUTPUT.PUT_LINE('Error: Department budget insufficient.');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('No salary increase required.');
  END IF;
  
  -- Commit the transaction
  COMMIT;
  
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;


--24. Example of combining multiple triggers and cursors
CREATE OR REPLACE TRIGGER trg_before_insert_employees
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
  IF :NEW.salary < 1000 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be at least 1000.');
  END IF;
END;
/


DECLARE
  CURSOR c_high_salary IS
    SELECT employee_id, employee_name, salary FROM employees WHERE salary > 10000;
    
  v_emp_id employees.employee_id%TYPE;
  v_emp_name employees.employee_name%TYPE;
  v_salary employees.salary%TYPE;
  
BEGIN
  --Get high-salary employee information
  OPEN c_high_salary;
  LOOP
    FETCH c_high_salary INTO v_emp_id, v_emp_name, v_salary;
    EXIT WHEN c_high_salary%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('High Salary Employee: ' || v_emp_name || ', Salary: ' || v_salary);
  END LOOP;
  CLOSE c_high_salary;
  
  --Inserting data
  INSERT INTO employees (employee_id, employee_name, salary) 
  VALUES (101, 'John Doe', 950);
  
  --Updating data
  UPDATE employees
  SET salary = 12000
  WHERE employee_id = 101;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

--PLSQL Programming - Select Values Block

DECLARE
  v_emp_name hr.employees.first_name%TYPE;
  v_emp_id hr.employees.employee_id%TYPE := 100;
BEGIN
  -- Get a single value and store it in a variable
  SELECT first_name || ' ' || last_name
  INTO v_emp_name
  FROM hr.employees
  WHERE employee_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || v_emp_id);
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Multiple employees found with ID: ' || v_emp_id);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;




--    select FIRST_NAME||LAST_NAME,DEPARTMENT_ID  from HR.hr.employees where EMPLOYEE_ID='102';



    
    