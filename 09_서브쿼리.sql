/*
# ��������
- ���������� ������� ( )�ȿ� �����
  ������������ �������� 1�����Ͽ��� �Ѵ�.
- �������������� ���� ����� �ݵ�� �ϳ� ���� �Ѵ�.
- �ؼ��� ���� �������������� ���� �ؼ��ϸ� �ȴ�.
*/
-- 'Nancy'�� �޿����� �޿��� ���� ����� �˻��ϴ� ����
SELECT salary 
FROM employees
WHERE first_name = 'Nancy';

SELECT * FROM employees
WHERE salary > (SELECT salary 
                FROM employees
                WHERE first_name = 'Nancy');


