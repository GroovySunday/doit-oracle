CREATE TABLE EMP_TRG_LOG(
   TABLENAME VARCHAR2(10), -- DML�� ����� ���̺� �̸�
   DML_TYPE VARCHAR2(10),  -- DML ��ɾ��� ����
   EMPNO NUMBER(4),        -- DML ����� �� ��� ��ȣ
   USER_NAME VARCHAR2(30), -- DML�� ������ USER �̸�
   CHANGE_DATE DATE        -- DML�� ����� ��¥
);