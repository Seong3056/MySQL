SELECT * FROM emps;

-- ����Ŀ�� ���� Ȯ��
SHOW AUTOCOMMIT;
-- ����Ŀ�� ��
SET AUTOCOMMIT ON;
-- ����Ŀ�� ����
SET AUTOCOMMIT OFF;

DELETE FROM emps WHERE employee_id = 304;



INSERT INTO emps
	(employee_id, last_name, email, hire_date, job_id)
	VALUES
	(303,'kim','kim1234@naver.com',sysdate, 1800);
INSERT INTO emps
	(employee_id, last_name, email, hire_date, job_id)
	VALUES
	(304,'lee','lee1234@naver.com',sysdate, 1800);

-- �������� ��� ������ ��������� ���(���),
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����
ROLLBACK;

-- ���̺�����Ʈ ����
-- �ѹ��� ����Ʈ�� ���� �̸����ٿ��� ����
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����

SAVEPOINT insert_park;
INSERT INTO emps
	(employee_id, last_name, email, hire_date, job_id)
	VALUES
	(305,'park','park1234@naver.com',sysdate, 1800);
ROLLBACK TO SAVEPOINT insert_park;
-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ���������
-- Ŀ���� ���� ��� ����� ����ϴ��� �ǵ����� �����ϴ�.
COMMIT;