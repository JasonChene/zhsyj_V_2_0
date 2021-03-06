package com.askj.exam;

import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Modules;


/**
 * 
 * ExamMainModule的中文名称：【考试系统】主模块 
 *
 * ExamMainModule的描述：
 *
 * @author ：zjf 
 * @version ：V1.0
 */
@Modules(scanPackage = true)
@Fail("jsp:/jsp/error/500.jsp")
@Encoding(input = "UTF-8", output = "UTF-8")
public class ExamMainModule {

}