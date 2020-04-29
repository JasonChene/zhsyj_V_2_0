package com.zzhdsoft.siweb.entity;

import org.nutz.dao.entity.annotation.*;
import org.nutz.dao.DB;
import java.sql.Date;
import java.sql.Timestamp;
import java.math.BigDecimal;
/**
 * @Description  AA10 的中文含义是 代码类别明细
 * @Creation     2013/10/30 10:05:43
 * @Written      Create Tool By ZhengZhou HuaDong Software 
 **/
@Table(value = "AA10")
public class Aa10 {
	/**
	 * @Description aaa100的中文含义是： 代码类别
	 */
	@Column
	private String aaa100;

	/**
	 * @Description aaa102的中文含义是： 代码值
	 */
	@Column
	private String aaa102;

	/**
	 * @Description aaa103的中文含义是： 代码名称
	 */
	@Column
	private String aaa103;

	/**
	 * @Description aae030的中文含义是： 开始日期
	 */
	@Column
	private Integer aae030;

	/**
	 * @Description aae031的中文含义是： 终止日期
	 */
	@Column
	private Integer aae031;

	/**
	 * @Description aaz093的中文含义是： 代码ID
	 */
	@Column
	@Name
	//@Prev(@SQL(db=DB.MYSQL,value="select nextval('sq_aaz093')"))
	//@Prev(@SQL(db=DB.ORACLE,value="select sq_aaz093.nextval from dual"))
	private String aaz093;

	/**
	 * @Description aaz094的中文含义是： 代码类别ID
	 */
	@Column
	private String aaz094;

	/**
	 * @Description aaa104的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	@Column
	private String aaa104;

	/**
	 * @Description aaa101的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	@Column
	private String aaa101;
	
	/**
	 * @Description aaa105的中文含义是： 是否有效
	 */
	@Column
	private String aaa105;	
	
	/**
	 * @Description aaa106的中文含义是： 代码名称简称
	 */
	@Column
	private String aaa106;
	/**
	 * @Description aaa107的中文含义是： 参数代码级别
	 */
	@Column
	private String aaa107;
	/**
	 * @Description aae011的中文含义是：操作员
	 */
	@Column
	private String aae011;
	/**
	 * @Description aae036的中文含义是： 操作时间
	 */
	@Column
	private Timestamp aae036;
	/**
	 * @Description yxbz的中文含义是： 有效标志0无效1有效
	 */
	@Column
	private String yxbz;
	/**
	 * @Description paixu的中文含义是： 排序
	 */
	@Column
	private String paixu;

	
		/**
	 * @Description aaa100的中文含义是： 代码类别
	 */
	public void setAaa100(String aaa100){ 
		this.aaa100 = aaa100;
	}
	/**
	 * @Description aaa100的中文含义是： 代码类别
	 */
	public String getAaa100(){
		return aaa100;
	}
	/**
	 * @Description aaa102的中文含义是： 代码值
	 */
	public void setAaa102(String aaa102){ 
		this.aaa102 = aaa102;
	}
	/**
	 * @Description aaa102的中文含义是： 代码值
	 */
	public String getAaa102(){
		return aaa102;
	}
	/**
	 * @Description aaa103的中文含义是： 代码名称
	 */
	public void setAaa103(String aaa103){ 
		this.aaa103 = aaa103;
	}
	/**
	 * @Description aaa103的中文含义是： 代码名称
	 */
	public String getAaa103(){
		return aaa103;
	}
	/**
	 * @Description aae030的中文含义是： 开始日期
	 */
	public void setAae030(Integer aae030){ 
		this.aae030 = aae030;
	}
	/**
	 * @Description aae030的中文含义是： 开始日期
	 */
	public Integer getAae030(){
		return aae030;
	}
	/**
	 * @Description aae031的中文含义是： 终止日期
	 */
	public void setAae031(Integer aae031){ 
		this.aae031 = aae031;
	}
	/**
	 * @Description aae031的中文含义是： 终止日期
	 */
	public Integer getAae031(){
		return aae031;
	}
	/**
	 * @Description aaz093的中文含义是： 代码ID
	 */
	public void setAaz093(String aaz093){ 
		this.aaz093 = aaz093;
	}
	/**
	 * @Description aaz093的中文含义是： 代码ID
	 */
	public String getAaz093(){
		return aaz093;
	}
	/**
	 * @Description aaz094的中文含义是： 代码类别ID
	 */
	public void setAaz094(String aaz094){ 
		this.aaz094 = aaz094;
	}
	/**
	 * @Description aaz094的中文含义是： 代码类别ID
	 */
	public String getAaz094(){
		return aaz094;
	}
	/**
	 * @Description aaa104的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	public void setAaa104(String aaa104){ 
		this.aaa104 = aaa104;
	}
	/**
	 * @Description aaa104的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	public String getAaa104(){
		return aaa104;
	}
	/**
	 * @Description aaa101的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	public void setAaa101(String aaa101){ 
		this.aaa101 = aaa101;
	}
	/**
	 * @Description aaa101的中文含义是： 暂时为了查询数据方便添加的,日后删除!
	 */
	public String getAaa101(){
		return aaa101;
	}
	public String getAaa106() {
		return aaa106;
	}
	public void setAaa106(String aaa106) {
		this.aaa106 = aaa106;
	}
	public String getAaa107() {
		return aaa107;
	}
	public void setAaa107(String aaa107) {
		this.aaa107 = aaa107;
	}
	public String getAae011() {
		return aae011;
	}
	public void setAae011(String aae011) {
		this.aae011 = aae011;
	}
	public Timestamp getAae036() {
		return aae036;
	}
	public void setAae036(Timestamp aae036) {
		this.aae036 = aae036;
	}
	public String getAaa105() {
		return aaa105;
	}
	public void setAaa105(String aaa105) {
		this.aaa105 = aaa105;
	}

	public String getYxbz() {
		return yxbz;
	}

	public void setYxbz(String yxbz) {
		this.yxbz = yxbz;
	}

	public String getPaixu() {
		return paixu;
	}

	public void setPaixu(String paixu) {
		this.paixu = paixu;
	}
}