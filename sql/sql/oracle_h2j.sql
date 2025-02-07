select * from hr.employees e

select * from hr.countries e

--Calculate the daily salary for each employee
select (salary*12)/365 from hr.employees

--String concatenation operator ||
--文字列連結演算子 ||
select last_name,first_name  from hr.employees

select last_name || first_name  名前 from hr.employees

select last_name || ' ' || first_name 名前 from hr.employees

--Eliminate duplicate rows distinct
--重複行を個別に削除する
select department_id from hr.employees
select distinct department_id from hr.employees

--Conditional
--条件付き
--Not equal to 等しくない <>
--between and
select * from hr.employees where salary between 3000 and 5000
--in
select * from hr.employees where salary in(3000,6000)
--like
    -- Employees whose second to last letter in their name is a
    -- % means any match, either yes or no
    -- _ means yes, and only one
select * from hr.employees where first_name like '%a_'
--is null
select * from hr.employees where department_id is null

--Logical conditions
--論理条件
select * from hr.employees where first_name not like '%a_'
--排除姓名里倒数第二个字母是a的员工
--Exclude employees whose second-to-last letter in their name is a

1查询所有员工的姓名（last_name+' '+first_name）,工资，年终奖金（工资的百分之八十 乘以 commission_pct 在加500）别名（年终奖）。

2查询所有有人员的部门编号，并且去掉重复行。

3查询员工的姓名，工资，岗位(JOB_ID)，要求工资为2000~3000并且JOB_ID以‘ERK’结束

4查询所有有人员的岗位编号，要求岗位(JOB_ID)中包含‘L’同时岗位(JOB_ID)名称以‘N’或‘K’结束，去掉重复行。

--Sorting query
--ソートクエリ
select * from hr.employees order by salary desc

--Related Query 関連クエリ 关联查询

--Cartesian Product デカルト 笛卡尔积  
select
    e.first_name
    , d.department_name 
from
    hr.employees e ,hr.departments d 

--只查询员工表
select e.first_name,e.department_id from hr.employees e;
 
--只查询部门表
select d.department_id,d.department_name from hr.departments d;

--Query the employee's name and the name of the department to which the employee belongs
--查询员工姓名以及员工所在部门的名称  
select
    e.first_name
    , d.department_name 
from
    hr.employees e 
    left join hr.departments d 
        on e.department_id = d.department_id
        

--Statistical Functions
--統計関数
--count 总数
--How many people have a monthly salary higher than 5000?
--月給が 5,000 を超える人が何人いるかを数えてください
--统计月薪高于5000的有多少人
select count(*) from hr.employees e where e.salary >5000

--max 最大
--min 最小
--What is the highest and lowest salary among the 100 departments?
--部門 100 の最高給与と最低給与はいくらですか?
--100部门薪水最高最低是多少
select max(salary) ,min(salary)  from hr.employees e where e.department_id = 100

--avg
--Average salary
select avg(salary) from hr.employees e

--Group query
--グループクエリ
--分组查询

--See average salaries for each sector
--部門ごとの平均給与を表示する
--查看每个部门的平均薪资
select avg(salary), e.department_id from hr.employees e group by e.department_id

--When grouping, the query field can only be a statistical function or the grouped field.
--グループ化する場合、クエリ フィールドは統計関数またはグループ化されたフィールドのみにすることができます。
--分组的时候，查询字段，只能是统计函数，或者被分组的字段

--Having is to make conditional judgments on the grouping function
--havingとはグループ化関数の条件判定を行うことです
--having即是对分组函数进行条件判断

--Group by department and find data with an average salary higher than 5000
--部門ごとにグループ化して、部門の平均給与が 5,000 を超えるデータを検索します。
--以部门进行分组，找出部门平均薪资高于5000的数据
select
    avg(salary)
    , e.department_id 
from
    hr.employees e 
group by
    e.department_id 
having
    avg(salary) > 5000

--Exercise 2    
查询部门编号大于等于50小于等于90的部门中工资小于5000的员工的编号、部门编号和工资
显示员工姓名加起来一共15个字符的员工
显示不带有“ R ”的员工的姓名
查询所有员工的部门的平均工资，要求显示部门编号，部门名，部门所在地（需要多表关联查询： employees, department, location）

--Subqueries
--サブクエリ
--子查询

--Count the number of people whose monthly salary is higher than Bruce's
--ブルースの月給より高い人の数を数えてください
--统计月薪高于Bruce的月薪的人数
select
    count(*) 
from
    hr.employees e 
where
    e.salary > ( 
        select
            e.salary 
        from
            hr.employees e 
        where
            e.first_name = 'Bruce'
    )


--Use rownum for paging query
--ページングクエリにrownumを使用する
--使用rownum进行 分页查询

select rownum r, e.* from hr.employees e where rownum<=5

select rownum r, e1.* from
  (
   select e.* from hr.employees e  order by e.salary desc
  ) e1
  
--Find the 5-10 highest-paid records
--給与が最も高い 5 ～ 10 個のデータを見つけます
--查出薪水最高的5-10条数据
select * from
(select rownum r, e1.* from
  (
   select e.* from hr.employees e  order by e.salary desc
  ) e1
) e2 where e2.r >=5 and e2.r<=10

--Exercise 3
查询所在部门所在城市为'South San Francisco'的员工
查找和143在同一个部门和同一个岗位的比他工资高的员工。
查询总工资最多的部门，显示部门编号，部门名



create sequence regions_seq
  increment by 1 
  start with 7 
  maxvalue 9999999

DROP SEQUENCE HR.regions_seq

select regions_seq.nextval from dual
select regions_seq.currval from dual

update dual set  regions_seq.currval = '6'

insert into regions (REGION_ID,REGION_NAME) values(regions_seq.nextval,'Antarctica');
insert into regions (REGION_ID,REGION_NAME) values(regions_seq.nextval,'Australia');

update regions set REGION_ID = 100, REGION_NAME='Modifying multiple fields' where REGION_ID = '100';
select * from regions 
--delete from regions where REGION_ID = '100'

--truncate 
--The truncate command immediately deletes all records in the table and cannot be rolled back!
--truncate table regions

alter table regions add (kills number)
alter table regions modify(kills varchar2(300))
alter table regions drop column kills

--drop table hero
--The drop command immediately deletes all records in the table and cannot be rolled back!

--
create table hr.hero(
  id number,
  name varchar2(30),
  hp number,
  mp number,
  damage number,
  armor number,
  speed number
)

select * from Hr.hero

create sequence hero_seq
  increment by 1 
  start with 1 
  maxvalue 9999999

select hero_seq.currval from dual

insert into hero (id,name,hp,mp,damage,armor,speed) values(hero_seq.nextval,'炸弹人',450,200,45,3,300);

update hero set damage = 46 where id = 10;
update hero set damage = 48, armor=4 where id = 10;

delete from hero where id = 21

delete from hero

truncate table hero
alter table hero add (kills number)
alter table hero modify(name varchar2(300))
alter table hero drop column kills


drop table HR.hero

create table HR.hero(
   id number,
   name varchar2(30) unique,
   hp number,
   mp number,
   damage number,
   armor number,
   speed number
)

insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(1,'teemo',450,200,45,4,30);
insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(2,'goukou',450,200,45,4,30);
insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(3,'naruto',450,200,45,4,30);

create table HR.hero(
   id number,
   name varchar2(30),
   hp number,
   mp number,
   damage number,
   armor number,
   speed number,
   constraint uk_hero_name unique (name)
)

select * from Hr.hero

select * from hero

--Add constraints to an existing table
--给已经存在的表增加约束
alter table hero add constraint pk_hero_id  primary key (id)

alter table hero drop constraint uk_hero_name
alter table hero drop constraint pk_hero_id

--Creating a foreign key constraint
--外部キー制約を作成する
--创建外键约束
create table HR.kill_record(
   id number,
   killerid number,
   killedid number,
   number_ number,
   constraint fk_killer_hero foreign key (killerid) references hero(id),
   constraint fk_killed_hero foreign key (killedid) references hero(id)
);



insert into kill_record (id,killerid,killedid,number_) values(1,2,23,1);

--ORA-02291: 整合性制約(HR.FK_KILLED_HERO)に違反しました - 親キーがありません

select *  from HR.kill_record;
drop table HR.kill_record;


create view herosimple as (
    select id, name from hero
);
select * from herosimple;

update hero set name='炸弹人1' where id = 1;
select * from herosimple;

update herosimple set name='炸弹人3' where id = 3;
select * from herosimple
select * from hero

--Exercise5
为hr.users表的user_id添加主键约束。

为hr.users表的user_name添加非空和唯一约束。

创建一个表hr.department( department_id, department_name)

为hr.users表的DEPARTMENT_ID添加外键约束

删除表hr.users后重新创建它，并在一条SQL语句中一并添加上述的约束条件。













create sequence regions_seq
  increment by 1 
  start with 7 
  maxvalue 9999999

DROP SEQUENCE HR.regions_seq

select regions_seq.nextval from dual
select regions_seq.currval from dual

update dual set  regions_seq.currval = '6'

insert into regions (REGION_ID,REGION_NAME) values(regions_seq.nextval,'Antarctica');
insert into regions (REGION_ID,REGION_NAME) values(regions_seq.nextval,'Australia');

update regions set REGION_ID = 100, REGION_NAME='Modifying multiple fields' where REGION_ID = '100';
select * from regions 
--delete from regions where REGION_ID = '100'

--truncate 
--The truncate command immediately deletes all records in the table and cannot be rolled back!
--truncate table regions

alter table regions add (kills number)
alter table regions modify(kills varchar2(300))
alter table regions drop column kills

--drop table hero
--The drop command immediately deletes all records in the table and cannot be rolled back!

--
create table hr.hero(
  id number,
  name varchar2(30),
  hp number,
  mp number,
  damage number,
  armor number,
  speed number
)

select * from Hr.hero

create sequence hero_seq
  increment by 1 
  start with 1 
  maxvalue 9999999

select hero_seq.currval from dual

insert into hero (id,name,hp,mp,damage,armor,speed) values(hero_seq.nextval,'炸弹人',450,200,45,3,300);

update hero set damage = 46 where id = 10;
update hero set damage = 48, armor=4 where id = 10;

delete from hero where id = 21

delete from hero

truncate table hero
alter table hero add (kills number)
alter table hero modify(name varchar2(300))
alter table hero drop column kills


drop table HR.hero

create table HR.hero(
   id number,
   name varchar2(30) unique,
   hp number,
   mp number,
   damage number,
   armor number,
   speed number
)

insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(4,'teemo',450,200,45,4,30);
insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(5,'goukou',450,200,45,4,30);
insert into HR.hero (id,name,hp,mp,damage,armor,speed) values(6,'naruto',450,200,45,4,30);

create table HR.hero(
   id number,
   name varchar2(30),
   hp number,
   mp number,
   damage number,
   armor number,
   speed number,
   constraint uk_hero_name unique (name)
)

select * from Hr.hero

select * from hero

--Add constraints to an existing table
--给已经存在的表增加约束
alter table hero add constraint pk_hero_id  primary key (id)

alter table hero drop constraint uk_hero_name
alter table hero drop constraint pk_hero_id

--Creating a foreign key constraint
--外部キー制約を作成する
--创建外键约束
create table HR.kill_record(
   id number,
   killerid number,
   killedid number,
   number_ number,
   constraint fk_killer_hero foreign key (killerid) references hero(id),
   constraint fk_killed_hero foreign key (killedid) references hero(id)
);



insert into kill_record (id,killerid,killedid,number_) values(1,2,23,1);

--ORA-02291: 整合性制約(HR.FK_KILLED_HERO)に違反しました - 親キーがありません

select *  from HR.kill_record;
drop table HR.kill_record;


create view herosimple as (
    select id, name from hero
);
select * from herosimple;

update hero set name='炸弹人1' where id = 1;
select * from herosimple;

update herosimple set name='炸弹人3' where id = 3;
select * from herosimple
select * from hero

--Exercise5
为hr.users表的user_id添加主键约束。

为hr.users表的user_name添加非空和唯一约束。

创建一个表hr.department( department_id, department_name)

为hr.users表的DEPARTMENT_ID添加外键约束

删除表hr.users后重新创建它，并在一条SQL语句中一并添加上述的约束条件。









select * from Hr.employees order by employee_id;
------------------------
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1001, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'IT_PROG', 60000, NULL, 101, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1002, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', TO_DATE('2019-03-22', 'YYYY-MM-DD'), 'HR_REP', 55000, NULL, 102, 20);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1003, 'Michael', 'Johnson', 'michael.john@example.com', '555-555-5555', TO_DATE('2018-07-09', 'YYYY-MM-DD'), 'IT_PROG', 75000, NULL, 101, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1004, 'Emily', 'Davis', 'emily.davis@example.com', '222-333-4444', TO_DATE('2021-10-01', 'YYYY-MM-DD'), 'FIN_MGR', 80000, 0.10, 103, 30);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1005, 'William', 'Brown', 'william.bro@example.com', '111-222-3333', TO_DATE('2022-05-19', 'YYYY-MM-DD'), 'SA_REP', 50000, 0.05, 104, 20);















    
