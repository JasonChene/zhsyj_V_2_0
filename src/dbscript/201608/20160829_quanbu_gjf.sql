/*פ���Ȩ�޿��ƸĶ���Ҫ��Ŀǰϵͳ��100�����Ա��Ȩ�ޣ�̫�鷳������д�����̣���������*/
CREATE DEFINER = 'root'@'%'
PROCEDURE syjzhpt.prc_����ĳ�˳�ʼ��Ȩ��(
  prm_userid  varchar(32),
  out prm_AppCode  int,
  out prm_ErrorMsg VARCHAR(500)
)
begin
label_pro:begin
  DECLARE done INT DEFAULT 0;                                                                     
  declare v_userid varchar(50);          

  declare cur1 cursor for  
  SELECT userid
  from sysuser s
  WHERE s.USERKIND IN ('0','1') AND s.USERID<>prm_userid;  
                                              
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
  open cur1;
  myloop1:loop
  fetch cur1
  into 
   v_userid;

    if done=1 then
      leave myloop1;
    end if; 
   
    DELETE sysuseraae FROM sysuseraae WHERE userid=v_userid;
    insert INTO sysuseraae(sysuseraaeid,userid,aae140) SELECT f_getSequenceStr(),v_userid,aae140 
    FROM sysuseraae s WHERE s.userid=prm_userid;

    DELETE sysuserarea FROM sysuserarea WHERE userid=v_userid;
    insert INTO sysuserarea(sysuserareaid,userid,aaa027) SELECT f_getSequenceStr(),v_userid,aaa027 
    FROM sysuserarea s WHERE s.userid=prm_userid;

    DELETE sysuserorg FROM sysuserorg WHERE userid=v_userid;
    insert INTO sysuserorg(sysuserorgid,userid,orgid) SELECT f_getSequenceStr(),v_userid,orgid 
    FROM sysuserorg s WHERE s.userid=prm_userid;
     
            COMMIT; 
  end loop myloop1;
  close cur1;

  COMMIT;
       
end;
end
