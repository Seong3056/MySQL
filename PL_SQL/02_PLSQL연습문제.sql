
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 쓰세요)
SET SERVEROUTPUT ON;
DECLARE
 x NUMBER :=3;
 y NUMBER ;
BEGIN

y := x*1; dbms_output.put_line('3 * 1 = ' ||y);
y := x*2; dbms_output.put_line('3 * 2 = ' ||y);
y := x*3; dbms_output.put_line('3 * 3 = ' ||y);
y := x*4; dbms_output.put_line('3 * 4 = ' ||y);
y := x*5; dbms_output.put_line('3 * 5 = ' ||y);
y := x*6; dbms_output.put_line('3 * 6 = ' ||y);
y := x*7; dbms_output.put_line('3 * 7 = ' ||y);
y := x*8; dbms_output.put_line('3 * 8 = ' ||y);
y := x*9; dbms_output.put_line('3 * 9 = ' ||y);

END;
 
-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명 블록을 만들어보자. (변수에 담아서 출력하세요.)
DECLARE
name employees.first_name%TYPE;
email employees.email%TYPE;
BEGIN
	SELECT
		first_name,email
		INTO
		name,email
	FROM employees WHERE employee_id = 201;
dbms_output.put_line('employee_id = ' || 201);
dbms_output.put_line('first_name = ' || name);
dbms_output.put_line('email = ' || email);
END;

-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸뒤 (max 함수 사용)
-- 이 번호 +1번으로 아래의 사원을 emps 테이블에
-- employee_id, last_name, email, hire, job_id를 신규 삽입하는 익명 블록을 만드세요
-- SELECT절 이후에 INSERT문 사용이 가능하다. 
/*
<사원명>: steven
<이메일>: stevenjobs
<입사일자>: 오늘
<job_id> : CEO
*/
DECLARE
	m NUMBER;
BEGIN
	SELECT MAX(employee_id) INTO m FROM employees ;
	m := m+1;
	INSERT INTO emps (employee_id,first_name,last_name,email,hire_date,job_id) VALUES
				 (m,'steven','job','stevenjobs',sysdate,'CEO');
END;

DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

SELECT * FROM emps;























