
자정마다 유저의 Message와 search를 업데이트 하는 스케쥴러 만들기 

프로시저 등록

create or replace procedure proc_update_user
is
begin
  update  springuser.USERS SET U_MSGNUM=5, U_SERNUM=1;
end;

프로시저 테스트
exec insert_job_test01;

스케쥴러 등록

DECLARE
  X NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    ( job       => X 
     ,what      => 'springuser.proc_update_user'
     ,next_date => SYSDATE
     ,interval  => 'TRUNC(SYSDATE+1)'
     ,no_parse  => TRUE
    );
END;

스케줄러 실행
commit;


======================================
-- SCHEDULER가 5분마다 돌면서 E_EVAL이 -1이 아니면서 E_REGDATE이 SYSDATE  - E_REGDATE >= 5/24/60 때 E_EVAL 값을 을 -1로 초기화 한다.
CREATE TABLE EVALUATION(
  U_NUM NUMBER,
  E_EVAL NUMBER DEFAULT -1, -- 평가 중인 사람, 평가하는 사람이 없을 경우 -1 값으로 정해준다.
  E_REGDATE DATE  -- 평가 시작한 시간
);

-------------------  PROCEDURE 생성 -----------------------
create or replace procedure proc_reset_eval
is
begin
  update springuser.EVALUATION SET E_EVAL=-1 WHERE E_EVAL > -1 AND SYSDATE - E_REGDATE > 5/24/60 ;
end;

DECLARE
  X NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    ( job       => X 
     ,what      => 'springuser.proc_reset_eval'
     ,next_date => SYSDATE
     ,interval  => '5/24/60' -- 5분마다 돌기 (5일 나누기 24시간 나누기 60분 = 5분)
     ,no_parse  => TRUE
    );
END;
commit;

======================================
