#设置客户端连接的编码
SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS wtj;
#创建数据库
CREATE DATABASE wtj CHARSET=UTF8;
#进入该数据库
USE wtj;
#创建用户信息表wtj_user
DROP TABLE IF EXISTS wtj_user;
CREATE TABLE wtj_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32) NOT NULL UNIQUE,
  upwd VARCHAR(32) NOT NULL ,
  email VARCHAR(64) ,
  phone VARCHAR(16) NOT NULL UNIQUE,
  addr VARCHAR(128) ,
  avatar VARCHAR(128),
  gender INT 
);
#插入数据
INSERT INTO wtj_user VALUES(NULL,"test1","123456","123@qq.com","13912345678","重庆市江北区","01.png",1);
INSERT INTO wtj_user VALUES(NULL,"test2","123456","123@qq.com","13912345679","重庆市渝中区","02.png",0);

#创建用户购物车表wtj_cart
DROP TABLE IF EXISTS wtj_cart;
CREATE TABLE wtj_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT ,
  product_id INT,
  count INT 
);
#插入数据
INSERT INTO wtj_cart VALUES(NULL,1,1,2);
INSERT INTO wtj_cart VALUES(NULL,2,1,5);

#创建用户订单表wtj_order
DROP TABLE IF EXISTS wtj_order;
CREATE TABLE wtj_order(
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  o_status INT,
  order_time BIGINT,
  pay_time BIGINT,
  deliver_time BIGINT,
  received_time BIGINT,
  product_id INT,
  count INT
);

#插入数据
INSERT INTO wtj_order VALUES(NULL,1,2,20190505,20190505,NULL,NULL,1,2);
INSERT INTO wtj_order VALUES(NULL,2,1,20190505,20190505,NULL,NULL,1,6);
#创建商品种类表wtj_product_style
DROP TABLE IF EXISTS wtj_product_style;
CREATE TABLE wtj_product_style(
  style_id INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(32)
);
#插入数据
INSERT INTO wtj_product_style VALUES(NULL,"沙发");
INSERT INTO wtj_product_style VALUES(NULL,"餐桌");
