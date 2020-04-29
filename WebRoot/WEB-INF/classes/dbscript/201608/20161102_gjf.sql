Update zxpdjg a set a.comdm =(SELECT t.comid FROM pcompany t WHERE t.comdm=a.comdm);

ALTER TABLE zxpdjg
CHANGE COLUMN comdm comid varchar(32) DEFAULT NULL COMMENT '��ҵid';

ALTER TABLE zxpdjg
ADD PRIMARY KEY (pdjgid);


ALTER TABLE aa10
  CHANGE COLUMN AAA103 AAA103 VARCHAR(200) DEFAULT NULL COMMENT '��������';

---------------------
CREATE DEFINER = 'root'@'localhost'
PROCEDURE PRC_INSERTCODE(IN  AAA100_�������       VARCHAR(20),
                                           IN AAA101_�����������   VARCHAR(50),
                                           IN AAA104_�����ά����־ VARCHAR(20),
                                            IN AAA102_����ֵ        VARCHAR(20),
                                            IN AAA103_��������      VARCHAR(300),
                                            IN AAE030_��ʼ����      int,
                                           IN AAE031_��ֹ����       int,
                                           OUT P_CODE       int,
                                           OUT P_MSG       VARCHAR(20)
                                           )
BEGIN
 declare  N_AAZ094  varchar(32) default null;
 declare  N_AAZ093  VARCHAR(32) default null;
 
start transaction; 
 
  SELECT MAX(AAZ094)
    INTO N_AAZ094
    FROM AA09
   WHERE upper(AAA100) = upper(AAA100_�������);
  IF N_AAZ094 IS NULL THEN
    #SELECT nextval('SQ_AAZ094') INTO N_AAZ094;
    SELECT f_getSequenceStr() INTO N_AAZ094;
    INSERT INTO AA09
      (AAA100, AAA101, AAA104, AAZ094)
    VALUES
      (upper(AAA100_�������),
       AAA101_�����������,
       AAA104_�����ά����־,
       N_AAZ094);
  END IF;
  SELECT MAX(AAZ093)
    INTO N_AAZ093
    FROM AA10
   WHERE upper(AAA100) = upper(AAA100_�������)
     AND AAA102 = AAA102_����ֵ;
  IF N_AAZ093 IS NULL THEN
    #SELECT nextval('SQ_AAZ093') INTO N_AAZ093;
    SELECT f_getSequenceStr() INTO N_AAZ093;
    INSERT INTO AA10
      (AAA100, AAA102, AAA103, AAE030, AAE031, AAZ093, AAZ094)
    VALUES
    (upper(AAA100_�������),
             AAA102_����ֵ,
             AAA103_��������,
             AAE030_��ʼ����,
             AAE031_��ֹ����,
             N_AAZ093,
             N_AAZ094);
  END IF;
  
  -- ����û���쳣���ύ���� 
  commit;
   
  -- ���÷���ֵΪ1 
  set P_CODE = 1;
  set P_MSG = 'ִ�гɹ�!'; 
  SELECT P_CODE;
  SELECT P_MSG; 
END



call PRC_INSERTCODE('COMDRTXSM','��λ������д˵��','1','1','��ҵ���࣬��д����ֵ����������ö��ŷָ��������ʳƷ������ҵ������ʳƷ������ҵ��д1,6','199405',null,@P_CODE,@P_MSG);
call PRC_INSERTCODE('COMDRTXSM','��λ������д˵��','1','2','���ڸ�ʽyyyy-mm-dd������ҵ����������д����2012-3-8','199405',null,@P_CODE,@P_MSG);
call PRC_INSERTCODE('COMDRTXSM','��λ������д˵��','1','3','����֤��������д����ֵ����ʳƷ�������֤��3','199405',null,@P_CODE,@P_MSG);
call PRC_INSERTCODE('COMDRTXSM','��λ������д˵��','1','4','ͳ����������д����ֵ','199405',null,@P_CODE,@P_MSG);


