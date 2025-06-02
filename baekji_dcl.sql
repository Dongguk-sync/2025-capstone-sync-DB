-- 0. 기존 계정 및 데이터베이스 삭제 (있다면)

-- 현재 존재하는 유저 확인
SELECT User, Host FROM mysql.user WHERE User = 'baekji';

-- 현재 존재하는 데이터베이스 확인
SHOW DATABASES;

-- 세션 및 연결 종료 후 유저 삭제
DROP USER IF EXISTS 'baekji'@'%';

-- 기존 데이터베이스 삭제
DROP DATABASE IF EXISTS baekjidb;

-- ------------------------------------------------------

-- 1. 새로운 계정 생성
CREATE USER 'baekji'@'%' IDENTIFIED BY 'baekji';  
-- '%'를 사용하면 외부 IP에서도 접속 가능

-- 생성된 계정 확인
SELECT User, Host FROM mysql.user WHERE User = 'baekji';

-- ------------------------------------------------------

-- 2. 새로운 데이터베이스 생성
CREATE DATABASE baekjidb;

-- 데이터베이스 목록 다시 확인
SHOW DATABASES;

-- ------------------------------------------------------

-- 3. 권한 부여
GRANT ALL PRIVILEGES ON baekjidb.* TO 'baekji'@'%';

-- 변경사항 적용
FLUSH PRIVILEGES;

-- 권한 확인
SHOW GRANTS FOR 'baekji'@'%';
