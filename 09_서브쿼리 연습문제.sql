--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
---EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees
WHERE salary > (
SELECT AVG(salary) FROM employees
WHERE job_id = 'IT_PROG');

--���� 2.
---DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.

SELECT *
FROM employees e
WHERE department_id = (SELECT department_id
FROM departments
WHERE manager_id = 100);




--���� 3.
---EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
SELECT *
FROM employees 
WHERE manager_id > (
SELECT manager_id
FROM employees
WHERE first_name = 'Pat'
);
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
SELECT *
FROM employees
WHERE manager_id = ANY (
SELECT manager_id FROM employees WHERE first_name = 'James'
);

--���� 4.

---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
SELECT tbl2.*
FROM
(
	SELECT ROWNUM AS rn , tbl.first_name
	FROM 
	(
		SELECT * FROM employees
		ORDER BY first_name DESC
	) tbl
) tbl2
WHERE rn BETWEEN 41 AND 50;

--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.
SELECT * FROM
	(
	SELECT ROWNUM AS rn, tbl.* FROM
		(
		SELECT employee_id, first_name, phone_number, hire_date 
		FROM employees e
		ORDER BY hire_date
		)tbl
	)tbl2
WHERE rn >30 AND rn<=40;


--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
SELECT employee_id,
first_name || ' ' || last_name AS name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;

--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
SELECT e.* d.department_name FROM
(
SELECT employee_id,
first_name || ' ' || last_name AS name, department_id
FROM employees
ORDER BY department_id ASC)e ,
(SELECT department_id, department_name FROM departments )d
WHERE e.department_id = d.department_id;

SELECT employee_id,
first_name || ' ' || last_name AS name, e.department_id, 
(SELECT d.deparment_name FROM departments d WHERE d.department_id = e.department_id )AS department_name
FROM employees e;




--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT  d.department_id, d.department_name, d.manager_id, d.location_id,
l.street_address, l.postal_code, l.city
FROM departments d
LEFT JOIN locations l
ON d.location_id = l.location_id
ORDER BY d.department_id ASC;

--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT  d.department_id, d.department_name, d.manager_id, d.location_id,
( SELECT l.street_address  FROM locations l WHERE d.location_id = l.location_id) AS street_address,
( SELECT l.postal_code FROM locations l WHERE d.location_id = l.location_id) AS postal_code,
( SELECT l.city  FROM locations l WHERE d.location_id = l.location_id) AS city
FROM departments d
LEFT JOIN locations l
ON d.location_id = l.location_id
ORDER BY d.department_id ASC;
--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����
SELECT l.location_id, l.street_address, l.city,
c.country_id, c.country_name
FROM locations l
LEFT JOIN countries c
ON l.country_id = c.country_id 
ORDER BY c.country_name ASC;
--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT l.location_id, l.street_address, l.city, l.country_id,
	(
		SELECT c.country_name FROM countries c
		WHERE l.country_id = c.country_id
	)AS country_name
FROM locations l
ORDER BY country_name ASC;

--���� 12. 
--employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
SELECT tbl.* FROM
(
SELECT ROWNUM AS rn , e.* FROM
(
SELECT employee_id, first_name, phone_number,  hire_date, department_id
FROM employees 
ORDER BY hire_date ASC
)e
)tbl
WHERE rn BETWEEN 1 AND 10;


SELECT tbl2.* FROM
(
SELECT ROWNUM AS rn , tbl.* FROM
(
SELECT e.employee_id, e.first_name, e.phone_number,  e.hire_date, 
e.department_id,d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY hire_date ASC
)tbl
)tbl2
WHERE rn BETWEEN 1 AND 10;
--���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
SELECT e.* ,
(
SELECT department_name FROM departments d WHERE e.department_id = d.department_id
)AS department_id FROM 
	(
	SELECT  last_name, job_id, department_id
	FROM employees 
	WHERE job_id = 'SA_MAN'
	) e;
	
	(
	SELECT last_name, job_id, department_id FROM employee
	WHERE job_id = 'SA_MAN'
	)tbl
	JOIN departments
	ON;


--���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.


SELECT e.department_id, e.total
FROM departments d
JOIN(
SELECT department_id, count(*) AS total
FROM employees GROUP BY department_id)e
ON d.department_id = e.department_id
ORDER BY e.total DESC;




--���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.

--SELECT * FROM departments d
--JOIN locations l

SELECT 
	d.*,l.street_address, l.postal_code, 
	NVL(tbl.result, 0) AS �μ��� ��ձ޿�
FROM departments d
JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN(
		SELECT department_id, TRUNC(AVG(salary)) AS result
		FROM employees
		GROUP BY department_id;
		 ) tbl
ON d.department_id = tbl.department_id;

--���� 16
---���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���.
SELECT * FROM
	(
		SELECT ROWNUM AS rn tbl2.* FROM
		(
		SELECT 
			d.*,l.street_address, l.postal_code, 
			NVL(tbl.result, 0) AS �μ��� ��ձ޿�
		FROM departments d
		JOIN locations l
		ON d.location_id = l.location_id
		LEFT JOIN(
				SELECT department_id, TRUNC(AVG(salary)) AS result
				FROM employees
				GROUP BY department_id;
				 ) tbl
		ON d.department_id = tbl.department_id
		ORDER BY d.department_id DESC
		)tbl2
	)
WHERE rn >0 AND rn<=10;


