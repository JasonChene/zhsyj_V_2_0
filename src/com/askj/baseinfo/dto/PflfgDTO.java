package com.askj.baseinfo.dto;

import org.nutz.dao.entity.annotation.*;
import org.nutz.dao.DB;
import java.sql.Date;
import java.sql.Timestamp;
import java.math.BigDecimal;

/**
 * @Description  PFLFG的中文含义是: 法律法规; InnoDB free: 2760704 kBDTO
 * @Creation     2016/04/12 09:40:16
 * @Written      Create Tool By zjf 
 **/
public class PflfgDTO {
	/**
	 * @Description flfgid的中文含义是： 
	 */
	private String flfgid;

	/**
	 * @Description flfgbh的中文含义是： 法律法规编号
	 */
	private String flfgbh;

	/**
	 * @Description flfglx的中文含义是： 法律法规类型见aa10表aaa100=FLFGLX
	 */
	private String flfglx;

	/**
	 * @Description flfgnr的中文含义是： 法律法规内容
	 */
	private String flfgnr;

	/**
	 * @Description flfgczy的中文含义是： 操作员
	 */
	private String flfgczy;

	/**
	 * @Description flfgczsj的中文含义是： 操作时间
	 */
	private String flfgczsj;

	/**
	 * @Description flfgdlbm的中文含义是： 法律法规大类编码见代码表pflfglb
	 */
	private String flfgdlbm;

	/**
	 * @Description flfgxlbm的中文含义是： 法律法规小类编码 见代码表pflfglb
	 */
	private String flfgxlbm;

	/**
	 * @Description flfgmc的中文含义是： 法律法规名称
	 */
	private String flfgmc;

	/**
	 * @Description flfgfbjg的中文含义是： 法律法规发布机构
	 */
	private String flfgfbjg;

	/**
	 * @Description flfgfbkssj的中文含义是： 法律法规发布开始时间
	 */
	private String flfgfbkssj;

	/**
	 * @Description flfgfbjssj的中文含义是： 法律法规发布结束时间
	 */
	private String flfgfbjssj;

	
		/**
	 * @Description flfgid的中文含义是： 
	 */
	public void setFlfgid(String flfgid){ 
		this.flfgid = flfgid;
	}
	/**
	 * @Description flfgid的中文含义是： 
	 */
	public String getFlfgid(){
		return flfgid;
	}
	/**
	 * @Description flfgbh的中文含义是： 法律法规编号
	 */
	public void setFlfgbh(String flfgbh){ 
		this.flfgbh = flfgbh;
	}
	/**
	 * @Description flfgbh的中文含义是： 法律法规编号
	 */
	public String getFlfgbh(){
		return flfgbh;
	}
	/**
	 * @Description flfglx的中文含义是： 法律法规类型见aa10表aaa100=FLFGLX
	 */
	public void setFlfglx(String flfglx){ 
		this.flfglx = flfglx;
	}
	/**
	 * @Description flfglx的中文含义是： 法律法规类型见aa10表aaa100=FLFGLX
	 */
	public String getFlfglx(){
		return flfglx;
	}
	/**
	 * @Description flfgnr的中文含义是： 法律法规内容
	 */
	public void setFlfgnr(String flfgnr){ 
		this.flfgnr = flfgnr;
	}
	/**
	 * @Description flfgnr的中文含义是： 法律法规内容
	 */
	public String getFlfgnr(){
		return flfgnr;
	}
	/**
	 * @Description flfgczy的中文含义是： 操作员
	 */
	public void setFlfgczy(String flfgczy){ 
		this.flfgczy = flfgczy;
	}
	/**
	 * @Description flfgczy的中文含义是： 操作员
	 */
	public String getFlfgczy(){
		return flfgczy;
	}
	/**
	 * @Description flfgczsj的中文含义是： 操作时间
	 */
	public void setFlfgczsj(String flfgczsj){ 
		this.flfgczsj = flfgczsj;
	}
	/**
	 * @Description flfgczsj的中文含义是： 操作时间
	 */
	public String getFlfgczsj(){
		return flfgczsj;
	}
	/**
	 * @Description flfgdlbm的中文含义是： 法律法规大类编码见代码表pflfglb
	 */
	public void setFlfgdlbm(String flfgdlbm){ 
		this.flfgdlbm = flfgdlbm;
	}
	/**
	 * @Description flfgdlbm的中文含义是： 法律法规大类编码见代码表pflfglb
	 */
	public String getFlfgdlbm(){
		return flfgdlbm;
	}
	/**
	 * @Description flfgxlbm的中文含义是： 法律法规小类编码 见代码表pflfglb
	 */
	public void setFlfgxlbm(String flfgxlbm){ 
		this.flfgxlbm = flfgxlbm;
	}
	/**
	 * @Description flfgxlbm的中文含义是： 法律法规小类编码 见代码表pflfglb
	 */
	public String getFlfgxlbm(){
		return flfgxlbm;
	}
	/**
	 * @Description flfgmc的中文含义是： 法律法规名称
	 */
	public void setFlfgmc(String flfgmc){ 
		this.flfgmc = flfgmc;
	}
	/**
	 * @Description flfgmc的中文含义是： 法律法规名称
	 */
	public String getFlfgmc(){
		return flfgmc;
	}
	/**
	 * @Description flfgfbjg的中文含义是： 法律法规发布机构
	 */
	public void setFlfgfbjg(String flfgfbjg){ 
		this.flfgfbjg = flfgfbjg;
	}
	/**
	 * @Description flfgfbjg的中文含义是： 法律法规发布机构
	 */
	public String getFlfgfbjg(){
		return flfgfbjg;
	}
	/**
	 * @Description flfgfbkssj的中文含义是： 法律法规发布开始时间
	 */
	public void setFlfgfbkssj(String flfgfbkssj){ 
		this.flfgfbkssj = flfgfbkssj;
	}
	/**
	 * @Description flfgfbkssj的中文含义是： 法律法规发布开始时间
	 */
	public String getFlfgfbkssj(){
		return flfgfbkssj;
	}
	/**
	 * @Description flfgfbjssj的中文含义是： 法律法规发布结束时间
	 */
	public void setFlfgfbjssj(String flfgfbjssj){ 
		this.flfgfbjssj = flfgfbjssj;
	}
	/**
	 * @Description flfgfbjssj的中文含义是： 法律法规发布结束时间
	 */
	public String getFlfgfbjssj(){
		return flfgfbjssj;
	}

	
}