-- insert
-- 테이블 구조 확인
DESC departments;

-- INSERT 의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments
VALUES(290, '영업부', 100, 2300);

SELECT * FROM departments;
ROLLBACK; -- 실행 시점을 다시 뒤로 되돌리는 키워드 

-- INSERT의 두번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 확인!)
INSERT INTO departments
(department_id,department_name, location_id)
VALUES
(280,'개발자',1700);

-- 사본 테이블 생성
-- 사본테이블을 생성할때 그냥생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값 (1 = 2)
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
CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않습니다.
제약조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이
DB에 저장되는 것을 방지하는 목적으로 사용합니다.
*/


