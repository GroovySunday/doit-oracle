-- 실습 18-1
DECLARE
   V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
   SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
     FROM DEPT
    WHERE DEPTNO = 40;
   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
   DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
   DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- 실습 18-2
DECLARE
   -- 커서 데이터를 입력할 변수 선언
   V_DEPT_ROW DEPT%ROWTYPE;

   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT
       WHERE DEPTNO = 40;

BEGIN
   -- 커서 열기(Open)
   OPEN c1;

   -- 커서로부터 읽어온 데이터 사용(Fetch)
   FETCH c1 INTO V_DEPT_ROW;

   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
   DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
   DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

   -- 커서 닫기(Close)
   CLOSE c1;

END;
/

-- 실습 18-3
DECLARE
   -- 커서 데이터를 입력할 변수 선언
   V_DEPT_ROW DEPT%ROWTYPE;

   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT;

BEGIN
   -- 커서 열기(Open)
   OPEN c1;

   LOOP
      -- 커서로부터 읽어온 데이터 사용(Fetch)
      FETCH c1 INTO V_DEPT_ROW;

      -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성 지정
      EXIT WHEN c1%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO
                        || ', DNAME : ' || V_DEPT_ROW.DNAME
                        || ', LOC : ' || V_DEPT_ROW.LOC);
   END LOOP;

   -- 커서 닫기(Close)
   CLOSE c1;

END;
/

-- 실습 18-4
DECLARE
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
   SELECT DEPTNO, DNAME, LOC
     FROM DEPT;

BEGIN
   -- 커서 FOR LOOP 시작 (자동 Open, Fetch, Close)
   FOR c1_rec IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                      || ', DNAME : ' || c1_rec.DNAME
                      || ', LOC : ' || c1_rec.LOC);
   END LOOP;

END;
/

SELECT * FROM DEPT_RECORD;

-- 실습 18-5
DECLARE
   -- 커서 데이터를 입력할 변수 선언
   V_DEPT_ROW DEPT%ROWTYPE;
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT
       WHERE DEPTNO = p_deptno;
BEGIN
   -- 10번 부서 처리를 위해 커서 사용
   OPEN c1 (10);
      LOOP
         FETCH c1 INTO V_DEPT_ROW;
         EXIT WHEN c1%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('10번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                                     || ', DNAME : ' || V_DEPT_ROW.DNAME
                                     || ', LOC : ' || V_DEPT_ROW.LOC);
      END LOOP;
   CLOSE c1;
   -- 20번 부서 처리를 위해 커서 사용
   OPEN c1 (20);
      LOOP
         FETCH c1 INTO V_DEPT_ROW;
         EXIT WHEN c1%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('20번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                                     || ', DNAME : ' || V_DEPT_ROW.DNAME
                                     || ', LOC : ' || V_DEPT_ROW.LOC);
      END LOOP;
   CLOSE c1;
END;
/

-- 실습 18-6
DECLARE
   -- 사용자가 입력한 부서 번호를 저장하는 변수선언
   v_deptno DEPT.DEPTNO%TYPE;
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
      SELECT DEPTNO, DNAME, LOC
        FROM DEPT
       WHERE DEPTNO = p_deptno;
BEGIN
   -- INPUT_DEPTNO에 부서 번호 입력받고 v_deptno에 대입
   v_deptno := &INPUT_DEPTNO;
   -- 커서 FOR LOOP 시작. c1 커서에 v_deptno를 대입
   FOR c1_rec IN c1(v_deptno) LOOP
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                      || ', DNAME : ' || c1_rec.DNAME
                      || ', LOC : ' || c1_rec.LOC);
   END LOOP;
END;
/

-- 실습 18-7
BEGIN
   UPDATE DEPT SET DNAME='DATABASE'
    WHERE DEPTNO = 50;

   DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);

   IF (SQL%FOUND) THEN
      DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : true');
   ELSE
      DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : false');
   END IF;

   IF (SQL%ISOPEN) THEN
      DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : true');
   ELSE
      DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : false');
   END IF;

END;
/

-- 실습 18-8
DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;
END;
/

-- 실습 18-9
DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
   WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 실습 18-10
DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;

   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다');

EXCEPTION
   WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 실습 18-11
DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;

   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다');

EXCEPTION
   WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 요구보다 많은 행 추출 오류 발생');
   WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
END;
/

-- 실습 18-12
DECLARE
   v_wrong NUMBER;
BEGIN
   SELECT DNAME INTO v_wrong
     FROM DEPT
    WHERE DEPTNO = 10;

   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다');

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
      DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
      DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/

