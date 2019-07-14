SET NAMES UTF8;
DROP DATABASE IF EXISTS books;
CREATE DATABASE books CHARSET=UTF8;
USE books;

/*创建票务表book_name*/
CREATE TABLE book_name(
  bid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  bname VARCHAR(8),
  bprice  DECIMAL(5,2)
);
INSERT INTO book_name VALUES(null,'成人票','45');
INSERT INTO book_name VALUES(null,'学生','22');
INSERT INTO book_name VALUES(null,'老年','37');
INSERT INTO book_name VALUES(null,'一大一小亲子票','67');




/*创建订单信息表book_info*/
CREATE TABLE book_info(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  ubook VARCHAR(8),
  udate VARCHAR(16),
  phone VARCHAR(16)
);
INSERT INTO book_info VALUES(null,'成人票','2019/07/14','18906142788');
INSERT INTO book_info VALUES(null,'老人票','2019/07/15','18906142799');
INSERT INTO book_info VALUES(null,'学生票','2019/07/15','18906142799');
INSERT INTO book_info VALUES(null,'一大一小亲子票','2019/07/16','18906142777');

/*
#为商品表添加一列
 ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#每一个商品图片 
 UPDATE xz_laptop SET img_url = '01.jpg';
*/
