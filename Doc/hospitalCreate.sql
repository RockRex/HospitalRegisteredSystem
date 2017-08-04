--数据库版本：MS SQL server 2008 
--20170503 17:46
--zxc
--DataBase: HospitalRegistered

/**
系统面向患者和医生分前台后台，
采用不同的登录入口，
所以医生信息表和患者信息表都有账户和密码。
医生和科室的关系是多对一的，
而患者预约科室的医生是一对多的，
考虑到这两者在逻辑关系上的较大差异性，
所以医生和患者不能做成一张表，
故而将系统分为前台后台，
虽然老师不建议将信息系统分为前台后台，
但是对于预约挂号而言这样更符合实际情况。
**/

--1.患者表
CREATE TABLE patient(
  patientId int NOT NULL,
  patientPassword varchar(255),
  patientName varchar(255),
  patientAge varchar(255),
  patientSex varchar(255),
  patientTel varchar(255),
  patientIdcard varchar(255),
  PRIMARY KEY  (patientId)
) 
--2.科室信息表
CREATE TABLE department(
  departmentId int identity(1,1) NOT NULL ,--科室的id
  departmentName varchar(255),--科室名称
  departmentType varchar(255),--科室类别
  departmentRemark text,--科室简介
  PRIMARY KEY  (departmentId)
) 

--3.用户角色表（对医生的）
create table userRole(
  userRoleId int identity(1,1) NOT NULL,--角色Id
  userTypeName nvarchar(30) not null,--角色名称(门诊医生 后台管理员，之类的)
  primary key(userRoleId),
)
--4.权限表
create table permission(
  permissionId int identity(1,1) NOT NULL,--权限Id
  permissionName nvarchar(30) not null,--权限名称
  primary key(permissionId),
)
--5.角色权限   防止多表连接查询的复杂性，这里不搞外键了
create table rolePermission(
  rpId int identity(1,1) NOT NULL,--主键标识
  userRoleId int NOT NULL,--角色Id
  permissionId int NOT NULL,--权限Id
  primary key(rpId),
  foreign key(permissionId) references permission(permissionId),
  foreign key(userRoleId) references userRole(userRoleId),
)
--6.医生信息表
CREATE TABLE doctor(
  doctorId int NOT NULL,--医生ID，这也是登录账户
  doctorPassword varchar(255),--医生密码
  doctorName varchar(255),--医生姓名
  doctorSex varchar(255),--医生性别
  doctorAge varchar(255),--医生年龄
  doctorTel varchar(255),--医生电话
  departmentId int,--所属科室   外键
  doctorTitle varchar(255),--职称
  doctorImg varchar(255),--照片，这里只存照片的文件名
  userRoleId int,--所属角色    外键
  doctorIdcard varchar(255),--身份证号
  doctorRemark text,--医生简介
  PRIMARY KEY (doctorId),
  foreign key(userRoleId) references userRole(userRoleId),
  foreign key(departmentId) references department(departmentId),
)
--7.预约信息表
CREATE TABLE appointment(
  appointmentId int identity(1,1) NOT NULL,--预约标识ID
  doctorId int default NULL,--预约医生 外键
  appointmentDate varchar(255) default NULL,--预约时间
  patientId int default NULL,--患者ID 外键
  appointmentStatus varchar(255) default NULL,--预约状态  待诊or完成
  PRIMARY KEY (appointmentId),
  foreign key(doctorId) references doctor(doctorId),
  foreign key(patientId) references patient(patientId),
) 
--8.医生排班表
CREATE TABLE workforce(
  workforceId int identity(1,1) NOT NULL,--排班表标识
  workforceDate varchar(255) default NULL,--排班时间
  workforcePatNum int default NULL,--接诊人数限制
  doctorId int default NULL,--医生ID 外键
  PRIMARY KEY (workforceId),
  foreign key(doctorId) references doctor(doctorId),
)
--9.新闻表
CREATE TABLE notice(
  noticeId int identity(1,1) NOT NULL,
  noticeTitle varchar(255),
  noticeContent text,
  noticeSavetime varchar(255),
  PRIMARY KEY  (noticeId)
)
--10.医院简介表,做这个是想把医院信息做活,可以修改的
CREATE TABLE hospital(
  hospitalId int identity(1,1) NOT NULL,--标识主键
  hospitalRemark text,--简介内容
  PRIMARY KEY (hospitalId)
)