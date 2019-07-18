SET NAMES UTF8;
DROP DATABASE IF EXISTS books;
CREATE DATABASE books CHARSET=UTF8;
USE books;

/*创建用户表user*/
CREATE TABLE user(
  uid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(8),
  upwd  VARCHAR(8)
);
INSERT INTO user VALUES(null,'tom','123');
INSERT INTO user VALUES(null,'jerry','123');
INSERT INTO user VALUES(null,'lili','123');
INSERT INTO user VALUES(null,'lucy','123');


/*创建票务表tickets*/
CREATE TABLE tickets(
  tid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(8),
  tprice  DECIMAL(5,2)
);
INSERT INTO tickets VALUES(null,'成人票','45');
INSERT INTO tickets VALUES(null,'学生','22');
INSERT INTO tickets VALUES(null,'老年','37');
INSERT INTO tickets VALUES(null,'一大一小亲子票','67');



/*创建订单信息表book_info*/
CREATE TABLE book_info(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  book VARCHAR(8),
  bstatus TINYINT(1),
  bdate VARCHAR(16),
  b_id VARCHAR(16)
);
INSERT INTO book_info VALUES(null,'成人票',0,'2019/07/14','1');
INSERT INTO book_info VALUES(null,'老人票',1,'2019/07/17','2');
INSERT INTO book_info VALUES(null,'学生票',2,'2019/07/17','2');
INSERT INTO book_info VALUES(null,'一大一小亲子票',1,'2019/07/16','3');



/*
#为商品表添加一列
 ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#每一个商品图片 
 UPDATE xz_laptop SET img_url = '01.jpg';
*/
