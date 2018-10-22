BEGIN
   FOR i IN REVERSE 0..4 LOOP
      DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
      END LOOP;
END;
/