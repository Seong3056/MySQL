
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)
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
 
-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸� ����� ������. (������ ��Ƽ� ����ϼ���.)
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

-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ��� (max �Լ� ���)
-- �� ��ȣ +1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire, job_id�� �ű� �����ϴ� �͸� ����� ���弼��
-- SELECT�� ���Ŀ� INSERT�� ����� �����ϴ�. 
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ����
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























