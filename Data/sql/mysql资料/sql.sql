use test;

drop table IF EXISTS EMP cascade;

drop table IF EXISTS  DEPT cascade;


create table DEPT
(
  DEPTNO SMALLINT(2) not null,
  DNAME  VARCHAR(14),
  LOC    VARCHAR(13)
);

alter table DEPT
  add constraint PK_DEPT primary key (DEPTNO);

create table EMP
(
  EMPNO    SMALLINT(4) not null,
  ENAME    VARCHAR(10),
  JOB      VARCHAR(9),
  MGR      BIGINT(4),
  HIREDATE DATE,
  SAL      DOUBLE(7,2),
  COMM     DOUBLE(7,2),
  DEPTNO   SMALLINT(2)
);

alter table EMP
  add constraint PK_EMP primary key (EMPNO);

alter table EMP
  add constraint FK_DEPTNO foreign key (DEPTNO)
  references DEPT (DEPTNO);

insert into DEPT (DEPTNO, DNAME, LOC)
values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT (DEPTNO, DNAME, LOC)
values (20, 'RESEARCH', 'DALLAS');
insert into DEPT (DEPTNO, DNAME, LOC)
values (30, 'SALES', 'CHICAGO');
insert into DEPT (DEPTNO, DNAME, LOC)
values (40, 'OPERATIONS', 'BOSTON');
commit;

insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7369, 'SMITH', 'CLERK', 7902, date_format('1980-12-17', '%Y-%m-%d'), 800, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7499, 'ALLEN', 'SALESMAN', 7698, date_format('1981-02-20', '%Y-%m-%d'), 1600, 300, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7521, 'WARD', 'SALESMAN', 7698, date_format('1981-02-22', '%Y-%m-%d'), 1250, 500, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7566, 'JONES', 'MANAGER', 7839, date_format('1981-02-04', '%Y-%m-%d'), 2975, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7654, 'MARTIN', 'SALESMAN', 7698, date_format('1981-09-28', '%Y-%m-%d'), 1250, 1400, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7698, 'BLAKE', 'MANAGER', 7839, date_format('1981-01-05', '%Y-%m-%d'), 2850, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7782, 'CLARK', 'MANAGER', 7839, date_format('1981-09-06', '%Y-%m-%d'), 2450, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7788, 'SCOTT', 'ANALYST', 7566, date_format('1987-04-19', '%Y-%m-%d'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7839, 'KING', 'PRESIDENT', null, date_format('1981-11-17', '%Y-%m-%d'), 5000, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7844, 'TURNER', 'SALESMAN', 7698, date_format('1981-08-09', '%Y-%m-%d'), 1500, 0, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7876, 'ADAMS', 'CLERK', 7788, date_format('1987-05-23', '%Y-%m-%d'), 1100, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7900, 'JAMES', 'CLERK', 7698, date_format('1981-03-12', '%Y-%m-%d'), 950, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7902, 'FORD', 'ANALYST', 7566, date_format('1981-03-12', '%Y-%m-%d'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7934, 'MILLER', 'CLERK', 7782, date_format('1982-01-23', '%Y-%m-%d'), 1300, null, 10);
commit;

