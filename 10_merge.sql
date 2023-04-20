
-- MERGE: ���̺� ����

/*
UPDATE�� INSERT�� �ѹ濡 ó��

�� ���̺� �ش��ϴ� �����Ͱ� �ִٸ� UPDATE��, ������ INSERT�� ó��
*/
CREATE TABLE emps_it AS (SELECT * FROM employees WHERE 1=2);
SELECT * FROM emps_it;

INSERT INTO emps_it (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES 
(105,'���̺��', '��','DAVIDKIM','23/04/19','IT_PROG');

SELECT * FROM employees
WHERE job_id = 'IT_PROG';

MERGE INTO emps_it a -- �����ϰ��� �ϴ� ���̺�
	USING  -- ���ս�ų������
		(SELECT * FROM employees --�����ϰ��� �ϴµ�����
		WHERE job_id= 'IT_PROG') b
		ON(a.employee_id = b.employee_id) -- ���ս�ų �����Ϳ��� ����
WHEN MATCHED THEN --���ǿ� ��ġ�ϴ°�� Ÿ�� ���̺� �̷��� �����϶�
	UPDATE SET 
	a.phone_number = b.phone_number,
	a.hire_date = b.hire_date,
	a.salary = b.salary,
	a.commission_pct = b.commission_pct,
	a.manager_id = b.manager_id,
	a.department_id = b.department_id
	
	/*
	DELETE�� �ܵ����� �� ���� ����.
	UPDATE���� DELETE �ۼ��� �����ϴ�.
	UPDATE �� ����� DELETE �ϵ��� ����Ͼ� �ֱ� ������
	������ ��� �÷����� ������ ������ �ϴ� UPDATE�� �����ϰ�
	DELETE�� WHERE���� �Ʊ� ������ ������ ���� �����ؼ� �����Ѵ�.
	*/
	DELETE WHERE a.employee_id = b.employee_id
WHEN NOT MATCHED THEN
	INSERT  VALUES
	(b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
	
SELECT * FROM emps_it ;
---------------------------------------------------------------------	

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '����', '��', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '�ϳ�', '��', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '���', '��', 'HMSON', '20/04/06', 'AD_VP');
		
		
/*
employees ���̺� �Ź� ����ϰ� �����Ǵ� ���̺��̶�� ��������
�����ǵ����ʹ� email, phone, salary, comm_pct, man_id, dept_id�� 
������Ʈ �ϵ��� ó��
�������Ե� �����ʹ� �״�� �߰�
*/		
MERGE INTO emps_it a
	USING 
		(SELECT * FROM employees)b
	ON 
	(a.employee_id = b.employee_id) --TRUE=> UPDATE / FALSE => INSERT
WHEN MATCHED THEN
	UPDATE SET 
		a.email = b.email,
		a.phone_number = b.phone_number,
		a.salary = b.salary,
		a.commission_pct = b.commission_pct,
		a.manager_id = b.manager_id,
		a.department_id = b.department_id
WHEN NOT MATCHED THEN
	INSERT VALUES
	(b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
	
	SELECT * FROM emps_it
	ORDER BY employee_id ASC;	
	
ROLLBACK;
--------------------------------------------------------------------------------
SELECT * FROM depts;
INSERT  INTO depts(department_id, department_name,manager_id,location_id)
VALUES (280,'����', '',1800);
INSERT  INTO depts(department_id, department_name,manager_id,location_id)
VALUES (290,'ȸ��','',1800);
INSERT  INTO depts(department_id, department_name,manager_id,location_id)
VALUES (300,'����', 301,1800);
INSERT  INTO depts(department_id, department_name,manager_id,location_id)
VALUES (310,'�λ�', 302,1800);
INSERT  INTO depts(department_id, department_name,manager_id,location_id)
VALUES (320,'����', 303,1700);

UPDATE depts SET department_name = 'IT_BANK'
WHERE department_name = 'IT Support';

UPDATE depts SET manager_id = 301
WHERE department_id = 290;

UPDATE depts SET 
	department_name = 'IT_Help',
	manager_id = 303,
	location_id = 1800
WHERE department_name = 'IT Helpdesk';

SELECT * FROM depts;

UPDATE depts SET manager_id = 301
WHERE department_name = ANY (
	SELECT department_name FROM depts 
	WHERE department_name = '�λ�'
	OR department_name = '����'
	OR department_name = 'ȸ���');
	
DELETE FROM depts WHERE department_id = (
SELECT department_id FROM depts WHERE department_name = '����');

DELETE FROM depts WHERE department_id = (
SELECT department_id FROM depts WHERE department_name = 'NOC');

SELECT * FROM depts;
-----------------------------------------------------------------------------
-- 4-1
DELETE FROM depts WHERE department_id > 200;
-- 4-2
UPDATE depts SET manager_id = 100
WHERE manager_id IS NOT NULL;

-- 4-4
MERGE INTO depts a
	USING (SELECT * FROM departments) d
	ON (a.department_id = d.department_id)
WHEN MATCHED THEN
	UPDATE SET
	a.department_name = d.department_name,
	a.manager_id = d.manager_id,
	a.location_id = d.location_id
WHEN NOT MATCHED THEN
	INSERT VALUES 
	(d.department_id, d.department_name, d.manager_id,d.location_id);

CREATE TABLE jobs_it AS(SELECT * FROM jobs WHERE min_salary >6000);
INSERT INTO jobs_it
VALUES ('IT_DEV','����Ƽ������',6000,20000);
INSERT INTO jobs_it
VALUES ('NET_DEV','��Ʈ��ũ������',5000,20000);
INSERT INTO jobs_it
VALUES ('SEC_DEV','���Ȱ�����',6000,19000);

MERGE INTO jobs_it a
	USING (SELECT * FROM jobs WHERE min_salary > 0) b
	ON (a.job_id = b.job_id)
WHEN MATCHED THEN
	UPDATE SET 
	a.job_title = b.job_title,
	a.min_salary = b.min_salary,
	a.max_salary = b.max_salary	
WHEN NOT MATCHED THEN
	INSERT VALUES
	(b.job_id, b.job_title, b.min_salary, b.max_salary);



SELECT * FROM jobs_it;
SELECT * FROM jobs;
SELECT * FROM depts;

