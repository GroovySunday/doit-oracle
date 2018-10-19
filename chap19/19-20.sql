DECLARE
   aftertax NUMBER;
BEGIN
   aftertax := func_aftertax(3000);
   DBMS_OUTPUT.PUT_LINE('after-tax income : ' || aftertax);
END;
/