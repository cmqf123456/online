SET NAMES UTF8;
DROP DATABASE IF EXISTS books;
CREATE DATABASE books CHARSET=UTF8;
USE books;

/*创建用户表user*/
CREATE TABLE user(
  uid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(8),
  upwd  VARCHAR(8),
  uphone VARCHAR(15)
);
INSERT INTO user VALUES(null,'tommam','123456',"15045941171");
INSERT INTO user VALUES(null,'jerry','123456',"15776628416");
INSERT INTO user VALUES(null,'lilili','123456',"13379528461");
INSERT INTO user VALUES(null,'lucync','123456',"13786785426");


/*创建票务表tickets*/
CREATE TABLE tickets(
  tid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(8),
  tprice  DECIMAL(5,2)
);
INSERT INTO tickets VALUES(null,'成人票','45');
INSERT INTO tickets VALUES(null,'学生票','22');
INSERT INTO tickets VALUES(null,'老年票','37');
INSERT INTO tickets VALUES(null,'一大一小亲子票','67');



/*创建订单信息表book_info*/
CREATE TABLE book_info(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  book VARCHAR(8),
  bcard VARCHAR(18),
  bprice DECIMAL(5,2),
  bstatus TINYINT(1),
  bdate VARCHAR(16),
  addtime DATETIME DEFAULT now(),
  b_id VARCHAR(16)
);
INSERT INTO book_info VALUES(null,'成人票','320481196504260428','45',0,'2019/07/14','2019-07-24 20:00','1');
INSERT INTO book_info VALUES(null,'老人票','320481196504260278','37',1,'2019/07/17','2019-07-24 20:00','2');
INSERT INTO book_info VALUES(null,'学生票','320481196504262148','22',1,'2019/07/17','2019-07-24 20:00','2');
INSERT INTO book_info VALUES(null,'一大一小亲子票','320481196504260333','67',1,'2019/07/16','2019-07-24 20:00','3');


/***********清除未付款的超过15分钟的订单***********/
# 把SQL语句的结束符，从默认的“;”改为“$”
delimiter $

# 创建存储过程 clear_order()
# 删除900秒之前添加的订单状态为0的记录
create procedure clear_order()
begin
  delete from book_info where now()-addtime>900 AND bstatus=0;
end$

# 把SQL语句的结束符，改回默认的“;”
delimiter ;

# 查询数据库books里的存储过程
select * from mysql.proc where db="books";

# 列数较多，显示很乱
# 可以把“;”改为“\G”
# 以列表形式显示结果
select * from mysql.proc where db="books"\G

# 查看“事件调度器”的状态
show variables like "%event_scheduler%";

# 开始“事件调度器”
set global event_scheduler=on;

# 创建定时事件 clear_order_event
# 从2019-7-24 20:17:00起
# 每秒执行一次 clear_order()
create event clear_order_event on schedule 
every 1 second 
starts '2019-7-24 20:17:00'
do call clear_order();

# 查看数据库books里的事件
select * from mysql.event where db="books"\G”

# 使用存储过程
call clear_order();


/*
# 删除事件、删除存储过程
drop event clear_order_event;
drop procedure clear_order;
*/




/*
#添加一列
 ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#修改一列
 UPDATE xz_laptop SET img_url = '01.jpg';
*/
