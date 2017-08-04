--HospitalRegistered初始数据，为方便测试保留sql语句文件
--数据库版本：MS SQL server 2008 
--2017/05/05 11:04 
--zxc
--DataBase: HospitalRegistered

insert into patient values(
100001,
'123456',
'李明',
'45',
'男',
'1300001111',
'130724000011112222'
);
insert into department values(
1,
'耳鼻喉科',
'外科',
'这个科室挺厉害了,拥有好几个高级医生,好评率也老高的'
);
insert into department values(
2,
'骨科',
'外科',
'这个科室挺厉害了,拥有好几个高级医生,好评率也老高的'
);
insert into userRole values (1,'门诊医生');
insert into userRole values (2,'系统管理员');
insert into permission values (1,'医院简介');
insert into permission values (2,'新闻管理');
insert into rolePermission values (1,1,1);
insert into doctor values(
200001,
'123456',
'华佗',
'男',
'45',
'1300001111',
1,
'主任医师',
'200001.jpg',
1,
'130724000011112222',
'这个医师厉害了，外科鼻祖，可惜死在了曹操手中'
);
insert into doctor values(
200002,
'123456',
'扁鹊',
'男',
'45',
'1300001111',
2,
'主任医师',
'200002.jpg',
1,
'130724000011112222',
'扁鹊，原姓秦，名越人，一名缓，号卢医，生于周安王元年（公元前401年）前后，卒于周赧王五年（公元前310年），据传是在秦国替秦武王医疗后，在离开秦国的途中，于骊山北面的小路，被秦国太医李酰使刺客劫杀。扁鹊与华佗、张仲景、李时珍并称中国古代四大名医。 传说中东周战国时期田齐勃海郡莫州（今河北任丘）人。以其医术高超，被认为是神医.'
);
insert into appointment values(
3,
200002,
'2017-05-08',
100002,
'待诊'
);
insert into workforce values(
1,
'2017-05-07',
10,
200001
);
insert into notice values(
2,
'新闻标题2',
'我院最近引进一批德国先进医疗机械',
'2017-05-07'
);

insert into hospital values(
1,
'这是一家三甲医院，这是一家三甲医院，这是一家三甲医院，这是一家三甲医院，'
);