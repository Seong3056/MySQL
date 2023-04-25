

--WHILE 문
SET SERVEROUTPUT ON;
DECLARE
	v_num NUMBER := 3;
	v_count NUMBER := 1;
BEGIN
	WHILE v_count <= 10
	LOOP
		dbms_output.put_line(v_num);
		v_count := v_count+1;
	END LOOP;
END;

-- 탈출문
DECLARE
	v_num NUMBER := 3;
	v_count NUMBER := 1;
BEGIN
	WHILE v_count <= 10
	LOOP
		dbms_output.put_line(v_num);
		EXIT WHEN v_count = 5;
		v_count := v_count+1;
	END LOOP;
END;

-- FOR문
DECLARE 
	v_num NUMBER := 3;
BEGIN
	FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현
	LOOP
		dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
	END LOOP;
END;

-- CONTINUE 문
DECLARE 
	v_num NUMBER := 3;
BEGIN
	FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현
	LOOP
		CONTINUE WHEN i = 5;
		dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
	END LOOP;
END;

-- 1. 모든 구구든을 출력하는 익명 블록을 만드세요. (2 ~ 9단)
DECLARE

BEGIN
	FOR j IN 1..9
	LOOP
		FOR i IN 2..9
		LOOP
			dbms_output.put(i || 'x' || j || '=' || i*j || ' ');
		END LOOP;
			dbms_output.new_line;
	END LOOP;
END;

-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno,writer,title 컬럼이 존재함)
-- bno는 SEQUENCE로 오렬주고, wrtier와 title에 버놓를 붙여서 INSERT 진행해주세요
-- ex 1,test1,title1 -> 2,test2,title2 ....
CREATE TABLE board ( bno NUMBER(3), writer VARCHAR2(10), title VARCHAR2(10));

CREATE SEQUENCE b_seq
    START WITH 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    INCREMENT BY 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 300 -- 최대값(기본값은 증가 1027, 감소일 때 -1)
    MINVALUE 1 -- 최소값(기본값 증가일 때 1, 감소일 때 -1028)
    NOCACHE -- 캐시메모리 사용 여부 (CACHE) 
    NOCYCLE;
DROP SEQUENCE b_seq;
BEGIN
	FOR i IN 1..300
	LOOP
		INSERT INTO board VALUES
		(b_seq.NEXTVAL, CONCAT('test',b_seq.NEXTVAL), CONCAT('title',b_seq.NEXTVAL) );
	END LOOP;
END;


SELECT * FROM board;









