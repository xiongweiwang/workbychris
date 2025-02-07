
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
        dbms_output.put_line(aboutinfo);
    end loop;
    <<endpoint>>
    dbms_output.put_line(over);
end;


--例外
-- 宣言部
DECLARE
  name VARCHAR2(10);
  noNameException EXCEPTION;
-- 実行部
BEGIN
  name := '';

  IF (name is not null) THEN
    DBMS_OUTPUT.PUT_LINE('名前は' || name || 'です。');
  ELSE
    RAISE noNameException;
  END IF;
-- 例外処理部
EXCEPTION
  WHEN noNameException THEN
    DBMS_OUTPUT.PUT_LINE('名前がありません。');
END;



    select FIRST_NAME||LAST_NAME,DEPARTMENT_ID  from HR.EMPLOYEES where EMPLOYEE_ID='100';

