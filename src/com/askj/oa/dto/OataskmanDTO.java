package com.askj.oa.dto;

import org.nutz.dao.entity.annotation.Column;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * @Description Oataskrman的中文含义是: oa任务关联人表; InnoDB free: 31744 kB
 * @Creation 2018/05/18 11:35:29
 * @Written Create Tool By syh
 **/
public class OataskmanDTO {

    /*******************************扩展字段开始*************************************/
    private String zxrstr;
    private String csrstr;
    private String taskcontent;


    public String getTaskcontent() {
        return taskcontent;
    }

    public void setTaskcontent(String taskcontent) {
        this.taskcontent = taskcontent;
    }

    public String getZxrstr() {
        return zxrstr;
    }

    public void setZxrstr(String zxrstr) {
        this.zxrstr = zxrstr;
    }

    public String getCsrstr() {
        return csrstr;
    }

    public void setCsrstr(String csrstr) {
        this.csrstr = csrstr;
    }
/**********************************扩展字段结束*********************************************/
    /**
     * oataskmanid 的中文含义是：oa任务关联人表id
     */
    private String oataskmanid;

    /**
     * oataskid 的中文含义是：oa任务表id
     */
    private String oataskid;

    /**
     * taskrmantype 的中文含义是：事项关联人类型aaa100=taskrmantype，0执行人1抄送人
     */
    private String taskmantype;

    /**
     * userid 的中文含义是：人员id
     */
    private String userid;

    /**
     * havereadflag 的中文含义是：已读标志aaa100=shifoubz
     */
    private String havereadflag;

    /**
     * receivedflag 的中文含义是：确认收到标志aaa100=shifoubz
     */
    private String receivedflag;

    /**
     * completestate 的中文含义是：完成状态aaa100=completestate，0未1已2不能
     */
    private String completestate;

    /**
     * cannotreason 的中文含义是：不能完成原因
     */
    private String cannotreason;

    /**
     * aae011 的中文含义是：操作员
     */
    private String aae011;

    /**
     * aae036 的中文含义是：操作时间
     */
    private String aae036;

    /**
     * tasktransferflag 的中文含义是：任务转交标志aaa100=shifoubz
     */
    private String tasktransferflag;

    /**
     * remark 的中文含义是：备注
     */
    private String remark;

    public void setOataskmanid(String oataskmanid) {
        this.oataskmanid = oataskmanid;
    }

    public String getOataskmanid() {
        return oataskmanid;
    }

    public void setOataskid(String oataskid) {
        this.oataskid = oataskid;
    }

    public String getOataskid() {
        return oataskid;
    }

    public void setTaskmantype(String taskrmantype) {
        this.taskmantype = taskrmantype;
    }

    public String getTaskmantype() {
        return taskmantype;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setHavereadflag(String havereadflag) {
        this.havereadflag = havereadflag;
    }

    public String getHavereadflag() {
        return havereadflag;
    }

    public void setReceivedflag(String receivedflag) {
        this.receivedflag = receivedflag;
    }

    public String getReceivedflag() {
        return receivedflag;
    }

    public void setCompletestate(String completestate) {
        this.completestate = completestate;
    }

    public String getCompletestate() {
        return completestate;
    }

    public void setCannotreason(String cannotreason) {
        this.cannotreason = cannotreason;
    }

    public String getCannotreason() {
        return cannotreason;
    }

    public void setAae011(String aae011) {
        this.aae011 = aae011;
    }

    public String getAae011() {
        return aae011;
    }

    public void setAae036(String aae036) {
        this.aae036 = aae036;
    }

    public String getAae036() {
        return aae036;
    }

    public void setTasktransferflag(String tasktransferflag) {
        this.tasktransferflag = tasktransferflag;
    }

    public String getTasktransferflag() {
        return tasktransferflag;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

