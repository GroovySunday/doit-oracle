CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
   IF TO_CHAR(sysdate, 'DY') IN ('토', '일') THEN
      IF INSERTING THEN
         raise_application_error(-20000, '주말 사원정보 추가 불가');
      ELSIF UPDATING THEN
         raise_application_error(-20001, '주말 사원정보 수정 불가');
      ELSIF DELETING THEN
         raise_application_error(-20002, '주말 사원정보 삭제 불가');
      ELSE
         raise_application_error(-20003, '주말 사원정보 변경 불가');
      END IF;
   END IF;
END;
/