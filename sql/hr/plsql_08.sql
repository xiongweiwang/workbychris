
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
CREATE OR REPLACE package pack_emp is
    function fun_avg_sage


--Stored Procedures and Triggers - Indexes

    select FIRST_NAME||LAST_NAME,DEPARTMENT_ID  from HR.EMPLOYEES where EMPLOYEE_ID='102';



SELECT employee_id, first_name || ' ' || last_name as employee_name FROM hr.employees where department_id = '10';





INSERT INTO hr.sales_data (sale_id, sale_date, product_id, quantity_sold, unit_price, sale_person, customer_id, salesperson_id)
VALUES (1, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 101, 10, 19.99, 'Alice Johnson', 501, 301);

INSERT INTO hr.sales_data (sale_id, sale_date, product_id, quantity_sold, unit_price, sale_person, customer_id, salesperson_id)
VALUES (2, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 102, 5, 29.99, 'Bob Smith', 502, 302);

INSERT INTO hr.sales_data (sale_id, sale_date, product_id, quantity_sold, unit_price, sale_person, customer_id, salesperson_id)
VALUES (3, TO_DATE('2024-08-03', 'YYYY-MM-DD'), 103, 8, 39.99, 'Charlie Brown', 503, 303);

-- 売上総額を計算するビューの作成
CREATE OR REPLACE VIEW hr.sales_data_view AS
SELECT 
    sale_id,
    sale_date,
    product_id,
    quantity_sold,
    unit_price,
    (quantity_sold * unit_price) AS sale_amount,  -- 売上総額を計算
    sale_person,
    customer_id,
    salesperson_id
FROM 
    hr.sales_data;

