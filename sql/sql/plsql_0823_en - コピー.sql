
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


--    select FIRST_NAME||LAST_NAME,DEPARTMENT_ID  from HR.EMPLOYEES where EMPLOYEE_ID='102';



    
    