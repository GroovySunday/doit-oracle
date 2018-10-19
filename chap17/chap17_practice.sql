-- 잊기 전에 한 번 더 정답

-- 17-1
--①
CREATE TABLE EMP_RECORD
    AS SELECT * 
         FROM EMP
        WHERE 1<>1;

--②
DECLARE
   TYPE REC_EMP IS RECORD (
      empno    EMP.EMPNO%TYPE NOT NULL := 9999,
      ename    EMP.ENAME%TYPE,
      job      EMP.JOB%TYPE,
      mgr      EMP.MGR%TYPE,
      hiredate EMP.HIREDATE%TYPE,
      sal      EMP.SAL%TYPE,
      comm     EMP.COMM%TYPE,
      deptno   EMP.DEPTNO%TYPE
   );
   emp_rec REC_EMP;
BEGIN
   emp_rec.empno    := 1111;
   emp_rec.ename    := 'TEST_USER';
   emp_rec.job      := 'TEST_JOB';
   emp_rec.mgr      := null;
   emp_rec.hiredate := TO_DATE('20180301','YYYYMMDD');
   emp_rec.sal      := 3000;
   emp_rec.comm     := null;
   emp_rec.deptno   := 40;

   INSERT INTO EMP_RECORD
   VALUES emp_rec;
END;
/

-- 17-2
DECLARE
   TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE
      INDEX BY PLS_INTEGER;
   emp_arr ITAB_EMP;
   idx PLS_INTEGER := 0;
BEGIN
   FOR i IN (SELECT * FROM EMP) LOOP
      idx := idx + 1;
      emp_arr(idx).empno    := i.EMPNO;
      emp_arr(idx).ename    := i.ENAME;
      emp_arr(idx).job      := i.JOB;
      emp_arr(idx).mgr      := i.MGR;
      emp_arr(idx).hiredate := i.HIREDATE;
      emp_arr(idx).sal      := i.SAL;
      emp_arr(idx).comm     := i.COMM;
      emp_arr(idx).deptno   := i.DEPTNO;

      DBMS_OUTPUT.PUT_LINE(
         emp_arr(idx).empno     || ' : ' ||
         emp_arr(idx).ename     || ' : ' ||
         emp_arr(idx).job       || ' : ' ||
         emp_arr(idx).mgr       || ' : ' ||
         emp_arr(idx).hiredate  || ' : ' ||
         emp_arr(idx).sal       || ' : ' ||
         emp_arr(idx).comm      || ' : ' ||
         emp_arr(idx).deptno);

   END LOOP;
END;
/
