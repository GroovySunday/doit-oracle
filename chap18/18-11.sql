DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;

   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�');

EXCEPTION
   WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('���� ó�� : �䱸���� ���� �� ���� ���� �߻�');
   WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
END;
/