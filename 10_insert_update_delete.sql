-- insert
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT �� ù��° ��� (��� �÷� �����͸� �� ���� ����)
INSERT INTO departments
VALUES(290, '������', 100, 2300);

SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű���� 

-- INSERT�� �ι�° ��� (���� �÷��� �����ϰ� ����, NOT NULL Ȯ��!)
INSERT INTO departments
(department_id,department_name, location_id)
VALUES
(280,'������',1700);

-- �纻 ���̺� ����
-- �纻���̺��� �����Ҷ� �׳ɻ����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1 = 2)
CREATE TABLE managers AS 
(SELECT employee_id, first_name, job_id, hire_date 
FROM employees WHERE 1=2);

SELECT * FROM managers;
DROP TABLE managers;

INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

-- UPDATE 
CREATE TABLE emps AS(SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS�� ����ϸ� ���� ������ NOT NULL ����� ������� �ʽ��ϴ�.
���������� ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
DB�� ����Ǵ� ���� �����ϴ� �������� ����մϴ�.
*/


