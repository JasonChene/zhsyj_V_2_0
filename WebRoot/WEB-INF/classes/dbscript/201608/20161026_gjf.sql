/*检验检测*/
﻿drop table jyjcjgmain;
CREATE TABLE jyjcjgmain (
  impbatchno varchar(32) NOT NULL COMMENT '导入批次',
  impczy varchar(100) DEFAULT NULL COMMENT '导入操作员',
  impczsj varchar(20) DEFAULT NULL COMMENT '导入操作时间',
  userid varchar(32) DEFAULT NULL COMMENT '操作员id',
  comid varchar(32) DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (impbatchno)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '检验检测结果主表';



drop table jyjcjg;
CREATE TABLE jyjcjg (
  jcjgid varchar(32) NOT NULL COMMENT '检查结果表ID',
  jcjylb varchar(10) DEFAULT NULL COMMENT '检测检验类别见aa10=JCJYLB',
  jcxmbzz varchar(20) DEFAULT NULL COMMENT '标准值',
  jcczsj datetime DEFAULT NULL COMMENT '检查操作时间',
  fjjg varchar(20) DEFAULT NULL COMMENT '复检结果',
  jcjyshbz varchar(10) DEFAULT NULL COMMENT '审核标志见aaa100=JCJYSHBZ',
  jcjycljg varchar(100) DEFAULT NULL COMMENT '检测检验处理结果',
  impyqlb varchar(50) DEFAULT NULL COMMENT '仪器类别（导入）',
  impbh varchar(20) DEFAULT NULL COMMENT '编号（导入）',
  impypzl varchar(50) DEFAULT NULL COMMENT '样品种类（导入）',
  impypmc varchar(50) DEFAULT NULL COMMENT '样品名称（导入）',
  impjcxm varchar(50) DEFAULT NULL COMMENT '检查项目（导入）',
  imphl varchar(20) DEFAULT NULL COMMENT '含量（导入）',
  impjcjg varchar(20) DEFAULT NULL COMMENT '检测结果（导入）',
  impssqy varchar(30) DEFAULT NULL COMMENT '所属区域（导入）',
  impyhmc varchar(50) DEFAULT NULL COMMENT '用户名称（导入）',
  impbjqy varchar(100) DEFAULT NULL COMMENT '被检企业（导入）',
  impcpsb varchar(50) DEFAULT NULL COMMENT '产品商标（导入）',
  impcppc varchar(50) DEFAULT NULL COMMENT '产品批次（导入）',
  impcpgg varchar(20) DEFAULT NULL COMMENT '产品规格（导入）',
  impsccj varchar(100) DEFAULT NULL COMMENT '生产厂家（导入）',
  impcysj varchar(20) DEFAULT NULL COMMENT '抽样时间（导入）',
  impjcsj varchar(20) DEFAULT NULL COMMENT '检测时间（导入）',
  impjcry varchar(20) DEFAULT NULL COMMENT '检查人员（导入）',
  impbz varchar(50) DEFAULT NULL COMMENT '备注（导入）',
  impbc1 varchar(50) DEFAULT NULL COMMENT '补充1（导入）',
  impbc2 varchar(50) DEFAULT NULL COMMENT '补充2（导入）',
  imprkrq varchar(20) DEFAULT NULL COMMENT '入库日期（导入）',
  impbatchno varchar(32) NOT NULL COMMENT '导入批次号',
  PRIMARY KEY (jcjgid),
  INDEX IDX_jyjcjg_impbatchno (impbatchno)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 268
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '检验检测结果表';


DELETE FROM jyjcxm;
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('1', '1', '农药残留', '<50', 'admin', '2016-05-03 11:02:11');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316014399964478286', '2', '甲醛', '', 'admin', '2016-09-13 16:01:43');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316021571079622061', '3', '亚硝酸盐', '', 'admin', '2016-09-13 16:02:15');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316030358635051441', '4', '二氧化硫', '', 'admin', '2016-09-13 16:03:03');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316032534819413750', '5', '吊白块', '', 'admin', '2016-09-13 16:03:25');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316034131156783547', '6', '甲醇', '', 'admin', '2016-09-13 16:03:41');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316041080412542319', '7', '双氧水', '', 'admin', '2016-09-13 16:04:10');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316094205933966072', '8', '苏丹红I', '', 'admin', '2016-09-13 16:09:42');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316113582526978530', '9', '苏丹红II', '', 'admin', '2016-09-13 16:11:35');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316115590322799672', '10', '苏丹红III', '', 'admin', '2016-09-13 16:11:55');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316123157652629453', '11', '苏丹红IV', '', 'admin', '2016-09-13 16:12:31');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316144362429552487', '12', '罗丹明B', '', 'admin', '2016-09-13 16:14:43');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316150988476308554', '13', '糖精钠', '', 'admin', '2016-09-13 16:15:09');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316172987220458479', '14', '溴酸钾', '', 'admin', '2016-09-13 16:17:29');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316175588797699255', '15', '蛋白质', '', 'admin', '2016-09-13 16:17:55');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316181820746144277', '16', '过氧化值', '', 'admin', '2016-09-13 16:18:18');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316192321117294090', '17', '过氧化苯甲酰', '', 'admin', '2016-09-13 16:19:23');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316305791334081270', '18', '食用油酸价', '', 'admin', '2016-09-13 16:30:57');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316311995869235249', '19', '硼砂', '', 'admin', '2016-09-13 16:31:19');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316315886291943020', '20', '脯氨酸', '', 'admin', '2016-09-13 16:31:58');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316332886481319790', '21', '羟甲基糖醛', '', 'admin', '2016-09-13 16:33:28');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316335001013502986', '22', '蜂蜜果糖', '', 'admin', '2016-09-13 16:33:50');
INSERT INTO jyjcxm(jcxmid, jcxmbh, jcxmmc, jcxmbzz, jcxmczy, jcxmczsj) VALUES
('2016091316341639155825899', '23', '果糖及葡萄糖', '', 'admin', '2016-09-13 16:34:16');




INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102016375920279636356', '/jyjc/jyjcUploadExcelDataIndex', '检验检测数据excel上报', '2016050517155823876604843', 1, '1', NULL, NULL, NULL, NULL, NULL, '1', 'jyjcUploadExcelDataIndex', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102413465578617350448', '/jyjc/jyjcDownLoadExcel', '检验检测信息导入模板下载', '2016102016375920279636356', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'jyjcDownLoadExcel', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102413582282451794537', '/jyjc/saveJyjcUploadExcel', '检验检测上传数据保存', '2016102016375920279636356', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'saveJyjcUploadExcel', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102414013249958495370', '/jyjc/jyjcUpLoadExcel', '检验检测数据上传数据', '2016102016375920279636356', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'jyjcUpLoadExcel', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102414050791094492288', '/jyjc/jyjcUploadQueryIndex', '检验检测上报数据查询', '2016050517155823876604843', 1, '1', NULL, NULL, NULL, NULL, NULL, '1', 'jyjcUploadQueryIndex', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102514392767263381369', '/jyjc/queryJyjcUploadDataMain', '检验检测上报数据查询主表', '2016102414050791094492288', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'queryJyjcUploadDataMain', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102514405545854892440', '/jyjc/queryJyjcUploadData', '检验检测上报数据查询明细', '2016102414050791094492288', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'queryJyjcUploadData', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102517284322591220950', '/jyjc/jyjcUploadQueryComIndex', '检验检测上报数据局端查询', '2016050517155823876604843', 1, '1', NULL, NULL, NULL, NULL, NULL, '1', 'jyjcUploadQueryComIndex', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');
INSERT INTO sysfunction(FUNCTIONID, LOCATION, TITLE, PARENT, ORDERNO, TYPE, DESCRIPTION, LOG, OWNER, ACTIVE, FUNCTIONCODE, VISIBLE, BIZID, ROLBIZCLASS, IMAGEURL, EXPANDEDIMAGEURL, AAA102, CAE005, ROLBIZABLE, TARGET, SYSTEMCODE) VALUES
('2016102615344203944431572', '/jyjc/queryJyjcUploadCom', '检验检测上报局端查询上报单位', '2016102517284322591220950', 1, '2', NULL, NULL, NULL, NULL, NULL, '1', 'queryJyjcUploadCom', NULL, NULL, NULL, NULL, NULL, NULL, '', 'jyjcxt');


INSERT INTO sysrole(ROLEID, ROLEDESC, ROLENAME, SYSROLEFLAG, ORGID) VALUES
('2016102114210245464588122', '检验检测企业角色', '检验检测企业角色', '0', '2016062217255064055994870');

INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482268494695447', '2016102114210245464588122', '2016102016375920279636356', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482268541474945', '2016102114210245464588122', '2016102413465578617350448', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482269017036185', '2016102114210245464588122', '2016102413582282451794537', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482269386019267', '2016102114210245464588122', '2016102414013249958495370', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482269539901344', '2016102114210245464588122', '2016102414050791094492288', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482269626130763', '2016102114210245464588122', '2016102514392767263381369', NULL);
INSERT INTO sysrolefunction(ROLEFUNCTIONID, ROLEID, FUNCTIONID, CHECKTYPE) VALUES
('2016102616482269877179686', '2016102114210245464588122', '2016102514405545854892440', NULL);







