BEGIN
   FOR i IN 0..4 LOOP
      CONTINUE WHEN MOD(i, 2) = 1;
      DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
   END LOOP;
END;
/