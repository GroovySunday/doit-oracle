CREATE TABLE EMP_TRG_LOG(
   TABLENAME VARCHAR2(10), -- DML이 수행된 테이블 이름
   DML_TYPE VARCHAR2(10),  -- DML 명령어의 종류
   EMPNO NUMBER(4),        -- DML 대상이 된 사원 번호
   USER_NAME VARCHAR2(30), -- DML을 수행한 USER 이름
   CHANGE_DATE DATE        -- DML이 수행된 날짜
);