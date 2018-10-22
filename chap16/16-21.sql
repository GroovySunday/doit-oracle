BEGIN
   FOR i IN 0..4 LOOP
      CONTINUE WHEN MOD(i, 2) = 1;
      DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
   END LOOP;
END;
/