<%@ page language="java" import="com.tz.chat.chat_v1"  pageEncoding="utf-8"%>
<%
      request.setCharacterEncoding("utf-8");
      String info = request.getParameter("info");
      String answer = chat_v1.getResult(info);
      
      out.print(answer);


 %>