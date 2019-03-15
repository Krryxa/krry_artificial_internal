package com.tz.chat;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.Buffer;

/**
 * JIMI
 * @author krry
 * @version v1.0
 *
 */
public class chat_v1 {
	
	/**
	 * 对话智能客服获取答案
	 * @param message 用户输入的信息
	 * @return 智能客服回复
	 */
	public static String getResult(String message){
		//设置请求编码格式utf-8
		StringBuffer buffer = new StringBuffer();
		try {
			String question = URLEncoder.encode(message,"utf-8");
			//请求url 对接图灵机器人的接口
			String requesUrl = "http://www.tuling123.com/openapi/api?"+"key=4901085617de00d1cc9a41382e3b2c57&info="+question;
			//建立网络连接
			URL urlObj = new URL(requesUrl);
			//获取连接对象
			URLConnection connection = urlObj.openConnection();
			//直接连接
			connection.connect();
			//获取请求的结果
			InputStreamReader reader = new InputStreamReader(connection.getInputStream(),"utf-8");
			//建立缓冲流
			BufferedReader br = new BufferedReader(reader);
			
			String temp = null;
			while((temp = br.readLine()) != null){
				buffer.append(temp);
			}
			//关闭流
			reader.close();
			br.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return buffer.toString();
	}
	
     // java入口
	public static void main(String[] args) {
		System.out.println("亲爱的你，晚上好！");
		
		// 调用图灵机器人大数据类库
		
		
		
		// 建立文件缓冲流
		
		// 返回页面

	}

}
