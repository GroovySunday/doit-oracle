DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;

   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�');

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
      DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
      DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/