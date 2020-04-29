package com.askj.jyjc.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

import java.sql.Date;
import java.sql.Timestamp;

@Table(value = "Hjyjcmxb")
public class Hjyjcmxb {
/** 检验检测明细表; InnoDB free: 31744 kB  */
	/** hjyjcmxbid 的中文含义是：检验检测明细表id*/
	@Name
	@Column
	private String hjyjcmxbid;

	/** hjyjczbid 的中文含义是：检验检测主表id*/
	@Column
	private String hjyjczbid;

	/** jcxmid 的中文含义是：检测项目id(仪器导入用)*/
	@Column
	private String jcxmid;

	/** jcxmmc 的中文含义是：检测项目名称(仪器导入用)*/
	@Column
	private String jcxmmc;

	/** jcz 的中文含义是：检测值(仪器导入用)*/
	@Column
	private String jcz;

	/** szdw 的中文含义是：数值单位(仪器导入用)*/
	@Column
	private String szdw;

	/** jyjcjl 的中文含义是：检验检测结论aaa100=jyjcjl(仪器导入用-结果判定)*/
	@Column
	private String jyjcjl;

	/** xlbz 的中文含义是：限量标准,执行标准号(仪器导入用)*/
	@Column
	private String xlbz;

	/** bzz 的中文含义是：标准值(仪器导入用-标准值，限量值)*/
	@Column
	private String bzz;

	/** jcff 的中文含义是：检测方法*/
	@Column
	private String jcff;

	/** cydjid 的中文含义是：抽样登记ID（抽样报告用）*/
	@Column
	private String cydjid;

	/** yjqk 的中文含义是：移交情况*/
	@Column
	private String yjqk;

	/** aae011 的中文含义是：经办人*/
	@Column
	private String aae011;

	/** aae036 的中文含义是：经办时间*/
	@Column
	private String aae036;


	public void setHjyjcmxbid(String hjyjcmxbid){
		this.hjyjcmxbid=hjyjcmxbid;
	}

	public String getHjyjcmxbid(){
		return hjyjcmxbid;
	}

	public void setHjyjczbid(String hjyjczbid){
		this.hjyjczbid=hjyjczbid;
	}

	public String getHjyjczbid(){
		return hjyjczbid;
	}

	public void setJcxmid(String jcxmid){
		this.jcxmid=jcxmid;
	}

	public String getJcxmid(){
		return jcxmid;
	}

	public void setJcxmmc(String jcxmmc){
		this.jcxmmc=jcxmmc;
	}

	public String getJcxmmc(){
		return jcxmmc;
	}

	public void setJcz(String jcz){
		this.jcz=jcz;
	}

	public String getJcz(){
		return jcz;
	}

	public void setSzdw(String szdw){
		this.szdw=szdw;
	}

	public String getSzdw(){
		return szdw;
	}

	public void setJyjcjl(String jyjcjl){
		this.jyjcjl=jyjcjl;
	}

	public String getJyjcjl(){
		return jyjcjl;
	}

	public void setXlbz(String xlbz){
		this.xlbz=xlbz;
	}

	public String getXlbz(){
		return xlbz;
	}

	public void setBzz(String bzz){
		this.bzz=bzz;
	}

	public String getBzz(){
		return bzz;
	}

	public void setJcff(String jcff){
		this.jcff=jcff;
	}

	public String getJcff(){
		return jcff;
	}

	public void setCydjid(String cydjid){
		this.cydjid=cydjid;
	}

	public String getCydjid(){
		return cydjid;
	}

	public void setYjqk(String yjqk){
		this.yjqk=yjqk;
	}

	public String getYjqk(){
		return yjqk;
	}

	public void setAae011(String aae011){
		this.aae011=aae011;
	}

	public String getAae011(){
		return aae011;
	}

	public void setAae036(String aae036){
		this.aae036=aae036;
	}

	public String getAae036(){
		return aae036;
	}

}
