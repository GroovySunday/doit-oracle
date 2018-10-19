-- 11-1
① 세션 A : DNAME은 DATABASE, LOC은 SEOUL / 
   세션 B : DNAME은 SALES, LOC은 CHICAGO

② 세션 B의 UPDATE 명령이 실행된 후 대기상태(HANG)가 된다. 세션 A의 트랜잭션이
아직 종료되지 않았기 때문이다.

③ 세션 A의 ROLLBACK 명령이 실행되자마자 세션 B의 UPDATE문이 수행된다. 세션 A
의 트랜잭션에 의한 행 레벨 록이 끝났기 때문이다.

④ 세션 A : DNAME은 SALES, LOC은 CHICAGO
   세션 B : DNAME은 DATABASE, LOC은 SEOUL

⑤ 세션 A : DNAME은 DATABASE, LOC은 SEOUL
   세션 B : DNAME은 DATABASE, LOC은 SEOUL