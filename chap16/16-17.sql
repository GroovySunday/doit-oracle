DECLARE
   V_NUM NUMBER := 0;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
      V_NUM := V_NUM + 1;
      EXIT WHEN V_NUM > 4;
   END LOOP;
END;
/