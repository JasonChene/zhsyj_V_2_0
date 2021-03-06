
ALTER TABLE pcomry
CHANGE COLUMN comdm comid varchar(50) binary CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单位id';

--1227
ALTER TABLE bscheckmaster
  ADD COLUMN lxr VARCHAR(20) DEFAULT NULL COMMENT '联系人' AFTER checkdatakind,
  ADD COLUMN lxdh VARCHAR(20) DEFAULT NULL COMMENT '联系电话' AFTER lxr;



ALTER TABLE pcompanyxkz
  CHANGE COLUMN comxkzztyt comxkzztyt VARCHAR(200) DEFAULT NULL COMMENT '主体业态',
  ADD COLUMN comxkzjycs VARCHAR(200) DEFAULT NULL COMMENT '经营场所' AFTER comxkzztyt;

INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('ITEMTYPE', '2', '专项', NULL, NULL, '2016122812040716631649915', '1454', NULL, NULL, NULL);

CREATE TABLE pfjcsorder (
  pfjcsorderid VARCHAR(32) NOT NULL,
  userid VARCHAR(32) DEFAULT NULL COMMENT '对应操作员表主键',
  fjcsid VARCHAR(32) DEFAULT NULL COMMENT '对应附件参数表主键',
  fjcspx INT DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (pfjcsorderid)
)
ENGINE = INNODB
COMMENT = '附件参数排序表';

delete from aa10 where aaa100='WFXWDC';
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('WFXWDC', '1', '轻微', 199405, NULL, '2016060316061464249682486', '2016060316061466331878738', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('WFXWDC', '2', '一般', 199405, NULL, '2016123016433980038417577', '2016060316061466331878738', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('WFXWDC', '4', '特别严重', 199405, NULL, '2016123016434080903418251', '2016060316061466331878738', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('WFXWDC', '3', '严重', 199405, NULL, '2016123016434084203733582', '2016060316061466331878738', NULL, NULL, NULL);



delete from aa10 where  aaa100='ZFRYSFLX';
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('ZFRYSFLX', '3', '相关人员', 199405, NULL, '2016092713105236097806910', '1410', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('ZFRYSFLX', '4', '案件登记人员', 199405, NULL, '2016123109245545690589347', '1410', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('ZFRYSFLX', '1', '主办', 199405, NULL, '30758', '1410', NULL, NULL, NULL);
INSERT INTO aa10(AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094, AAA104, AAA101, AAA105) VALUES
('ZFRYSFLX', '2', '协办', 199405, NULL, '30759', '1410', NULL, NULL, NULL);


ALTER TABLE zfajcbr
  ADD INDEX IDX_zfajcbr (ajdjid, userid);

update aa01 set aaa005='SJSPYPJDGLJ' where aaa001='SJSPYPJDGLJ';


ALTER TABLE bstbodyinfo
  ADD COLUMN miaoshu VARCHAR(100) DEFAULT NULL COMMENT '汉字描述' AFTER tfootinfo;


