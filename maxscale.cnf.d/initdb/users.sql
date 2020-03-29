
CREATE USER 'maxuser'@'127.0.0.1' IDENTIFIED BY 'maxpwd';
CREATE USER 'maxuser'@'%' IDENTIFIED BY 'maxpwd';
GRANT ALL ON *.* TO 'maxuser'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'maxuser'@'%' WITH GRANT OPTION;

CREATE DATABASE test;

CREATE TABLE test.masking1 (card_number1 char(20));

INSERT INTO test.masking1 values ('1234-5678-9012-3456');
INSERT INTO test.masking1 values ('1234-5678-9013-3456');
INSERT INTO test.masking1 values ('1234-5678-9014-3456');
