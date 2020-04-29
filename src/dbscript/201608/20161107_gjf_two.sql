
CREATE DEFINER = 'root'@'%'
FUNCTION fun_��ȡcomdm()
  RETURNS varchar(40) CHARSET utf8
BEGIN
  declare v_maxcomdmh VARCHAR(20); 
  declare v_maxcomdm VARCHAR(20); 
    
    SELECT MAX(comdm) 
    FROM pcompany 
    INTO v_maxcomdm ;


    SET v_maxcomdmh=SUBSTRING(v_maxcomdm,2);
    SET v_maxcomdmh=v_maxcomdmh+1;
    set v_maxcomdmh=RIGHT(CONCAT('00000000',v_maxcomdmh),8);

    SET v_maxcomdm=CONCAT('m',v_maxcomdmh);

    RETURN v_maxcomdm;

END

update pcompany set comdm=concat('m000',substring(comdm,3)) where substring(comdm,1,2)='ty';
update sysuser set username=concat('m000',substring(username,3)) where substring(username,1,2)='ty';

----------------------------------------------------------------------------

CREATE TABLE bs_company (
  COM_ID bigint(20) NOT NULL DEFAULT 0 COMMENT '��ҵID',
  COM_USER_NAME varchar(50) NOT NULL COMMENT '��¼�û���',
  COM_PWD varchar(32) NOT NULL COMMENT '��¼����',
  COM_MC varchar(200) NOT NULL COMMENT '��˾����',
  COM_ZJHM varchar(100) NOT NULL COMMENT 'Ӫҵִ�պ�',
  COM_DM varchar(50) DEFAULT NULL COMMENT '��ҵ���룺��ҵ������ĸ+6λ�����������+9λ���к�',
  COM_LXR varchar(50) DEFAULT NULL COMMENT '��ϵ��',
  COM_LXDH varchar(30) DEFAULT NULL COMMENT '��ϵ�̶��绰',
  COM_ADDRESS varchar(200) DEFAULT NULL COMMENT '��˾��ַ',
  COM_SHBZ varchar(1) DEFAULT 'Y' COMMENT '��˱�־ Yͨ�� Nδͨ�� M �ȴ����',
  COM_SHRID bigint(20) DEFAULT NULL COMMENT '�����ID(Ĭ�������ID=3)',
  COM_SHSJ datetime DEFAULT NULL COMMENT '���ʱ��',
  COM_QYLX varchar(100) DEFAULT NULL COMMENT '��ҵ����ID ������BS_QYLX',
  COM_QYXZ varchar(3) DEFAULT NULL COMMENT '1���� 2���� 3�ɷ� 4˽Ӫ 5���� 6���� 7����',
  COM_PROVINCE_DM varchar(8) DEFAULT NULL COMMENT 'ʡ�ݴ���',
  COM_CITY_DM varchar(8) DEFAULT NULL COMMENT '�д���',
  COM_COUNTY_DM varchar(8) DEFAULT NULL COMMENT '��������',
  COM_WEB varchar(300) DEFAULT NULL COMMENT '��ַ',
  COM_EMAIL varchar(150) DEFAULT NULL COMMENT '�����ʼ�',
  COM_PROVINCE varchar(200) DEFAULT NULL COMMENT 'ʡ������',
  COM_CITY varchar(200) DEFAULT NULL COMMENT '������',
  COM_COUNTY varchar(200) NOT NULL COMMENT '��������',
  COM_WTGYY varchar(200) DEFAULT NULL COMMENT '���δͨ��ԭ��',
  COM_FAX varchar(20) DEFAULT NULL COMMENT '����',
  COM_ZIP varchar(6) DEFAULT NULL COMMENT '�ʱ�',
  COM_LXSJ varchar(20) DEFAULT NULL COMMENT '��ϵ�ֻ�',
  COM_JJXZ varchar(50) DEFAULT NULL COMMENT 'Ӫҵִ���ϵľ������ʻ�����ҵ����Ԥ��׼�ϵĵľ�������',
  COM_ZZJGDM varchar(50) DEFAULT NULL COMMENT '��֯��������',
  COM_GSDJJG varchar(200) DEFAULT NULL COMMENT 'Ӫҵִ���ϵĵǼǻ���ȫ��',
  COM_CLRQ datetime DEFAULT NULL COMMENT '��˾��������',
  COM_JYQX varchar(50) DEFAULT NULL COMMENT 'Ӫҵִ���ϵľ�Ӫ����',
  COM_ZCZJ bigint(20) DEFAULT NULL COMMENT 'ע���ʽ���Ԫ��',
  COM_FDDBR varchar(50) DEFAULT NULL COMMENT '����������',
  COM_ZCLB varchar(10) DEFAULT '1' COMMENT '1��ҵ����ע��2 ����Ա���ע��',
  COM_DZCRID bigint(20) DEFAULT NULL COMMENT '����ҵע��Ĳ�����ID',
  COM_DZCSJ datetime DEFAULT NULL COMMENT '��ע��ʱ��',
  QYMC varchar(100) DEFAULT NULL COMMENT '��ҵ����',
  QYYWMC varchar(100) DEFAULT NULL COMMENT '��ҵӢ������',
  YLJGMC varchar(100) DEFAULT NULL COMMENT 'ҽ�ƻ�������',
  ZZJGDM varchar(100) DEFAULT NULL COMMENT '��֯��������',
  YYZZZCH varchar(100) DEFAULT NULL COMMENT 'Ӫҵִ��ע���',
  ZCZJ float(20, 2) DEFAULT NULL COMMENT 'ע���ʽ�',
  tzzb float(20, 2) DEFAULT NULL COMMENT 'Ͷ���ʱ�',
  JYFS varchar(50) DEFAULT NULL COMMENT '��Ӫ��ʽ',
  QYLX varchar(100) DEFAULT NULL COMMENT '��ҵ����',
  FDDBR varchar(50) DEFAULT NULL COMMENT '����������',
  FRDB varchar(50) DEFAULT NULL COMMENT '���˴���',
  QYGM varchar(10) DEFAULT NULL COMMENT '��ҵ��ģ',
  QYRS bigint(20) DEFAULT NULL COMMENT '��ҵ����',
  QYSJSJ datetime DEFAULT NULL COMMENT '��ҵʼ��ʱ��',
  QYZJGMSJ datetime DEFAULT NULL COMMENT '��ҵ�������ʱ��',
  QYLXDHHM varchar(20) DEFAULT NULL COMMENT '��ҵ��ϵ�绰����',
  QYLXCZHM varchar(20) DEFAULT NULL COMMENT '��ҵ��ϵ�������',
  QYWZ varchar(200) DEFAULT NULL COMMENT '��ҵ��ַ',
  QYFZRXM varchar(50) DEFAULT NULL COMMENT '��ҵ����������',
  QYLXRXM varchar(50) DEFAULT NULL COMMENT '��ҵ��ϵ������',
  ZCDZ varchar(200) DEFAULT NULL COMMENT 'ע���ַ',
  ZCDZYW varchar(200) DEFAULT NULL COMMENT 'ע���ַ(Ӣ��)',
  SCDZ varchar(200) DEFAULT NULL COMMENT '������ַ',
  SCDZYW varchar(200) DEFAULT NULL COMMENT '������ַ(Ӣ��)',
  TXDZ varchar(200) DEFAULT NULL COMMENT 'ͨ�ŵ�ַ',
  YZBM varchar(16) DEFAULT NULL COMMENT '��������',
  DZGJHDQ varchar(70) DEFAULT '�й�' COMMENT '��ַ-����/�����',
  DZSZXSZZQ varchar(70) DEFAULT '����' COMMENT '��ַ-ʡ/ֱϽ��/������',
  DZSQZZZM varchar(70) DEFAULT '' COMMENT '��ַ-��/��/������/��',
  DZXZZXXJS varchar(70) DEFAULT '' COMMENT '��ַ-��/������/�ؼ���',
  DZXZJDBSC varchar(70) DEFAULT NULL COMMENT '��ַ-��/��/�ֵ����´�',
  DZCJLND varchar(70) DEFAULT NULL COMMENT '��ַ-��/��/·/Ū��',
  DZMPHM varchar(70) DEFAULT NULL COMMENT '��ַ-���ƺ���',
  YPSCXKZBH varchar(50) DEFAULT NULL COMMENT 'ҩƷ�������֤���',
  YPGMPZSBH varchar(50) DEFAULT NULL COMMENT 'ҩƷGMP֤����',
  YPJYXKZH varchar(50) DEFAULT NULL COMMENT 'ҩƷ��Ӫ���֤��',
  YPJYZLGLGFRZZSBH varchar(50) DEFAULT NULL COMMENT 'ҩƷ��Ӫ��������淶��֤֤����',
  YLQXSCXKZH varchar(50) DEFAULT NULL COMMENT 'ҽ����е�������֤��',
  FZJG varchar(100) DEFAULT NULL COMMENT '��֤����',
  FZRQ datetime DEFAULT NULL COMMENT '��֤����',
  ZJZSYXQQSRQ datetime DEFAULT NULL COMMENT '֤��/֤����Ч����ʼ����',
  ZJZSYXQZZRQ datetime DEFAULT NULL COMMENT '֤��/֤����Ч����ֹ����',
  CPZCDLJG varchar(200) DEFAULT NULL COMMENT '��Ʒע��������',
  CPDLR varchar(200) DEFAULT NULL COMMENT '��Ʒ������',
  CPSHFWJG varchar(200) DEFAULT NULL COMMENT '��Ʒ�ۺ�������',
  WTYJJG varchar(200) DEFAULT NULL COMMENT 'ί���о�����',
  QYZJBMMC varchar(100) DEFAULT NULL COMMENT '��ҵ�ʼಿ������',
  QYZJBMGJJSZCRS bigint(20) DEFAULT NULL COMMENT '��ҵ�ʼಿ�Ÿ߼�����ְ������',
  QYZJBMZJJSZCRS bigint(20) DEFAULT NULL COMMENT '��ҵ�ʼಿ���м�����ְ������',
  QYZCDZYBHPZS bigint(20) DEFAULT NULL COMMENT '��ҵע�����ҩ����Ʒ����',
  GDZCYZ bigint(20) DEFAULT NULL COMMENT '�̶��ʲ�ԭֵ',
  GDZCJZ bigint(20) DEFAULT NULL COMMENT '�̶��ʲ���ֵ',
  SNDXSE float(20, 2) DEFAULT NULL COMMENT '��������۶�',
  SNDLS float(20, 2) DEFAULT NULL COMMENT '�������˰',
  SNGYZCZ bigint(20) DEFAULT NULL COMMENT '���깤ҵ�ܲ�ֵ',
  SNXSSR bigint(20) DEFAULT NULL COMMENT '������������',
  nxse_f float(20, 2) DEFAULT NULL COMMENT '�����������۶� ��һ��',
  nxse_s float(20, 2) DEFAULT NULL COMMENT '�����������۶� �ڶ���',
  nxse_t float(20, 2) DEFAULT NULL COMMENT '�����������۶� ������',
  SNLR float(20, 2) DEFAULT NULL COMMENT '��������',
  SNSJ bigint(20) DEFAULT NULL COMMENT '����˰��',
  SNCH bigint(20) DEFAULT NULL COMMENT '���괴��',
  ZYJSRYBL bigint(20) DEFAULT NULL COMMENT 'רҵ������Ա����',
  ZLSQR varchar(50) DEFAULT NULL COMMENT '������Ȩ��',
  ZLFZR varchar(50) DEFAULT NULL COMMENT '����������',
  ZLFZRS bigint(20) DEFAULT NULL COMMENT '������������',
  SCFZR varchar(50) DEFAULT NULL COMMENT '����������',
  SCFZRS bigint(20) DEFAULT NULL COMMENT '������������',
  ZYYSRS bigint(20) DEFAULT NULL COMMENT 'ִҵҩʦ����',
  ZRYSRS bigint(20) DEFAULT NULL COMMENT '����ҩʦ����',
  FZRYSRS bigint(20) DEFAULT NULL COMMENT '������ҩʦ����',
  ZGYSRS bigint(20) DEFAULT NULL COMMENT '����ҩʦ����',
  YSRS01 bigint(20) DEFAULT NULL COMMENT 'ҩʦ����',
  YSRS02 bigint(20) DEFAULT NULL COMMENT 'ҩʿ����',
  CQZDMJ bigint(20) DEFAULT NULL COMMENT '����ռ�����',
  JZMJ float(20, 2) DEFAULT NULL COMMENT '�������',
  scmj float(20, 2) DEFAULT NULL COMMENT '�������',
  jhmj float(20, 2) DEFAULT NULL COMMENT '�������',
  jymj float(20, 2) DEFAULT NULL COMMENT '�������',
  yclccmj float(20, 2) DEFAULT NULL COMMENT 'ԭ���ϲִ����',
  cpccmj float(20, 2) DEFAULT NULL COMMENT '��Ʒ�ִ����',
  YLJGBZCWS bigint(20) DEFAULT NULL COMMENT 'ҽ�ƻ������ƴ�λ��',
  QYZXBZ varchar(1) DEFAULT NULL COMMENT '��ҵע����־',
  QYZXRQ datetime DEFAULT NULL COMMENT '��ҵע������',
  QYZXYY varchar(20) DEFAULT NULL COMMENT '��ҵע��ԭ��',
  QYSSMGSMC varchar(100) DEFAULT NULL COMMENT '��ҵ����ĸ��˾����',
  QYSSMGSDZ varchar(200) DEFAULT NULL COMMENT '��ҵ����ĸ��˾��ַ',
  WFGBHDQ varchar(50) DEFAULT NULL COMMENT '�ⷽ��������',
  GYSMC varchar(100) DEFAULT NULL COMMENT '��Ӧ������',
  CPJXSMC varchar(100) DEFAULT NULL COMMENT '��Ʒ����������',
  FDDBRSFZ varchar(50) DEFAULT NULL COMMENT '�������������֤��',
  FDDBRLXDH varchar(50) DEFAULT NULL COMMENT '������������ϵ�绰',
  ZCLY varchar(10) DEFAULT '1' COMMENT 'ע����Դ  1��ҵ����ע�� 2�����������ϲ�������',
  UUID varchar(40) DEFAULT NULL COMMENT 'UUID',
  LX_DL varchar(200) DEFAULT NULL COMMENT '��ҵ���������Ĵ��࣬��Ӧbs_qylxl�е�x_dl',
  zjlx char(2) DEFAULT NULL COMMENT '֤������ 01 ������ô��� 02 Ӫҵִ�պ� 03���֤',
  zycp varchar(500) DEFAULT NULL COMMENT '��Ҫ��Ʒ',
  ncl varchar(100) DEFAULT NULL COMMENT '�����',
  doflag varchar(2) DEFAULT '0' COMMENT '�����ʶ',
  PRIMARY KEY (COM_ID),
  INDEX idx_com_user_name (COM_USER_NAME),
  UNIQUE INDEX IDX_COMDM (COM_DM),
  INDEX IDX_COUNTRY_DM (COM_COUNTY_DM),
  INDEX IDX_SHBZ (COM_SHBZ),
  UNIQUE INDEX IDX_UUID (UUID)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 532
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '��˾��ҵ��';


---------------------------------------------------------------------------------------------------------------

CREATE TABLE bs_tyxkz (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  COM_DM varchar(50) NOT NULL COMMENT '��ҵ����',
  XKZBH varchar(200) NOT NULL COMMENT '���֤���',
  SQ_SQBH varchar(20) NOT NULL COMMENT '��Ӧ������',
  YYZZH varchar(30) DEFAULT NULL COMMENT 'Ӫҵִ�պ�',
  ZZJGDM varchar(50) DEFAULT NULL COMMENT '��֯��������',
  XKZ_FZRQ date NOT NULL COMMENT '��֤����',
  XKZ_YXQ int(11) NOT NULL DEFAULT 5 COMMENT '��Ч��',
  XKZ_YXQZ date NOT NULL COMMENT '��Ч��ֹ',
  XKZ_SFZX varchar(1) DEFAULT 'N' COMMENT '�Ƿ�ע�� Y�� N��',
  XKZ_ZXYY varchar(200) DEFAULT NULL COMMENT 'ע��ԭ��',
  XKZ_ZXSJ datetime DEFAULT NULL COMMENT 'ע��ʱ��',
  XKZ_XKLB varchar(20) DEFAULT NULL COMMENT '�����𣨶�Ӧ����� dm_dmlb=XKZLB��',
  xkz_xkzlbbz varchar(10) DEFAULT NULL COMMENT '���֤����ע(1,ʳƷ��Ӽ� 2 ʳƷ .....)',
  XKZ_BZ varchar(200) DEFAULT NULL COMMENT '��ע',
  CPMC varchar(100) DEFAULT NULL COMMENT '��Ʒ����',
  CPGG varchar(200) DEFAULT NULL COMMENT '��Ʒ����ͺ�',
  YLQXXNJGJZC varchar(1000) DEFAULT NULL COMMENT '�ṹ�����',
  CPSYFW varchar(1000) DEFAULT NULL COMMENT '���÷�Χ',
  CPJSYQ varchar(1000) DEFAULT NULL COMMENT '��Ʒ����Ҫ��',
  QY_SCDZ varchar(200) DEFAULT NULL COMMENT '��ҵ������ַ',
  qy_lxdh varchar(20) DEFAULT NULL COMMENT '��ҵ��ϵ�绰',
  QY_SCDZ_YZBM varchar(16) DEFAULT NULL COMMENT '��ҵ������ַ��������',
  BJP_SCPZ varchar(200) DEFAULT NULL COMMENT '����Ʒ����Ʒ��',
  BJP_XKFW varchar(200) DEFAULT NULL COMMENT '����Ʒ��ɷ�Χ',
  CCTJ varchar(200) DEFAULT NULL COMMENT '�洢����',
  CPYQYT varchar(200) DEFAULT NULL COMMENT '��ƷԤ����;',
  CPYXQ varchar(10) DEFAULT NULL COMMENT '��Ʒ��Ч��',
  SQ_HZ_SZDYBH varchar(100) DEFAULT NULL COMMENT '����׼������뵥Ԫ���(���뵥Ԫ���) �����,�ָ�',
  SFJYSQ varchar(1) DEFAULT '0' COMMENT '�Ƿ��������',
  OS_VER bigint(20) DEFAULT 0 COMMENT '�����汾��',
  OS_YXBZ varchar(1) DEFAULT '1' COMMENT '��Ч��־ 1��  0��',
  OS_SJ date DEFAULT NULL COMMENT '����ʱ��',
  BG_VER varchar(5) DEFAULT NULL COMMENT '��ⱨ��汾��',
  OS_VER_LAST bigint(20) DEFAULT 0 COMMENT '��һ�������汾��',
  xkz_fzjg varchar(50) DEFAULT '����ʡʳƷҩƷ�ල�����' COMMENT '���֤��֤����',
  JYXM varchar(2000) DEFAULT NULL COMMENT '��֤/��Ӫ��Ŀ��Ӫ��Χ',
  jyxmyw varchar(200) DEFAULT NULL COMMENT '��֤/��Ӫ��Χ����Ŀ-Ӣ��',
  ZTXT char(1) NOT NULL DEFAULT '9' COMMENT '����ҵ̬',
  FZRQ date DEFAULT NULL COMMENT '��֤����',
  FZJG varchar(100) DEFAULT NULL COMMENT '��֤����',
  qfr varchar(50) DEFAULT NULL COMMENT 'ǩ����',
  FBS int(2) DEFAULT NULL COMMENT '������',
  YXQXZ date DEFAULT NULL COMMENT '��Ч������',
  YXQXZ01 date DEFAULT NULL COMMENT '��Ч������',
  SFSQJTYCPS tinyint(4) DEFAULT NULL COMMENT '�Ƿ����뼯���ò�����',
  SFSQWLJY char(1) DEFAULT NULL COMMENT '�Ƿ��������羭Ӫ',
  SFSQJLZYCF tinyint(4) DEFAULT NULL COMMENT '�Ƿ����뽨���������',
  JYCS varchar(100) DEFAULT NULL COMMENT '��Ӫ����',
  ZS varchar(100) DEFAULT NULL COMMENT 'ס��',
  zsyw varchar(100) DEFAULT NULL COMMENT 'ס��Ӣ��',
  FDDBR varchar(100) DEFAULT NULL COMMENT '����������',
  fddbr_id bigint(20) DEFAULT NULL COMMENT '����������id',
  fddbrsfzh varchar(30) DEFAULT NULL COMMENT '�������������֤��',
  fddbrlxdh varchar(200) DEFAULT NULL COMMENT '������������ϵ�绰',
  fax varchar(20) DEFAULT NULL COMMENT '����绰',
  zip varchar(10) DEFAULT NULL COMMENT '��������',
  COM_MC varchar(50) DEFAULT NULL COMMENT '��ҵ����',
  COM_MCYW varchar(50) DEFAULT NULL COMMENT '��ҵ����Ӣ��',
  QYWZ varchar(50) DEFAULT NULL COMMENT '��ҵ��ַ',
  rcjdgljg varchar(50) DEFAULT NULL COMMENT '�ճ��ල�������',
  rcjdglry varchar(50) DEFAULT NULL COMMENT '�ճ��ල������Ա',
  xkz_zxzt varchar(1) DEFAULT NULL,
  spjy_jycs varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����Ӫ������ַ',
  spjy_ckdz varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ���ֿ��ַ',
  spjy_fzr_id varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ��������id',
  spjy_ztlx varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ,��������',
  spjy_jylb varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����Ӫ���',
  spjy_jyqx varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����Ӫ����',
  spjy_jymj varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����Ӫ���',
  spjy_jyxm varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����Ӫ��Ŀ',
  xkz_tjdylcbz varchar(2) DEFAULT '0' COMMENT '�ύ��ӡ���̱�־0��1��',
  YPJY_JYFW varchar(50) DEFAULT NULL COMMENT 'ҩƷ��Ӫ,��Ӫ��Χ',
  YPJY_FDDBR varchar(20) DEFAULT NULL COMMENT 'ҩƷ��Ӫ,����������',
  YPJY_QYFZR varchar(20) DEFAULT NULL COMMENT 'ҩƷ��Ӫ����ҵ������',
  YPJY_ZLFZR varchar(20) DEFAULT NULL COMMENT 'ҩƷ��Ӫ������������',
  YPJY_JYFS varchar(20) DEFAULT NULL COMMENT 'ҩƷ��Ӫ����Ӫ��ʽ',
  YPJY_ZCDZ varchar(100) DEFAULT NULL COMMENT 'ҩƷ��Ӫ��ע���ַ',
  YPJY_CKDZ varchar(100) DEFAULT NULL COMMENT 'ҩƷ��Ӫ���ֿ��ַ',
  YPJY_QYMC varchar(50) DEFAULT NULL COMMENT 'ҩƷ��Ӫ����ҵ����',
  qyfzr varchar(50) DEFAULT NULL COMMENT '��ҵ������',
  ylqxjy_ckdz varchar(100) DEFAULT NULL COMMENT 'ҽ����е��Ӫ�ֿ��ַ',
  zlglr varchar(50) DEFAULT NULL COMMENT '����������',
  ylqxsc_zcdz varchar(50) DEFAULT NULL COMMENT 'ҽ����е����ע���ַ',
  xkz_qylx varchar(10) DEFAULT NULL COMMENT '��ҵ����',
  JYFS varchar(20) DEFAULT NULL COMMENT '��Ӫ��ʽ',
  JYMS varchar(50) DEFAULT NULL COMMENT '��Ӫģʽ',
  ZCZB int(11) DEFAULT NULL COMMENT 'ע���ʱ�����Ԫ��',
  yljgzjxk_yljgmc varchar(100) DEFAULT NULL COMMENT 'ҽ�ƻ�������',
  yljgzjxk_zcdz varchar(500) DEFAULT NULL COMMENT 'ע���ַ',
  yljgzjxk_lxr varchar(20) DEFAULT NULL COMMENT '��ϵ��',
  yljgzjxk_lxr_dh varchar(20) DEFAULT NULL COMMENT '��ϵ�˵绰',
  yljgzjxk_jglx varchar(20) DEFAULT NULL COMMENT '��������',
  yljgzjxk_fddbr varchar(20) DEFAULT NULL COMMENT '����������',
  yljgzjxk_fgyz varchar(20) DEFAULT NULL COMMENT '�ֹ�Ժ��',
  yljgzjxk_pzdz varchar(500) DEFAULT NULL COMMENT '���Ƶ�ַ',
  yljgzjxk_pzfw varchar(500) DEFAULT NULL COMMENT '���÷�Χ',
  spjy_ybzsp char(1) DEFAULT NULL COMMENT 'ʳƷ��ӪԤ��װʳƷ��ϸ',
  spjy_szsp char(1) DEFAULT NULL COMMENT 'ʳƷ��ӪɢװʳƷ��ϸ',
  spjy_tssp varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����ʳƷ��ϸ',
  spjy_szss varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫɢװ��ʳ',
  spjy_zzyp varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ������Ʒ���',
  spjy_sxryp varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ��������Ʒ',
  spjy_bhdg varchar(20) DEFAULT NULL COMMENT 'ʳƷ��Ӫ�ѻ�����',
  spjy_qtsp varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����ʳƷ����',
  spjy_qtzs varchar(200) DEFAULT NULL COMMENT 'ʳƷ��Ӫ����ʳƷ����',
  spjy_rslnr varchar(200) DEFAULT NULL,
  spjy_lslnr varchar(200) DEFAULT NULL,
  spjy_sslnr varchar(200) DEFAULT NULL,
  spjy_gdlnr varchar(200) DEFAULT NULL,
  spjy_zzypnr varchar(200) DEFAULT NULL,
  zjlx varchar(10) DEFAULT NULL COMMENT '֤������ 01 ������ô��� 02 Ӫҵִ�պ� 03���֤',
  sfks char(1) DEFAULT 'N' COMMENT '�Ƿ�������� Y�� N��',
  xzqh varchar(10) DEFAULT NULL COMMENT '��������',
  sfxx varchar(10) DEFAULT NULL COMMENT '�Ƿ�ѧУ',
  yxkzbh varchar(500) DEFAULT '' COMMENT 'ԭ���֤��',
  sqtjdqx varchar(10) DEFAULT NULL COMMENT '�����ύ��������',
  sqtjdqs varchar(10) DEFAULT NULL COMMENT '�����ύ��������',
  yjsj varchar(10) DEFAULT '0' COMMENT '��������1 ����������0',
  yljgzjxk_zjsfzr varchar(50) DEFAULT NULL COMMENT 'ҽ�ƻ����Ƽ��Ƽ��Ҹ�����',
  zzywlx char(1) DEFAULT NULL COMMENT '����ҵ������ ��¼ҵ������ �°� 1  ��� 2  ����3 .������',
  DYZT char(1) DEFAULT '0' COMMENT '��ӡ״̬  0 Ĭ�ϣ�δ��ӡ�� 1 �Ѵ�ӡ 2������',
  SPXKZBGRQ date DEFAULT NULL,
  bz_zb int(5) DEFAULT 0 COMMENT '������ӡ״̬��0��δ��ӡ��1����ӡ���',
  bz_fb int(5) DEFAULT 0 COMMENT '������ӡ״̬��0��δ��ӡ��1����ӡ���',
  bz_mx int(5) DEFAULT 0 COMMENT '��ϸ��ӡ״̬��0��δ��ӡ��1����ӡ���',
  qy_location varchar(100) DEFAULT NULL COMMENT '��ҵλ��',
  xkzbh_xh varchar(10) DEFAULT NULL COMMENT '���֤��ŵ����-ȡ�����к�',
  spjy_sfdj char(1) DEFAULT '0' COMMENT 'ʳƷ��Ӫ�����Ƿ�Խ� 0 δ�Խ�  1 �ѶԽ� 2 ���δ����  3 ����δ����  4 ע��δ����',
  PRIMARY KEY (ID),
  INDEX idx_sfzx (XKZ_SFZX),
  INDEX index_comDm (COM_DM),
  INDEX index_commc (COM_MC),
  INDEX index_sqtjs (sqtjdqs),
  INDEX index_xh (xkzbh_xh),
  INDEX index_xklb (XKZ_XKLB),
  UNIQUE INDEX un_sqbh (SQ_SQBH),
  UNIQUE INDEX un_xkzbh (XKZBH)
)
ENGINE = INNODB
AUTO_INCREMENT = 272462
AVG_ROW_LENGTH = 1879
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'ͨ�����֤��';


---------------------------------------------------------------------------------

CREATE TABLE bs_daima (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  DM_DMLB varchar(40) DEFAULT NULL COMMENT '�������',
  DM_DMZ varchar(20) DEFAULT NULL COMMENT '����ֵ',
  DM_DMMC varchar(300) DEFAULT NULL COMMENT '��������',
  DM_KSRQ varchar(8) DEFAULT NULL COMMENT '��ʼ����',
  DM_ZZRQ varchar(8) DEFAULT NULL COMMENT '��ֹ����',
  DM_ID bigint(20) NOT NULL DEFAULT 0 COMMENT '������ϸ��ID',
  DM_QYFLAG varchar(1) DEFAULT '1' COMMENT '���ñ�־1����0δ����',
  DM_DMLBMC varchar(300) DEFAULT NULL COMMENT '�����������',
  DM_DMMCJX varchar(50) DEFAULT NULL COMMENT '�������Ƽ�д',
  DM_FJBC varchar(1) DEFAULT '0' COMMENT '�����ϴ�����ר��0���Ǳ��봫1���봫',
  DM_PR_DMZ varchar(20) DEFAULT NULL COMMENT '��������ֵ',
  duiyingzhi varchar(10) DEFAULT NULL COMMENT '��Ӧ������Ŀ�еĴ���ֵ',
  PRIMARY KEY (ID),
  UNIQUE INDEX idx_bs_daima (DM_DMLB, DM_DMZ),
  INDEX index_dm_bc (DM_FJBC),
  INDEX index_dm_dmlb (DM_DMLB),
  INDEX index_dm_dmz (DM_DMZ),
  INDEX INDEX_DM_FJBC (DM_FJBC),
  INDEX index_dm_id (DM_ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 3003
AVG_ROW_LENGTH = 165
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '������ϸ��';

INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(1096, 'XKZLB', '1', 'ʳƷ�������֤', NULL, NULL, 2137, '1', '���֤���', 'SPSC', '0', NULL, '3');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2424, 'XKZLB', '10', 'ҽ����е�������֤', NULL, NULL, 5243, '1', '���֤���', 'YLQXSC', '0', NULL, '7');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2819, 'XKZLB', '100', 'ҽ�ƻ����Ƽ����֤(δ����֤)', NULL, NULL, 5666, '1', '���֤���', 'YLQXSCW', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2469, 'XKZLB', '11', '����ҽ����е��Ӫ����ƾ֤', NULL, NULL, 5302, '1', '���֤���', 'YLQXJY', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2482, 'XKZLB', '12', 'ҽ�ƻ����Ƽ����֤', NULL, NULL, 5316, '1', '���֤���', 'YLJG', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2483, 'xkzlb', '13', 'ҽ�ƻ����Ƽ���׼�ĺ�', NULL, NULL, 5317, '1', '���֤���', 'YLJG', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2491, 'xkzlb', '14', 'GMP���֤��', NULL, NULL, 5325, '1', '���֤���', NULL, '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(1095, 'XKZLB', '2', 'ʳƷ��Ӫ���֤', NULL, NULL, 2136, '1', '���֤���', 'SPJY', '0', NULL, '4');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2492, 'xkzlb', '20', 'GSP��֤���', NULL, NULL, 5326, '1', '���֤���', NULL, '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(1094, 'XKZLB', '3', 'ҩƷ�������֤', NULL, NULL, 2135, '1', '���֤���', 'YPSC', '0', NULL, '5');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(1093, 'XKZLB', '4', 'ҽ����еע�����֤', NULL, NULL, 2134, '1', '���֤���', 'YLQXSC', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2181, 'XKZLB', '5', '����Ʒ�������֤', NULL, NULL, 4955, '1', '���֤���', 'BJPSC', '0', NULL, '11');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2270, 'XKZLB', '6', '��ױƷ�������֤', NULL, NULL, 5060, '1', '���֤���', 'HZP', '0', NULL, '9');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2291, 'XKZLB', '7', '��������Լ����֤', NULL, NULL, 5084, '1', '���֤���', 'YLQXSC', '0', NULL, NULL);
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2338, 'XKZLB', '8', 'ҩƷ��Ӫ���֤', NULL, NULL, 5139, '1', '���֤���', NULL, '0', NULL, '6');
INSERT INTO bs_daima(ID, DM_DMLB, DM_DMZ, DM_DMMC, DM_KSRQ, DM_ZZRQ, DM_ID, DM_QYFLAG, DM_DMLBMC, DM_DMMCJX, DM_FJBC, DM_PR_DMZ, duiyingzhi) VALUES
(2339, 'XKZLB', '9', 'ҽ����е��Ӫ���֤', NULL, NULL, 5140, '1', '���֤���', 'YLQXJY', '0', NULL, '8');
----------------------------------------------------------------------


CREATE TABLE bs_qylx (
  LX_ID bigint(20) NOT NULL DEFAULT 0,
  LX_MC varchar(200) DEFAULT NULL COMMENT '��ҵ��������',
  LX_DM varchar(40) DEFAULT NULL COMMENT '��ҵ���ʹ���',
  LX_FL varchar(20) DEFAULT NULL COMMENT '���ͷ��ࣺ�����¼�������ӦȨ�޵�����˵�',
  LX_DL varchar(20) DEFAULT NULL COMMENT '���������Ĵ��ࣺ��ʳƷ���� ʳƷ��Ӫ',
  comdalei varchar(40) DEFAULT NULL COMMENT '������Ŀ�ж�Ӧ����ҵ����',
  PRIMARY KEY (LX_ID)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 910
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '��ҵ����';


INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(1, '������ҵ--ʳƷ', 'SCSP', 'SC_SP', 'SPSC', '1');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(2, '������ҵ--ҩƷ', 'SCYP', 'SC_YP', 'YPSC', '2');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(3, '������ҵ--ҽ����е', 'SCQX', 'SC_YLQX', 'YLQXSC', '4');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(4, '������ҵ--��ױƷ', 'SCHZ', 'SC_HZP', 'HZP', '5');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(5, '��Ӫ��ҵ--ʳƷ����', 'JYSP', 'SPJY_PF', 'SPJY', '6');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(6, '��Ӫ��ҵ--ʳƷ����', 'JYSL', 'SPJY_LS', 'SPJY', '7');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(7, '��Ӫ��ҵ--ʳƷ����������', 'JYPL', 'SPJY_PFLS', 'SPJY', '7');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(8, '��Ӫ��ҵ--ҩƷ����', 'JYYP', 'YPJY_PF', 'YPJYPF', '8');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(9, '��Ӫ��ҵ--ҩƷ����', 'JYYL', 'YPJL_LS', 'YPJYLS', '9');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(10, '��Ӫ��ҵ--ҽ����е', 'JYQX', 'YLQXJY', 'YLQXJY', '11');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(11, '��Ӫ��ҵ--ҩƷ��������', 'JYLS', 'YLQXJY_LSLS', 'YPJYLS', '7');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(12, 'ҽ�ƻ���', 'YLJG', 'YLJG', 'YLJG', '18');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(13, '��Ӫ��ҵ--��������', 'JYCY', 'SPJY_CY', 'SPJY', '13');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(14, '������ҵ--ʳƷ��Ӽ�', 'SCTJ', 'SC_SPTJJ', 'SPSC', '1');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(15, '������ҵ--����Ʒ', 'SCBJ', 'SC_BJP', 'BJPSC', '3');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(16, '������ҵ--��������Լ�', 'SCTW', 'SC_TWZDSJ', 'YLQXSC', '2');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(17, 'ִҵҩʦ', 'ZYYS', 'ZYYS_PERSON', 'ZYYS', '');
INSERT INTO bs_qylx(LX_ID, LX_MC, LX_DM, LX_FL, LX_DL, comdalei) VALUES
(18, '����-������ҵ', 'YJSC', 'YJSC', 'YJSC', NULL);

---------------------------------------------------------------------------------------


CREATE DEFINER = 'root'@'%'
PROCEDURE syjzhptzmd3.prc_ת������������λ��b(
  in prm_orgid varchar(32),
  out prm_AppCode  int,
  out prm_ErrorMsg VARCHAR(500)
)
begin
label_pro:begin
  DECLARE done INT DEFAULT 0;     

  DECLARE v_count INT;
  DECLARE v_newcomid varchar(32);
  DECLARE v_newcomdm varchar(32);
  DECLARE v_newcomxkzid varchar(32);   
  DECLARE v_newcomdaleiid varchar(32);          
                       
  
  DECLARE v_COM_id varchar(200);
  DECLARE v_COM_dm varchar(200);
  DECLARE v_COM_MC varchar(200);
  DECLARE v_COM_ADDRESS varchar(200);
  DECLARE v_com_qylx varchar(200);
  DECLARE v_COM_FDDBR varchar(200);
  DECLARE v_COM_LXDH varchar(200);
  DECLARE v_COM_LXSJ varchar(200);
  DECLARE v_YYZZZCH varchar(200);
  DECLARE v_COM_CLRQ varchar(200);
  DECLARE v_ZJZSYXQQSRQ varchar(200);
  DECLARE v_COM_COUNTY_DM varchar(200);  
  DECLARE v_ZJZSYXQZZRQ varchar(200);
                         
              
      
  DECLARE v_xkz_xklb varchar(200);
  DECLARE v_XKZBH varchar(200);   
  DECLARE v_XKZ_FZRQ varchar(200);
  DECLARE v_XKZ_YXQZ varchar(200);  
  DECLARE v_JYXM varchar(200);
  DECLARE v_ZTXT varchar(200);  
  DECLARE v_YLQXXNJGJZC varchar(200);                                                                      
  
  declare cur_com cursor for  
  SELECT 
    a.COM_id,
    a.COM_DM,
    a.COM_MC,#  varchar(200);# NOT NULL COMMENT '��˾����',
    a.COM_ADDRESS,#  varchar(200);# DEFAULT NULL COMMENT '��˾��ַ',
    (SELECT t.comdalei from bs_qylx t where t.lx_id=a.com_qylx) as com_qylx,
    a.COM_FDDBR,
    a.COM_LXDH,
    a.COM_LXSJ,
    DATE_FORMAT(COM_CLRQ,'%Y-%m-%d') AS COM_CLRQ,
    CONCAT(a.COM_COUNTY_DM,'000000') AS COM_COUNTY_DM,
    a.YYZZZCH,
    DATE_FORMAT(a.ZJZSYXQQSRQ,'%Y-%m-%d') AS ZJZSYXQQSRQ,
    DATE_FORMAT(a.ZJZSYXQZZRQ,'%Y-%m-%d') AS ZJZSYXQZZRQ
  from bs_company a
  WHERE a.COM_COUNTY_DM IN ('411700','411701','411702','411703','411791') 
    AND doflag=0
    and not exists (select 1 from pcompany t where t.commc=a.com_mc);

  declare cur_tyxkz cursor for  
  SELECT 
    (SELECT t.duiyingzhi FROM bs_daima t WHERE t.dm_dmlb='XKZLB' AND t.dm_dmz=a.XKZ_XKLB) AS xkz_xklb,
    a.XKZBH,
    a.XKZ_FZRQ,
    a.XKZ_YXQZ,
    a.JYXM,
    a.ZTXT,
    a.YLQXXNJGJZC
  from bs_tyxkz  a
  WHERE a.COM_DM=v_COM_dm;


  #where bc.COM_CITY_DM LIKE '4117%';     
                                                      
  declare continue handler for not found set done=1;
  declare exit handler for sqlexception   #not found,sqlwarning,
  begin
    SELECT 'ERROR';
    set prm_AppCode=-1;
    set prm_ErrorMsg='���̳�����';
    rollback;
    #leave label_pro;
  end;
  set @@autocommit= 0;
  set prm_AppCode:=0;
  set prm_ErrorMsg:='�ɹ�';

  

  SET done=-1;
  open cur_com;
  mycomloop:loop
  fetch cur_com
  INTO
    v_COM_id,
    v_COM_dm, 
    v_COM_MC,
    v_COM_ADDRESS,
    v_com_qylx,
    v_COM_FDDBR,
    v_COM_LXDH,
    v_COM_LXSJ,
    v_COM_CLRQ,
    v_COM_COUNTY_DM,
    v_YYZZZCH,
    v_ZJZSYXQQSRQ,
    v_ZJZSYXQZZRQ;

    if done=1 then
      leave mycomloop;
    end if; 

    SELECT COUNT(1)    
    INTO v_count
    FROM pcompany 
    WHERE commc=v_COM_MC;

    IF v_count>0 THEN
      ITERATE  mycomloop;
    end IF;
    
    set v_newcomid =f_getSequenceStr();      
    set v_newcomdm= fun_��ȡcomdm();

    insert INTO pcompany(
        comid,
        comdm,
        commc,
        comdz,
        comdalei,
        comfrhyz,
        comgddh,
        comyddh,
        comclrq,
        aaa027,
        orgid,
        comjyjcbz,
        comfwnfww 
      )VALUES(
        v_newcomid,
        v_newcomdm,
        v_COM_MC,
        v_COM_ADDRESS,
        v_com_qylx,
        v_COM_FDDBR,
        v_COM_LXDH,
        v_COM_LXSJ,
        v_COM_CLRQ,
        v_COM_COUNTY_DM,
        prm_orgid,
        '0',
        '0'
      );

      set v_newcomdaleiid=f_getSequenceStr();

      INSERT INTO pcompanycomdalei(
          comdaleiid,
          comid,
          comdalei       
        )VALUES(
          v_newcomdaleiid,
          v_newcomid,
          v_com_qylx
        );

      #���Ӫҵִ�ղ�Ϊ�ղ���һ����ҵ���֤��Ϣ
      IF  length(trim(v_YYZZZCH))>0 THEN
        set v_newcomxkzid=f_getSequenceStr();
          
        INSERT INTO pcompanyxkz(
            comxkzid,# varchar(32) NOT NULL DEFAULT '0' COMMENT '��ҵ�����ϢID',
            comid,# varchar(32) NOT NULL DEFAULT '0' COMMENT '��ҵID',
            comxkzbh,# varchar(50) DEFAULT NULL COMMENT '���֤���',
            comxkyxqq,# date DEFAULT NULL COMMENT '�����Ч����',
            comxkfw,# varchar(4000) DEFAULT NULL COMMENT '��ɷ�Χ',
            comxkyxqz,# date DEFAULT NULL COMMENT '�����Ч��ֹ',
            comxkzlx,# varchar(32) DEFAULT NULL COMMENT '���֤����',
            comxkzzcxs,# varchar(50) DEFAULT NULL COMMENT '�����ʽ',
            comxkzztyt # varchar(200) DEFAULT NULL COMMENT '����ҵ̬',        
          )VALUES(
            v_newcomxkzid,
            v_newcomid,
            v_YYZZZCH,
            v_ZJZSYXQQSRQ,
            '',
            v_ZJZSYXQZZRQ,
            '1',
            '',
            ''
          );
      end IF;

      #7begin
      open cur_tyxkz;
      mylooptyxkz:loop
      fetch cur_tyxkz
      into 
         v_xkz_xklb,
         v_XKZBH, 
         v_XKZ_FZRQ,
         v_XKZ_YXQZ,  
         v_JYXM,
         v_ZTXT, 
         v_YLQXXNJGJZC;    
        
        if done=1 then
          leave mylooptyxkz;
        end if; 

        set v_newcomxkzid =f_getSequenceStr(); 
                           
        INSERT INTO pcompanyxkz(
          comxkzid,# varchar(32) NOT NULL DEFAULT '0' COMMENT '��ҵ�����ϢID',
          comid,# varchar(32) NOT NULL DEFAULT '0' COMMENT '��ҵID',
          comxkzbh,# varchar(50) DEFAULT NULL COMMENT '���֤���',
          comxkyxqq,# date DEFAULT NULL COMMENT '�����Ч����',
          comxkfw,# varchar(4000) DEFAULT NULL COMMENT '��ɷ�Χ',
          comxkyxqz,# date DEFAULT NULL COMMENT '�����Ч��ֹ',
          comxkzlx,# varchar(32) DEFAULT NULL COMMENT '���֤����',
          comxkzzcxs,# varchar(50) DEFAULT NULL COMMENT '�����ʽ',
          comxkzztyt # varchar(200) DEFAULT NULL COMMENT '����ҵ̬',               
        )VALUES(
          v_newcomxkzid,
          v_newcomid,
          v_XKZBH,
          v_XKZ_FZRQ,
          v_JYXM,
          v_XKZ_YXQZ,
          v_xkz_xklb,
          v_YLQXXNJGJZC,
          v_ZTXT 
        );
   
            
      end loop mylooptyxkz;
      close cur_tyxkz;    
      #7end  
   
    SET done=0;
                  
    UPDATE bs_company set doflag=1 WHERE com_id=v_com_id;
                                      
  end loop mycomloop;
  close cur_com;

  COMMIT;
       
end;
end


-------------------------------------------------------------------------------------





































