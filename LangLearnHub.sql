CREATE SCHEMA `langlearnhubdb` DEFAULT CHARACTER SET utf8 ;
use langlearnhubdb;

drop table if exists users;
CREATE TABLE `users` (
  `id` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `name` VARCHAR(10) NULL,
  `birth` DATE NULL,
  `email` VARCHAR(50) NULL,
  `gender` TINYINT(1) NULL,
  `role` TINYINT(1) NULL DEFAULT '0',
  `approve`TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`));
  
  drop table if exists voca;
  CREATE TABLE `voca` (
  `list_name` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `voca_index` int NOT NULL,
  `voca_key` VARCHAR(45) NULL,
  `voca_val` VARCHAR(45) NULL,
  PRIMARY KEY (`list_name`, `user_id`, `voca_index`),
  FOREIGN KEY(`user_id`) REFERENCES `users` (`id`));

drop table if exists bookmark;
CREATE TABLE `bookmark` (
  `user_id` VARCHAR(45) NOT NULL,
  `bookmark_index` INT,
  `title` VARCHAR(45) NULL,
  `q` VARCHAR(500) not null,
  `a` VARCHAR(500) not null,
  PRIMARY KEY (`user_id`,`q`,`a`),
  FOREIGN KEY(`user_id`) REFERENCES `users` (`id`));

create TABLE chatexam (
    num INT NOT NULL AUTO_INCREMENT,
    id VARCHAR(20) NOT NULL,
    title TEXT,
    ques TEXT,
    examparse varchar(5),
    examtype varchar(5),
    color varchar(9),
    PRIMARY KEY (num, id),
    FOREIGN KEY(`user_id`) REFERENCES `users` (`id`)
);

select * from users;
select * from voca;
select * from bookmark;
select bookmark_index,title,q,a from bookmark where user_id="1" order by bookmark_index;
select * from chatexam;