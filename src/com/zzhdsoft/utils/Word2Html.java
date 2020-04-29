package com.zzhdsoft.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.w3c.dom.Document;

/**
 * poi����wordתhtml(���ͼƬ����ʽ)  
 * @author xml
 *
 */
public class Word2Html {
	//������ִ���Exception in thread "main" java.lang.NoSuchMethodError: org.apache.poi.poifs.filesystem.POIFSFileSystem.getRoot()Lorg/apache/poi/poifs/filesystem/DirectoryNode;
	//�뽫JAR���е�poi-3.0.1-FINAL-20070705.jar������poi-3.8�İ����棬�������poi-3.2-FINAL-20081019.jarΪ׼�����ϲ���pio-3.7.jar��
	//����ֱ�ӽ���poi�İ��Ƶ�������
	public static void main(String[] argv) {
		try {
			//System.out.println(convert2Html("D:\\�µ�������������\\2 ����������.doc","D:\\�µ�������������\\2 ����������.html"));
			System.out.println(convert2Html("E:\\�µ�������������\\3 ����������.doc","E:\\�µ�������������\\3 ����������.html"));
			System.out.println(convert2Html("E:\\�µ�������������\\4 ���ӷ��ﰸ������������.doc","E:\\�µ�������������\\4 ���ӷ��ﰸ������������.html"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * ��WORDת����HTML
	 * @param fileName
	 * @param outPutFile
	 * @return
	 */
	public static boolean convert2Html(String wordFilePath, String htmlSavePath){
		boolean convertFlag=false; 
		try {
			String saveDir=wordFilePath.substring(0,wordFilePath.lastIndexOf(SeparatorUtil.getFileSeparator())+1);
			HWPFDocument wordDocument = new HWPFDocument(new FileInputStream(wordFilePath));//WordToHtmlUtils.loadDoc(new FileInputStream(inputFile));  
			WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());  
			wordToHtmlConverter.setPicturesManager(new PicturesManager() {
				public String savePicture(byte[] content, PictureType pictureType,
						String suggestedName, float widthInches, float heightInches) {
					//html ��  ͼƬ��ǩ�� ��ʾ��ͼƬ··��  <img src="d:/test/0.jpg"/>  
					return suggestedName;//"test/" + suggestedName;
				}
			});
			wordToHtmlConverter.processDocument(wordDocument);
			//����WORD�е�ͼƬ
			List pics = wordDocument.getPicturesTable().getAllPictures();
			if (pics != null) {
				for (int i = 0; i < pics.size(); i++) {
					Picture pic = (Picture) pics.get(i);
					try {
						//word��ͼƬ�Ĵ洢·��
						pic.writeImageContent(new FileOutputStream(saveDir+ pic.suggestFullFileName()));
					} catch (FileNotFoundException e) {
						e.printStackTrace();
					}
				}
			}
			Document htmlDocument = wordToHtmlConverter.getDocument();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			DOMSource domSource = new DOMSource(htmlDocument);
			StreamResult streamResult = new StreamResult(out);

			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer serializer = tf.newTransformer();
			serializer.setOutputProperty("encoding", "GB2312");//һ��Ҫ�ĳɡ�GB2312��
			serializer.setOutputProperty("indent", "yes");
			serializer.setOutputProperty("method", "html");
			serializer.transform(domSource, streamResult);
			out.close();
			writeFile(new String(out.toByteArray()), htmlSavePath);
			
			convertFlag=true;
		} catch (Exception e) {
			e.printStackTrace();
			convertFlag=false;
		} 
		return convertFlag;
	}
	
	/**
	 * ������д���ļ�
	 * @param content
	 * @param saveFilePath
	 */
	public static void writeFile(String content, String saveFilePath) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		try {
			File file = new File(saveFilePath);
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, "GB2312"));//һ��Ҫ�ĳɡ�GB2312��
			bw.write(content);
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
			try {
				if (bw != null) {
					bw.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException localIOException1) {
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
			try {
				if (bw != null) {
					bw.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException localIOException2) {
			}
		} finally {
			try {
				if (bw != null) {
					bw.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException localIOException3) {
			}
		}
	}

	
}
