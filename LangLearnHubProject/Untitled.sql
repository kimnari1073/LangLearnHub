CREATE SCHEMA `llh_rdb` DEFAULT CHARACTER SET utf8mb4 ;
use llh_rdb;

create table users(
	id           varchar(20)    not null,
    password     varchar(20)    not null,
    email        varchar(30),
	name         varchar(15), 
    phone        char(13),
    gender       char(1), # F OR M 
    birth        char(10), # 형식 : YYYY/MM/DD 또는 YYYY-MM-DD
    isManager    boolean, # char(1) 타입 고려 해보기 
    primary key(id)
);

select * from users;