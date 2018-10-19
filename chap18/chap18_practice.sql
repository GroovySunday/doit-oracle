-- 잊기 전에 한 번 더 정답

-- 18-1
--①
DECLARE
   -- 커서 데이터가 입력될 변수 선언
   V_EMP_ROW EMP%ROWTYPE;
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
      SELECT *
        FROM EMP;
BEGIN
   -- 커서 열기(Open)
   OPEN c1;
   LOOP
       -- 커서로부터 읽어온 데이터 사용(Fetch)
       FETCH c1 INTO V_EMP_ROW;
       -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성지정
       EXIT WHEN c1%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('EMPNO : '    || V_EMP_ROW.EMPNO
                       || ', ENAME : '    || V_EMP_ROW.ENAME
                       || ', JOB : '      || V_EMP_ROW.JOB
                       || ', SAL : '      || V_EMP_ROW.SAL
                       || ', DEPTNO : '   || V_EMP_ROW.DEPTNO		
		       );
   END LOOP;
   -- 커서 닫기(Close)
   CLOSE c1;
END;
/

--②
DECLARE
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
      SELECT *
        FROM EMP;
BEGIN
   -- 커서 FOR LOOP 시작 (자동 Open, Fetch, Close)
   FOR c1_rec IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('EMPNO : '    || c1_rec.EMPNO
                      || ', ENAME : '    || c1_rec.ENAME
                      || ', JOB : '      || c1_rec.JOB
                      || ', SAL : '      || c1_rec.SAL
                      || ', DEPTNO : '   || c1_rec.DEPTNO);
   END LOOP;
END;
/

-- 18-2
DECLARE
   v_wrong DATE;
BEGIN
   SELECT ENAME INTO v_wrong
     FROM EMP
    WHERE EMPNO = 7369;

    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다');

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다.' 
                        || TO_CHAR(SYSDATE, '[YYYY"년"MM"월"DD"일" HH24"시"mm"분"SS"초"]'));
                
      DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
      DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/