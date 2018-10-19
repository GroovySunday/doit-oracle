DECLARE
   -- Ŀ�� �����͸� �Է��� ���� ����
   V_DEPT_ROW DEPT%ROWTYPE;

   -- ����� Ŀ�� ����(Declaration)
   CURSOR c1 IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT;

BEGIN
   -- Ŀ�� ����(Open)
   OPEN c1;

   LOOP
      -- Ŀ���κ��� �о�� ������ ���(Fetch)
      FETCH c1 INTO V_DEPT_ROW;

      -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ� ����
      EXIT WHEN c1%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO
                        || ', DNAME : ' || V_DEPT_ROW.DNAME
                        || ', LOC : ' || V_DEPT_ROW.LOC);
   END LOOP;

   -- Ŀ�� �ݱ�(Close)
   CLOSE c1;

END;
/