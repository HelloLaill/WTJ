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
#商品表
CREATE TABLE wtj_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pname VARCHAR(64) NOT NULL,
  ptitle VARCHAR(128),
  spec VARCHAR(64),
  color VARCHAR(16),
  style_id VARCHAR(16),
  type_style VARCHAR(16),
  price DECIMAL(10,2)
);
#插入数据
INSERT INTO wtj_product VALUES(NULL,'帕拉多米北欧风格羊绒黄色木脚喷漆休闲椅','拥有的是一种宁静的气息，素雅向暖，安之若素，每个人都可以拥有','900*750*1080','黄色','客厅','北欧',1600);
INSERT INTO wtj_product VALUES(NULL,'LOTOTO日式风格搪瓷红色茶壶','这种自然古朴的肌理感给人以温馨舒适、易于亲近之感','全宽215，上口劲宽90，高190，底径100','红色','客厅','日式',59);
#商品详情图表
CREATE TABLE product_img(
  img_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id VARCHAR(64),
  sm VARCHAR(128),
  lg VARCHAR(128)
);
INSERT INTO product_img VALUES(NULL,'CF001','http://img2.wutuojia.com/pic/sq_small/product/t98/b415/20160822/111733_591692.png','http://img2.wutuojia.com/pic/qty_large/product/t98/b415/20160822/111733_591692.png');
INSERT INTO product_img VALUES(NULL,'F826LO06','http://img2.wutuojia.com/pic/sq_small/product/t132/b406/20160817/150340_106104.png','http://img2.wutuojia.com/pic/sq_large/product/t132/b406/20160817/150340_106104.png');
#首页轮播图表
CREATE TABLE index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(128),
  href VARCHAR(128)
);
#首页展示产品表
CREATE TABLE index_product(
  index_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  style_id INT
);
INSERT INTO index_product VALUES(NULL,'斯品北欧宜家绦棉面料深蓝色布艺沙发','圆润外观,胖胖的身材,给你更多安全感,让身体沉浸在沙发的舒适怀抱中','http://img2.wutuojia.com/pic/qty_large/product/t81/b389/20160721/094339_385822.png',4464,'http://www.wutuojia.com/item/8779.html','客厅');
INSERT INTO index_product VALUES(NULL,'
帕拉多米简约现代麻布面料混色休闲椅','简约大气的设计，落落大方的款式','http://img2.wutuojia.com/pic/qty_large/product/t98/b415/20160819/171826_983572.png',1880,'http://www.wutuojia.com/item/9317.html','卧室');
