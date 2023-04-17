SELECT e.employee_id, e.first_name,
e.department_id, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; --106

SELECT e.employee_id, e.first_name,
e.department_id, d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; --107

SELECT e.employee_id, e.first_name,
e.department_id, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; --122

SELECT e.employee_id, e.first_name,
e.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id; --123

SELECT e.employee_id, e.first_name || ' ' ||e.last_name AS full_name,
e.department_id, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id =200; --1

SELECT e.employee_id, e.first_name,
e.job_id, j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name ASC; --107

SELECT *
FROM jobs j
LEFT OUTER JOIN job_history h
ON j.job_id = h.job_id; --21

SELECT e.first_name || ' ' || e.last_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven'
AND e.last_name = 'King'; --1

SELECT *
FROM employees 
CROSS JOIN departments; --2889

--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
SELECT e.job_id, e.employee_id, e.first_name, e.salary,
d.department_name
,l.city
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.job_id = 'SA_MAN';
--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.
SELECT e.first_name, e.salary, e.job_id
FROM employees e
LEFT JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title IN ('Stock Manager','Stock Clerk');
--WHERE j.job_title = 'Stock Manager'
--OR j.job_title = 'Stock Clerk';

--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.first_name IS NULL;

SELECT *
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;


--���� 10. 
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
SELECT e1.first_name || ' ' || e1.last_name, e2.first_name || ' ' || e2.last_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;
--���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
SELECT e1.first_name || ' ' || e1.last_name, e1.manager_id, e2.first_name || ' ' || e2.last_name, e2.salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e2.salary DESC;

���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���


