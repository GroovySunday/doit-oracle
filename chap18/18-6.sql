DECLARE
   -- ����ڰ� �Է��� �μ� ��ȣ�� �����ϴ� ��������
   v_deptno DEPT.DEPTNO%TYPE;
   -- ����� Ŀ�� ����(Declaration)
   CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT
       WHERE DEPTNO = p_deptno;
BEGIN
   -- INPUT_DEPTNO�� �μ� ��ȣ �Է¹ް� v_deptno�� ����
   v_deptno := &INPUT_DEPTNO;
   -- Ŀ�� FOR LOOP ����. c1 Ŀ���� v_deptno�� ����
   FOR c1_rec IN c1(v_deptno) LOOP
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                      || ', DNAME : ' || c1_rec.DNAME
                      || ', LOC : ' || c1_rec.LOC);
   END LOOP;
END;
/