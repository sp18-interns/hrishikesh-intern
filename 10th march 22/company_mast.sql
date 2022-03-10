
create database company;
use company;
create table company_mast (
COMP_ID INT NOT NULL auto_increment,
COMP_NAME VARCHAR(225) NOT NULL,
primary key(COMP_ID)
);
insert into company_mast (COMP_ID, COMP_NAME) 
VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

select * from company_mast;
