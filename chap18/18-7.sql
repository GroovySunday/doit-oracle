BEGIN
   UPDATE DEPT SET DNAME='DATABASE'
    WHERE DEPTNO = 50;

   DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT);

   IF (SQL%FOUND) THEN
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : true');
   ELSE
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : false');
   END IF;

   IF (SQL%ISOPEN) THEN
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : true');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : false');
   END IF;

END;
/