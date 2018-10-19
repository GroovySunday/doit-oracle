CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
   IF TO_CHAR(sysdate, 'DY') IN ('��', '��') THEN
      IF INSERTING THEN
         raise_application_error(-20000, '�ָ� ������� �߰� �Ұ�');
      ELSIF UPDATING THEN
         raise_application_error(-20001, '�ָ� ������� ���� �Ұ�');
      ELSIF DELETING THEN
         raise_application_error(-20002, '�ָ� ������� ���� �Ұ�');
      ELSE
         raise_application_error(-20003, '�ָ� ������� ���� �Ұ�');
      END IF;
   END IF;
END;
/