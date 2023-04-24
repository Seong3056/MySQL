
/*
#PL/SQL
- ����Ŭ���� �����ϴ� SQL���α׷��� ����̴�.
- �Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��������� ó���� ����
  ������ �� �� �ִ� ���������� �ڵ� �ۼ� ����̴�.
- �������� �������� ��� ���� �ϰ� ó���ϱ� ���� �뵵�� ����Ѵ�.
*/
SET SERVEROUTPUT ON; --��¹� Ȱ��ȭ

DECLARE -- ������ �����ϴ±��� (�����)
	emp_num NUMBER; -- ��������
	
BEGIN -- �ڵ带 �����ϴ� ���۱��� (�����)
	emp_num := 10; -- ���Կ����� :=
	DBMS_OUTPUT.put_line(emp_num);
	DBMS_OUTPUT.put_line('Hello pl/sql');
END; -- PL/SQL�� ������ ���� (�����)

-- ������
-- �Ϲ� SQL���� ��� �������� ����� �����ϰ�,
-- **�� ������ �ǹ��Ѵ�.
DECLARE
	A NUMBER := 2**2*3**2;
BEGIN
	dbms_output.put_line('A:'|| TO_CHAR(A));
END;

/*
- DML��
  DDL�� ����� �Ұ����ϴ� �Ϲ������� SQL���� SELECT ���� ����ϴµ�,
  Ư������ SELECT�� �Ʒ��� INTO���� ����ؼ� ������ �Ҵ��� �� �ִ�.
*/

-- �ش� ���̺�� ���� Ÿ���� �÷� �����������Ϸ���
-- ���̺��.�÷���%TYPE�� ��������ν� Ÿ���� ������ Ȯ���ؾ��ϴ� ���ŷο��������� �� �ִ�.
DECLARE
	v_emp_name employees.first_name%TYPE;-- ����� ���� (���ڿ� �����±��� �����ʿ�)
	v_dep_name departments.department_name%TYPE; -- �μ��� ����
BEGIN
	SELECT 
	 e.first_name,
	 d.department_name
	 INTO 
		v_emp_name, v_dep_name -- ��ȸ����� ������ ����
	FROM employees e
	LEFT JOIN departments d
	ON  e.department_id = d.department_id
	WHERE employee_id = 100;
	
	dbms_output.put_line(v_emp_name || '-'  || v_dep_name);
END;






































