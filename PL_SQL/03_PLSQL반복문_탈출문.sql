

--WHILE ��
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

-- Ż�⹮
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

-- FOR��
DECLARE 
	v_num NUMBER := 3;
BEGIN
	FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��
	LOOP
		dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
	END LOOP;
END;

-- CONTINUE ��
DECLARE 
	v_num NUMBER := 3;
BEGIN
	FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��
	LOOP
		CONTINUE WHEN i = 5;
		dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
	END LOOP;
END;

-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
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

-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno,writer,title �÷��� ������)
-- bno�� SEQUENCE�� �����ְ�, wrtier�� title�� ������ �ٿ��� INSERT �������ּ���
-- ex 1,test1,title1 -> 2,test2,title2 ....
CREATE TABLE board ( bno NUMBER(3), writer VARCHAR2(10), title VARCHAR2(10));

CREATE SEQUENCE b_seq
    START WITH 1 -- ���۰� (�⺻���� ������ �� �ּҰ�, ������ �� �ִ밪)
    INCREMENT BY 1 -- ������ (����� ����, ������ ����, �⺻�� 1)
    MAXVALUE 300 -- �ִ밪(�⺻���� ���� 1027, ������ �� -1)
    MINVALUE 1 -- �ּҰ�(�⺻�� ������ �� 1, ������ �� -1028)
    NOCACHE -- ĳ�ø޸� ��� ���� (CACHE) 
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









