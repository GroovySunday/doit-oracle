-- 잊기 전에 한 번 더 정답

-- 19-1
--①
CREATE OR REPLACE PROCEDURE pro_dept_in
(
   inout_deptno IN OUT DEPT.DEPTNO%TYPE,
   out_dname OUT DEPT.DNAME%TYPE,
   out_loc OUT DEPT.LOC%TYPE
)
IS
BEGIN
   SELECT DEPTNO, DNAME, LOC INTO inout_deptno, out_dname, out_loc
     FROM DEPT
    WHERE DEPTNO = inout_deptno;
END pro_dept_in;
/

--②
DECLARE
   v_deptno DEPT.DEPTNO%TYPE;
   v_dname DEPT.DNAME%TYPE;
   v_loc DEPT.LOC%TYPE;
BEGIN
   v_deptno := 10;
   pro_dept_in(v_deptno, v_dname, v_loc);
   DBMS_OUTPUT.PUT_LINE('부서번호 : ' || v_deptno);
   DBMS_OUTPUT.PUT_LINE('부서명 : ' || v_dname);
   DBMS_OUTPUT.PUT_LINE('지역 : ' || v_loc);
END;
/

-- 19-2
CREATE OR REPLACE FUNCTION func_date_kor(
   in_date IN DATE
)
RETURN VARCHAR2
IS   
BEGIN
   RETURN (TO_CHAR(in_date, 'YYYY"년"MM"월"DD"일"'));
END func_date_kor;
/

-- 19-3
--①
CREATE TABLE DEPT_TRG
    AS SELECT * FROM DEPT;

--②
CREATE TABLE DEPT_TRG_LOG(
   TABLENAME   VARCHAR2(10), -- DML이 수행된 테이블 이름
   DML_TYPE    VARCHAR2(10), -- DML 명령어의 종류
   DEPTNO      NUMBER(2),    -- DML 대상이 된 부서번호
   USER_NAME   VARCHAR2(30), -- DML을 수행한 USER 이름
   CHANGE_DATE DATE          -- DML 이 수행된 날짜
);

--③
CREATE OR REPLACE TRIGGER trg_dept_log
AFTER
INSERT OR UPDATE OR DELETE ON DEPT_TRG
FOR EACH ROW
BEGIN
   IF INSERTING THEN
     INSERT INTO DEPT_TRG_LOG
     VALUES ('DEPT_TRG', 'INSERT', :new.deptno,
             SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);

   ELSIF UPDATING THEN
     INSERT INTO DEPT_TRG_LOG
     VALUES ('DEPT_TRG', 'UPDATE', :old.deptno,
             SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);

   ELSIF DELETING THEN
     INSERT INTO DEPT_TRG_LOG
     VALUES ('DEPT_TRG', 'DELETE', :old.deptno,
             SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
   END IF;
END;
/