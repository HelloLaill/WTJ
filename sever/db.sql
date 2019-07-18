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
INSERT INTO wtj_order VALUES(NULL,1,1,20190505,20190505,NULL,NULL,4,1);
INSERT INTO wtj_order VALUES(NULL,1,1,20190505,20190505,NULL,NULL,5,1);
INSERT INTO wtj_order VALUES(NULL,1,1,20190505,20190505,NULL,NULL,6,2);
INSERT INTO wtj_order VALUES(NULL,2,1,20190505,20190505,NULL,NULL,1,6);

#创建商品种类表wtj_product_style
DROP TABLE IF EXISTS wtj_product_style;
CREATE TABLE wtj_product_style(
  style_id INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(32)
);
#插入数据
INSERT INTO wtj_product_style VALUES(NULL,"客厅");
INSERT INTO wtj_product_style VALUES(NULL,"卧室");
INSERT INTO wtj_product_style VALUES(NULL,"餐厅");
INSERT INTO wtj_product_style VALUES(NULL,"书房");
INSERT INTO wtj_product_style VALUES(NULL,"门厅");

CREATE TABLE wtj_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pname VARCHAR(64) NOT NULL,
  ptitle VARCHAR(128),
  spec VARCHAR(64),
  color VARCHAR(16),
  style_id INT,
  type_style VARCHAR(16),
  price DECIMAL(10,2)
);
#插入数据
#客厅
INSERT INTO wtj_product VALUES(NULL,'帕拉多米北欧风格羊绒黄色木脚喷漆休闲椅','拥有的是一种宁静的气息，素雅向暖，安之若素，每个人都可以拥有','900*750*1080','黄色',1,'北欧',1600);
INSERT INTO wtj_product VALUES(NULL,'斯品北欧宜家绦棉面料深蓝色布艺沙发','圆润外观,胖胖的身材,给你更多安全感,让身体沉浸在沙发的舒适怀抱中','800L*800W*880Hmm ','深蓝色',1,'北欧',4464);
INSERT INTO wtj_product VALUES(NULL,'赛莉莎北欧风格欧皮米白色皮艺沙发','新都市情调的风味，是一种晴和的心境，素雅向暖，安之若素，在这宁静的空间里也可以拥有。','2170*1050*810','米白色',1,'北欧',2998);
INSERT INTO wtj_product VALUES(NULL,'骏业8090系列现代中式橡木红樱桃色电视柜','整体优雅大气，融合传统工艺与现代设计手法于一体，每一处细节都凝聚了工艺师傅们的独特的智慧，不为家具而生，只为艺术献身。','2200*400*287','红樱桃色',1,'现代中式',3515);
INSERT INTO wtj_product VALUES(NULL,'纳美北欧宜家板木核桃色电视柜','自然，舒适，静雅，做生活的主人，欣赏生活的慢节奏。','2070*480*453','咖啡色 ',1,'北欧',2280);
INSERT INTO wtj_product VALUES(NULL,'匹美北欧宜家进口油蜡皮黑色沙发','优雅简练的线条带出了超凡脱俗的人文气质。','2600*1190*860','黑色 ',1,'北欧',7734);
INSERT INTO wtj_product VALUES(NULL,'匹美北欧宜家白蜡木咖啡色茶几','呈现实木原始质感，宛若天成，透出岁月的年轮，感受时光的沉淀。','1200*600*500','咖啡色 ',1,'北欧',2746);
INSERT INTO wtj_product VALUES(NULL,'原治家具北欧宜家麻纺布白色三人位布艺沙发','简约大气的设计，落落大方的款式。','2100*910*780','白色 ',1,'北欧',2106);
INSERT INTO wtj_product VALUES(NULL,'莫斯奇诺简约现代米白色板木结合双门电视柜','现代风格的基调，同时充满紧贴生活的温馨，极尽诱惑又柔和温软，舒适惬意，收放自如。','2000*450*450','白色 ',1,'简约现代',910);
INSERT INTO wtj_product VALUES(NULL,'骏业8090系列简约现代橡木红樱桃色饰物架','整体优雅大气，融合传统工艺与现代设计手法于一体，每一处细节都凝聚了工艺师傅们的独特的智慧，不为家具而生，只为艺术献身。','574*380*847','红樱桃色',1,'简约现代',1445);
INSERT INTO wtj_product VALUES(NULL,'匹美北欧宜家进口油蜡皮卡其色沙发','慵懒从容的生活基调体现了阔达看世的气度。','850*800*700','卡其色 ',1,'北欧',2670);
INSERT INTO wtj_product VALUES(NULL,'匹美北欧宜家进口油蜡皮灰色沙发','简约大气的设计，落落大方的款式。','902*756*770','灰色',1,'北欧',3537);
#卧室
INSERT INTO wtj_product VALUES(NULL,'柏健简约现代绵棉邹布咖啡色布艺床','床主料为可拆洗咖啡色锦棉布，面料环保透气，色泽亮丽，耐水洗，挺括，靠背柔软富有弹性。简约的人体背部弧线，紧贴背部。头部圆筒状靠枕，舒适柔软。让头部有很好的承托作用。床身简约时尚的流线，展现环保的人文理念。床脚选用高级五金材质。','2190*2100*950 ','咖啡色',2,'简约现代',2150);
INSERT INTO wtj_product VALUES(NULL,'缔造空间简约现代板木结合配棉麻布艺床','采用高密度海绵，经久耐用，不易变形，框架用实木打照，承重力强，使用寿命长，布料选用优质植绒面料，全拆洗更经久耐用','2270*2290*1020','咖啡色',2,'简约现代',8760);
INSERT INTO wtj_product VALUES(NULL,'白兰华欧式橡木真皮绿色皮艺床','这是一种风格，这是一种延伸，也是一种别致的情调，可以无所能，可以更贴近生活。','2150*2000*1550 ','绿色',2,'欧式',5850);
INSERT INTO wtj_product VALUES(NULL,'爱奥尼田园进口樟子松深蓝色配白色衣柜','提供系列选择，带给小孩不一样的视觉体验。储存最美好的童年，选用国家EO级别板材，潘通环保色彩系统；天然防虫技术，够大的空间存储成长所需，俄罗斯樟子松层板，为衣服更好保护液压门铰，不伤手。','1200*580*1970','蓝色',2,'田园',1880);
INSERT INTO wtj_product VALUES(NULL,'骏业8090系列现代中式橡木红樱桃色四门衣柜','整体优雅大气，融合传统工艺与现代设计手法于一体，每一处细节都凝聚了工艺师傅们的独特的智慧，不为家具而生，只为艺术献身','1580*600*2200','红樱桃色',2,'现代中式',11170);
INSERT INTO wtj_product VALUES(NULL,'域龙唯美简约现代格子棉麻布布艺床尾凳','这款产品的实用性强，而且带储物功能，可放在床尾与床搭配使用，或放在客厅与方几茶几搭配使用；也可放在鞋柜旁作为换鞋的地方。随意配搭这款产品，方可使你的家倍感温馨舒适。','1150×440×580 ','花纹图案',2,'简约现代',350);
INSERT INTO wtj_product VALUES(NULL,'伦勃朗新古典欧风魅影系列布艺搭配皮艺金属调花蓝色床尾凳','木质、雕花、金属，不同色泽跳跃变化，更与空间所搭配，让居者尽享惬意。','1670*530*530','蓝色',2,'新古典',61600);
INSERT INTO wtj_product VALUES(NULL,'奥帝A8系列简约现代松木白色床头柜','任何舒适的姿势都是自由的带您走进生活之化境，淋浴在随心所欲的氛围中，让身心感受没有一丝烦忧的静雅，每一个细节都透晰出无处不在的人性关怀。','550*400*480','白色',2,'简约现代',560);
#餐厅
INSERT INTO wtj_product VALUES(NULL,'天朝现代中式南美花梨木咖啡色餐桌','进口南美花梨木制作，木纹清晰通透，曲线柔和，造型优美精湛技术，制作缜密精致，增加使用寿命，尽显精致产品质量坚固的实木脚柱，扎实稳固、耐用，造型朴素自然，呈现现代简约风','1600*800*750','咖啡色',3,'现代中式',3200);
INSERT INTO wtj_product VALUES(NULL,'广源简约现代水曲柳胡桃色大理石面餐桌','简约大气的设计，落落大方的款式','1400*800*760','白色',3,'简约现代',1300);
INSERT INTO wtj_product VALUES(NULL,'信颐简约现代白蜡木大理石白色餐台','流行北欧风，水曲柳材质的桌架，桌架是整装的，只需安装一件定位板即可，安装简单，大理石桌面，素雅清爽，居家百搭实用','1400*850*760','白色',3,'简约现代',1798);
INSERT INTO wtj_product VALUES(NULL,'广源北欧宜家水曲柳胡桃色圆餐桌','完美的外观设计、健康环保的优质材料、安全保障的圆角设计，符合现代人追求美丽与健康的生活理念。','1200*760','胡桃色',3,'北欧',2180);
INSERT INTO wtj_product VALUES(NULL,'匠明尚品系列后现代进口白蜡木酒柜','秉承意大利家具制作的优秀传统，追求独特的现代设计意念和气派非凡的造型艺术，将自然风格与时尚元素共治一炉，凸显产品前卫而不乏舒适，个性而不张扬的独特气质，是追求高品味生活的成功人士之首选。','1000*420*1880','红棕色',3,'后现代',5400);
INSERT INTO wtj_product VALUES(NULL,'金卡简约现代咖啡色配粉色板木结合餐边柜','没有过分的浮夸修饰，用简单色彩和线条勾勒心中舒适之家，享受现代的慢生活。以简约引领潮流品味，让客厅更具品味。','1200*450*800','咖啡色',3,'简约现代',3180);
INSERT INTO wtj_product VALUES(NULL,'九五泊系列北欧宜家E1中纤板白色PU油漆餐边柜','新都市情调的风味，是一种晴和的心境，素雅向暖，安之若素，在这宁静的空间里也可以拥有。','1600*450*850','白色',3,'北欧',3101);
INSERT INTO wtj_product VALUES(NULL,'美加家居简约现代E1级中纤板黑白色餐边柜','每一天都惬意地生活在自己塑造的空间里，欣赏如艺术精品一样的家具，将生活中的感动化为细致的品位慢慢鉴赏','1470*420*870','白色',3,'简约现代 ',1845);

#书房
INSERT INTO wtj_product VALUES(NULL,'优斯特简约现代中纤板米白色书柜','简洁而精致，独特光泽家具倍感时尚，具有舒适与美观并存的享受。以简洁的造型，完美的细节，营造出时尚前卫的感觉','1600*365*2100','米色',4,'简约现代 ',3450);
INSERT INTO wtj_product VALUES(NULL,'尚非珍珠米黄系列简约现代高密度板米黄色书柜','简约大气的设计，落落大方的款式。','1774*430*2336','米黄色',4,'简约现代 ',3450);
INSERT INTO wtj_product VALUES(NULL,'九五泊系列北欧宜家E1中纤板白色PU油漆书柜','新都市情调的风味，是一种晴和的心境，素雅向暖，安之若素，在这宁静的空间里也可以拥有。','1000*350*2080','白色',4,'北欧 ',2702);
INSERT INTO wtj_product VALUES(NULL,'莱恩小城美式风格水曲柳原木色书柜','每一处精细打磨的棱角用多道工序，打造表面通过特殊涂装工艺处理，纹理清晰自然，光泽度极好，感受美式乡村情怀。','1080*420*2150','原木色',4,'美式 ',6996);
INSERT INTO wtj_product VALUES(NULL,'斯品北欧宜家中密度纤维板亚光白色书桌','精雕细琢，以不变的造型塑造多变的生活，过我想要的生活，活出属于我的姿态','1200L*450W*750Hmm','白色',4,'北欧 ',1088);
INSERT INTO wtj_product VALUES(NULL,'九五泊系列北欧宜家E1中纤板贴白腊木皮浅卡其色书桌','新都市情调的风味，是一种晴和的心境，素雅向暖，安之若素，在这宁静的空间里也可以拥有','1400*350*760','卡其色',4,'北欧 ',1900);
INSERT INTO wtj_product VALUES(NULL,'铭升家具北欧宜家棉麻白色书报架','简洁的勾勒出优雅与温馨，精湛的工艺传递出恬淡和舒适。','600*300*480','白色',4,'北欧 ',480);
INSERT INTO wtj_product VALUES(NULL,'seasonbag四季潮吉星高照系列简约现代黑色布艺懒人沙发','回弹性好，耐用不易变形，舒适更柔软。','1200*1600*950','黑色',4,'简约现代',559);

#门厅
INSERT INTO wtj_product VALUES(NULL,'骏业8090系列现代中式橡木红樱桃色玄关','整体优雅大气，融合传统工艺与现代设计手法于一体，每一处细节都凝聚了工艺师傅们的独特的智慧，不为家具而生， 只为艺术献身。','800*350*1000','红樱桃色',5,'现代中式',2845);
INSERT INTO wtj_product VALUES(NULL,'摩登家庭简约现代不锈钢密度板白色玄关桌','以简约引领潮流品味，让客厅更具品味。','1500*450*900','白色',5,'简约现代',2845);
INSERT INTO wtj_product VALUES(NULL,'炜煌盛欧式高密度板珠光白色玄关台','台面采用高密度板，其他部分为不容易变形、不容易爆裂的玻璃钢，可以配大理石面或玻璃面，精美的花纹雕刻，栩栩如生的形态，晶莹润泽的珠光白作底色，华美质感瞬间绽放。','1040*350*800','白色',5,'欧式',830);
INSERT INTO wtj_product VALUES(NULL,'优梵艺术美式米色板木结合玄关柜','这是一种风格，这是一种延伸，也是一种别致的情调，可以无所能，可以更贴近生活。视线和光线的落差是每个休止音符在跳跃，无限升华，无限体验','1060*350*920','米色',5,'美式',1780);
INSERT INTO wtj_product VALUES(NULL,'越美家美式乡村咖啡色桦木鞋柜','时尚活力的造型、亮丽的颜色、超一流的制作工艺、完全是舒适的最佳演绎。全新的设计理念，给年轻人对一份享受生活的空间','1040*340*915','咖啡色',5,'美式',1388);
INSERT INTO wtj_product VALUES(NULL,'赛莉莎北欧宜家风格实木颗粒板原木色鞋柜','新都市情调的风味，是一种晴和的心境，素雅向暖，安之若素，在这宁静的空间里也可以拥有。','1040*340*915','原木色',5,'北欧',1298);
INSERT INTO wtj_product VALUES(NULL,'骏业8090系列简约现代橡木白色花架','整体优雅大气，融合传统工艺与现代设计手法于一体，每一处细节都凝聚了工艺师傅们的独特的智慧，不为家具而生，只为艺术献身','330*330*790','白色',5,'简约现代',745);
INSERT INTO wtj_product VALUES(NULL,'九五泊系列北欧宜家E1中纤板白色PU油漆鞋柜','慵懒从容的生活基调体现了此间主任阔达看世的气度','880*400*1150','白色',5,'北欧',2500);


#商品详情图表
CREATE TABLE wtj_product_img(
  img_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id VARCHAR(64),
  sm VARCHAR(128),
  lg VARCHAR(128),
  d VARCHAR(128)
);
INSERT INTO wtj_product_img VALUES(NULL,1,'image/p1_1_sm.png','image/p1_1.png','image/p1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,1,'image/p1_2_sm.png','image/p1_2.png','image/p1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,2,'image/safa2_sm_1.png','image/safa2_lg_1.png','image/safa2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,2,'image/safa2_sm_2.png','image/safa2_lg_2.png','image/safa2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,3,'image/safa3_sm_1.png','image/safa3_lg_1.png','image/safa3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,3,'image/safa3_sm_2.png','image/safa3_lg_2.png','image/safa3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,4,'image/kt1_sm_1.png','image/kt1_lg_1.png','image/kt1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,4,'image/kt1_sm_2.png','image/kt1_lg_2.png','image/kt1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,5,'image/kt2_sm_1.png','image/kt2_lg_1.png','image/kt2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,5,'image/kt2_sm_2.png','image/kt2_lg_2.png','image/kt2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,6,'image/safa4_sm_1.png','image/safa4_lg_1.png','image/safa4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,6,'image/safa4_sm_2.png','image/safa4_lg_2.png','image/safa4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,7,'image/kt4_sm_1.png','image/kt4_lg_1.png','image/kt4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,7,'image/kt4_sm_2.png','image/kt4_lg_2.png','image/kt4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,8,'image/safa5_sm_1.png','image/safa5_lg_1.png','image/safa5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,8,'image/safa5_sm_2.png','image/safa5_lg_2.png','image/safa5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,9,'image/kt3_sm_1.png','image/kt3_lg_1.png','image/kt3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,9,'image/kt3_sm_2.png','image/kt3_lg_2.png','image/kt3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,10,'image/kt5_sm_1.png','image/kt5_lg_1.png','image/kt5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,10,'image/kt5_sm_2.png','image/kt5_lg_2.png','image/kt5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,11,'image/safa6_sm_1.png','image/safa6_lg_1.png','image/safa6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,11,'image/safa6_sm_2.png','image/safa6_lg_2.png','image/safa6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,12,'image/safa7_sm_1.png','image/safa7_lg_1.png','image/safa7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,12,'image/safa7_sm_2.png','image/safa7_lg_2.png','image/safa7_d.png');
#卧室
INSERT INTO wtj_product_img VALUES(NULL,13,'image/ws1_sm_1.png','image/ws1_lg_1.png','image/ws1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,13,'image/ws1_sm_2.png','image/ws1_lg_2.png','image/ws1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,14,'image/ws2_sm_1.png','image/ws2_lg_1.png','image/ws2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,14,'image/ws2_sm_2.png','image/ws2_lg_2.png','image/ws2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,15,'image/ws3_sm_1.png','image/ws3_lg_1.png','image/ws3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,15,'image/ws3_sm_2.png','image/ws3_lg_2.png','image/ws3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,16,'image/ws4_sm_1.png','image/ws4_lg_1.png','image/ws4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,16,'image/ws4_sm_2.png','image/ws4_lg_2.png','image/ws4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,17,'image/ws5_sm_1.png','image/ws5_lg_1.png','image/ws5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,17,'image/ws5_sm_2.png','image/ws5_lg_2.png','image/ws5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,18,'image/ws6_sm_1.png','image/ws6_lg_1.png','image/ws6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,18,'image/ws6_sm_2.png','image/ws6_lg_2.png','image/ws6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,19,'image/ws7_sm_1.png','image/ws7_lg_1.png','image/ws7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,19,'image/ws7_sm_2.png','image/ws7_lg_2.png','image/ws7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,20,'image/ws8_sm_1.png','image/ws8_lg_1.png','image/ws8_d.png');
INSERT INTO wtj_product_img VALUES(NULL,20,'image/ws8_sm_2.png','image/ws8_lg_2.png','image/ws8_d.png');
#餐厅
INSERT INTO wtj_product_img VALUES(NULL,21,'image/ct1_sm_1.png','image/ct1_lg_1.png','image/ct1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,21,'image/ct1_sm_2.png','image/ct1_lg_2.png','image/ct1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,22,'image/ct2_sm_1.png','image/ct2_lg_1.png','image/ct2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,22,'image/ct2_sm_2.png','image/ct2_lg_2.png','image/ct2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,23,'image/ct3_sm_1.png','image/ct3_lg_1.png','image/ct3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,23,'image/ct3_sm_2.png','image/ct3_lg_2.png','image/ct3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,24,'image/ct4_sm_1.png','image/ct4_lg_1.png','image/ct4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,24,'image/ct4_sm_2.png','image/ct4_lg_2.png','image/ct4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,25,'image/ct5_sm_1.png','image/ct5_lg_1.png','image/ct5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,25,'image/ct5_sm_2.png','image/ct5_lg_2.png','image/ct5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,26,'image/ct6_sm_1.png','image/ct6_lg_1.png','image/ct6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,26,'image/ct6_sm_2.png','image/ct6_lg_2.png','image/ct6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,27,'image/ct7_sm_1.png','image/ct7_lg_1.png','image/ct7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,27,'image/ct7_sm_2.png','image/ct7_lg_2.png','image/ct7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,28,'image/ct8_sm_1.png','image/ct8_lg_1.png','image/ct8_d.png');
INSERT INTO wtj_product_img VALUES(NULL,28,'image/ct8_sm_2.png','image/ct8_lg_2.png','image/ct8_d.png');
#书房
INSERT INTO wtj_product_img VALUES(NULL,29,'image/sf1_sm_1.png','image/sf1_lg_1.png','image/sf1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,29,'image/sf1_sm_2.png','image/sf1_lg_2.png','image/sf1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,30,'image/sf2_sm_1.png','image/sf2_lg_1.png','image/sf2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,30,'image/sf2_sm_2.png','image/sf2_lg_2.png','image/sf2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,31,'image/sf3_sm_1.png','image/sf3_lg_1.png','image/sf3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,31,'image/sf3_sm_2.png','image/sf3_lg_2.png','image/sf3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,32,'image/sf4_sm_1.png','image/sf4_lg_1.png','image/sf4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,32,'image/sf4_sm_2.png','image/sf4_lg_2.png','image/sf4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,33,'image/sf5_sm_1.png','image/sf5_lg_1.png','image/sf5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,33,'image/sf5_sm_2.png','image/sf5_lg_2.png','image/sf5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,34,'image/sf6_sm_1.png','image/sf6_lg_1.png','image/sf6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,34,'image/sf6_sm_2.png','image/sf6_lg_2.png','image/sf6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,35,'image/sf7_sm_1.png','image/sf7_lg_1.png','image/sf7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,35,'image/sf7_sm_2.png','image/sf7_lg_2.png','image/sf7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,36,'image/sf8_sm_1.png','image/sf8_lg_1.png','image/sf8_d.png');
INSERT INTO wtj_product_img VALUES(NULL,36,'image/sf8_sm_2.png','image/sf8_lg_2.png','image/sf8_d.png');
#门厅
INSERT INTO wtj_product_img VALUES(NULL,37,'image/mt1_sm_1.png','image/mt1_lg_1.png','image/mt1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,37,'image/mt1_sm_2.png','image/mt1_lg_2.png','image/mt1_d.png');
INSERT INTO wtj_product_img VALUES(NULL,38,'image/mt2_sm_1.png','image/mt2_lg_1.png','image/mt2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,38,'image/mt2_sm_2.png','image/mt2_lg_2.png','image/mt2_d.png');
INSERT INTO wtj_product_img VALUES(NULL,39,'image/mt3_sm_1.png','image/mt3_lg_1.png','image/mt3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,39,'image/mt3_sm_2.png','image/mt3_lg_2.png','image/mt3_d.png');
INSERT INTO wtj_product_img VALUES(NULL,40,'image/mt4_sm_1.png','image/mt4_lg_1.png','image/mt4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,40,'image/mt4_sm_2.png','image/mt4_lg_2.png','image/mt4_d.png');
INSERT INTO wtj_product_img VALUES(NULL,41,'image/mt5_sm_1.png','image/mt5_lg_1.png','image/mt5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,41,'image/mt5_sm_2.png','image/mt5_lg_2.png','image/mt5_d.png');
INSERT INTO wtj_product_img VALUES(NULL,42,'image/mt6_sm_1.png','image/mt6_lg_1.png','image/mt6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,42,'image/mt6_sm_2.png','image/mt6_lg_2.png','image/mt6_d.png');
INSERT INTO wtj_product_img VALUES(NULL,43,'image/mt7_sm_1.png','image/mt7_lg_1.png','image/mt7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,43,'image/mt7_sm_2.png','image/mt7_lg_2.png','image/mt7_d.png');
INSERT INTO wtj_product_img VALUES(NULL,44,'image/mt8_sm_1.png','image/mt8_lg_1.png','image/mt8_d.png');
INSERT INTO wtj_product_img VALUES(NULL,44,'image/mt8_sm_2.png','image/mt8_lg_2.png','image/mt8_d.png');


#首页展示产品表
CREATE TABLE wtj_index_product(
  index_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  style_id INT
);
INSERT INTO wtj_index_product VALUES(NULL,'斯品北欧宜家绦棉面料深蓝色布艺沙发','圆润外观,胖胖的身材,给你更多安全感,让身体沉浸在沙发的舒适怀抱中','http://img2.wutuojia.com/pic/qty_large/product/t81/b389/20160721/094339_385822.png',4464,'http://www.wutuojia.com/item/8779.html','客厅');
INSERT INTO wtj_index_product VALUES(NULL,'
帕拉多米简约现代麻布面料混色休闲椅','简约大气的设计，落落大方的款式','http://img2.wutuojia.com/pic/qty_large/product/t98/b415/20160819/171826_983572.png',1880,'http://www.wutuojia.com/item/9317.html','卧室');

