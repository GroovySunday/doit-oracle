CREATE OR REPLACE PACKAGE pkg_example
IS
   spec_no NUMBER := 10;
   FUNCTION func_aftertax(sal NUMBER) RETURN NUMBER;
   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE);
   PROCEDURE pro_dept(in_deptno IN DEPT.DEPTNO%TYPE);
END;
/