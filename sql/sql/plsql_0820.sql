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
    v_b:=30;
    dbms_output.put_line('The result is :' || (v_a+v_b));
end;








--------
--常量名 constant 数据类型：=常量值
week_day constant Integer: = 7;

--1.·数值类型
NUMBER  PLS_INTEGER  BINARY_INTEGER

--2.字符类型
VARCHAR2 CHAR LONG NCHAR NVARCHAR2

--3.日期类型 DATE
-- 宣言部
DECLARE
  date_time VARCHAR2(50);
-- 実行部
BEGIN
  SELECT SYSDATE
  INTO date_time
  FROM DUAL;

  DBMS_OUTPUT.PUT_LINE(date_time);
END;

--4.布尔类型
BOOLEAN
TURE FALSE NULL

-- 1. %TYPE类型
declare
    var_name student.sname%type;
    var_sdept student.sdept%type;
begin
    select name,sdept into var_name,var_sdept from student where sno='';
    dbms_output.put_line('The result is :' || (var_name ||',sdept:'||var_sdept));
end;


-- 宣言部
DECLARE
  depNo SCOTT.DEPT.DEPTNO%TYPE;
  depName SCOTT.DEPT.DNAME%TYPE;
-- 処理部
BEGIN
  SELECT
    DEPTNO,
    DNAME
  INTO
    depNo,
    depName
  FROM
    SCOTT.DEPT
  WHERE
    DEPTNO = 10;

  DBMS_OUTPUT.PUT_LINE('部署コード：' || depNo);
  DBMS_OUTPUT.PUT_LINE('部署名：' || depName);
END;


--2.RECORD类型
type stu_type is record(
    var_sname varchar2(30),
    var_sage char(3),
    var_sdept varchar2(30)
);


DECLARE
type stu_type is record(
    var_name student.sname%type,
    var_sdept student.sdept%type
    );
stuinfo stu_type
begin
    
    select sname,sdept into stuinfo from student where sno='';
    dbms_output.put_line('The result is :' || (stuinfo.var_name ||',sdept:'||stuinfo.var_sdept));
end;

--3.ROWTYPE类型

DECLARE
rowvar_stu student%rowtype;
begin
    
    select * into rowvar_stu from student where sno='';
    dbms_output.put_line('The result is :' || (rowvar_stu.sname ||',sdept:'||rowvar_stu.sdept));
end;

-- 宣言部
DECLARE
  dep SCOTT.DEPT%ROWTYPE;
-- 処理部
BEGIN
  SELECT
    DEPTNO,
    DNAME,
    LOC
  INTO
    dep
  FROM
    SCOTT.DEPT
  WHERE
    DEPTNO = 10;

  DBMS_OUTPUT.PUT_LINE('部署コード：' || dep.DEPTNO);
  DBMS_OUTPUT.PUT_LINE('部署名：' || dep.DNAME);
  DBMS_OUTPUT.PUT_LINE('地域：' || dep.LOC);
END;

--SELECT DEPTNO, DNAME, LOC...の部分は、SELECT *...と書き換えることも可能です。

---plsql 选择与循环
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


--if-then语句；
if<condition_expression> then
    plsql_sentence;
end if;

declare
    v_name1 varchar2(30);
    v_name2 varchar2(30);
begin
    v_name1 :='qf'
    v_name2 :='qfedu'
    if length(v_name1) < length(v_name2) then
        dbms_output.putline(v_name2||'is longer then'||v_name1);
    else
        dbms_output.putline(v_name2||'is shortter then'||v_name1);
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
    v_grade :=&grade
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

--1. loop 语句
loop
    循环执行的语句块；
    exit when 循环结束条件；
    循环结束条件修改；
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

--2. while...loop语句
while(循环条件) loop
    循环执行的语句块；
    循环结束条件修改；
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

--3. for语句
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



-- 宣言部
DECLARE
-- 処理部
BEGIN
  FOR i IN 1..12 LOOP
    IF (i IN (2, 4, 6, 9, 11)) THEN
      DBMS_OUTPUT.PUT_LINE(i || '月は「小の月」です');
    ELSE
      DBMS_OUTPUT.PUT_LINE(i || '月は「大の月」です');
    END IF;
  END LOOP;
END;


--选择和跳转语句
--1.case
declare
    season int :=0;
    aboutinfo varchar2(50);
begin
    season :=&season;
    case season
        when 1 then
            aboutinfo:=season||'month:1、2、3';
        when 2 then
            aboutinfo:=season||'month:4、5、6';
        when 3 then
            aboutinfo:=season||'month:7、8、9';
        when 4 then
            aboutinfo:=season||'month:10、11、12';
        else
            aboutinfo:='season error';
    end case;
    dbms_output.put_line(aboutinfo);
end;

--2. goto语句 无条件跳转 慎用
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

--P41:
Japanese: PLSQLプログラミング - 明示的カーソルと暗黙的カーソル
English: PLSQL Programming - Explicit and Implicit Cursors
Chinese: PLSQL编程 - 显式游标和隐式游标

--暗黙的カーソル
begin
    update stuent set sage=sage+1 where sdept='CS';
    if sql%notfound then
        dbms_output.put_line('not found any student');
    else
        dbms_output.put_line(sql%rowcount || 'students has changed');
    end if;
end;

--result
   2 students has changed



-- 2. 明示的カーソル (Explicit Cursor)
declare
    cursor cur_stu is select sno,sname,sage from student where sdept = 'CS';
    type record_stu is RECORD
    (
        var_sno student.sno%type,
        var_sname student.var_sname%type,
        var_sage student.sage%type
    )
    stu_row record_stu;
begin
    open cur_stu;
    fetch cur_stu into stu_row;
    while cur_stu%found loop
        dbms_output.put_line(stu_row.var_sname||'id:'||stu_row.var_sno||'age:'||stu_row.var_sage);
        fetch cur_stu into stu_row;
    end loop;
    CLOSE cur_stu;
end;

DECLARE
  CURSOR emp_cursor IS
    SELECT employee_id, last_name FROM employees WHERE department_id = 10;
    
  v_employee_id employees.employee_id%TYPE;
  v_employee_name employees.last_name%TYPE;
BEGIN
  OPEN emp_cursor;
  
  LOOP
    FETCH emp_cursor INTO v_employee_id, v_employee_name;
    EXIT WHEN emp_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_employee_name);
  END LOOP;
  
  CLOSE emp_cursor;
END;

--例外
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

--3.
--用户自定义异常
DECLARE
  e_invalid_salary EXCEPTION;
  v_salary NUMBER := 25000;
BEGIN
  IF v_salary > 20000 THEN
    RAISE e_invalid_salary;  -- ユーザー定義の例外を発生させる
  END IF;
   DBMS_OUTPUT.PUT_LINE('salary: ' || v_salary);
  
EXCEPTION
  WHEN e_invalid_salary THEN
    DBMS_OUTPUT.PUT_LINE('エラー: 給与が上限を超えています。');
END;

--Drop procedure my_proc1;
--function

create or replace function get_avg_age(param_sdept varchar2)
return number
is
    avg_result number;

begin
    select avg(age) into avg_result from student where trim(sdept) = param_sdept;
    return(round(avg_result,2));
    exception
        when no_data_found then
        dbms_output.put_line('sdept not found');
        return(0);
end;


--drop function get_avg_age;

