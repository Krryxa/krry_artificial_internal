<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!doctype>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html;charset = utf-8"/>
  <title> Java开发智能机器人IM聊天系统 --krry </title>
  <meta name="Keywords" content="关键词,关键词">
  <meta name="Description" content="">
  <style type="text/css">
	 *{margin:0;padding:0;}
	 body{background:url("images/22.jpg");background-size:cover;font-size:12px;font-family:"微软雅黑";color:#666;}
	 img{vertical-align:middle;}
	 .clear{clear:both;}

	 /*chat start*/
	 .chat{width:900px;height:532px;background:#FF6600;margin:100px auto;}
	 .chat .c_top{height:68px;background:#6699FF;font-size:20px;line-height:68px;color:#FFF;padding-left:15px;cursor:move;}
	 .chat .c_con{height:380px;background:#F0F0F0;overflow:auto;position:relative;}
	 .chat .c_con .c_item{width:870px;}
	 .chat .c_con span{line-height:20px;}
	 .chat .c_con .c_left{padding:10px 10px 10px 10px;}
	 .chat .c_con .c_left img{position:absolute;}
	 .chat .c_con .c_left span{display:block;margin-left:62px;}
	 .chat .c_con .c_right{padding:10px 10px 10px 10px;text-align:right;margin-right:30px;min-height:50px;}
	 .chat .c_con .c_right .c_name{float:right;width:50px;height:50px;display:inline-block;background:#FF6600;border-radius:25px;line-height:50px;text-align:center;color:#FFFFFF;}
	 .chat .c_con .c_right .c_text{padding-right:60px;display:block;margin-top:15px;}
	 .chat .c_message{height:84px;background:rgb(255, 255, 255);}
	 .chat .c_message .c_edit{overflow:auto;font-size:14px;height:60px;background:#FFFFFF;float:left;width:776px;outline:none;padding:12px;line-height:18px;}
	 .chat .c_message .c_btn .c_sub:hover{transition:.6s;background:#F97C00;}  /*鼠标放置位置时的变色*/
	 .chat .c_message .c_btn .c_sub{width:100px;height:84px;float:right;cursor:pointer;border:none;background:#00A7F7;outline:none;color:#FFFFFF;font-size:16px;font-weight:bold;font-family:"幼圆";border-radius:10px;transition:.6s;}
	 /*end chat*/
	 
	 ::-webkit-scroLLbar{width:5px;height:6px;background: #ccc;}
	 ::-webkit-scroLLbar-button{background-color:#e5e5e5;}
	 ::-webkit-scroLLbar-track{background: #999;}
	 ::-webkit-scroLLbar-track-piece{background: #ccc;}
	 ::-webkit-scroLLbar-thumb{background: #666;}
	 ::-webkit-scroLLbar-corner{background: #82AFFF;}
	 ::-webkit-scroLLbar-resizer{background: #FF0BEE;}
	 scrollbar{-moz-appearance:none !important;background: rgb(0,255,0) !important;}
	 scrollbarbutton{-moz-appearance:none !important;background-color:rgb(0,0,255) !important;}
	 scrollbarbutton:hover{-moz-appearance:none !important;background-color:rgb(255,0,0) !important;}

  
  
  </style>
 </head>

 <body>
     <!--chat start-->
    <div class="chat">
	<div class="c_top">JIMI智能Krry机器人 -v1.0</div>
	<div class="c_con" id="boxx">
	    <div class="c_item c_left">
			<img src="images/120.png" alt="JIMI智能客服" width="50" height="50"/>&nbsp;&nbsp;&nbsp;<span>简要说明这个智能客服的用处在于你无聊的时候可以打发时间</span><div class='clear'></div>
		    </div>
		</div>
	  <div class="c_message">
	      <div class="c_edit" contenteditable="true" id="message"></div>
		  <div class="c_btn">
		      <input type="button" class="c_sub" id="c_sub_btn" value="发送消息" disabled="true"/>
		  </div>
	  </div>
	</div>
	<!--end chat-->
	
	<!-- 引入jQuery官方类库-->
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	    $(function(){
			var top = 0;
			//监听键盘按下去的事件
			$("#message").keyup(function(event){
				if($("#message").text()){ //如果有输入内容,则设置按钮可用
					$("#c_sub_btn").attr("disabled",false);
					if(event.keyCode == 13){
						$("#c_sub_btn").trigger("click");
					}
				}else{  //否则不可用
					$("#c_sub_btn").attr("disabled",true);
				}
			});
			var boxx = document.getElementById("boxx");
	        $("#c_sub_btn").click(function(){
	           var value = $("#message").text();
			   $("#message").text("");
			   $("#c_sub_btn").attr("disabled",true);
			   boxx.scrollTop = boxx.scrollHeight;
			   $(".c_con").append("<div class='c_item c_right'><span class='c_name'>Krry</span>"+
							 "<span class='c_text'>"+value+"</span>"+
							  "</div>");
				top += $(".c_right:last").height()+20; //每次累加最后一个记录的高度
				$(".c_con").scrollTop(top);  //自动拉下滚动条
			   $.ajax({
					  type:"post",  //请求类型
					  url:"data.jsp",
					  data:{info:value},
					  success:function(data){
						   var json = JSON.parse(data);
						   $(".c_con").append("<div class='c_item c_left'>"+
	"<img src='images/120.png' alt='JIMI智能客服' width='50' height='50'/>&nbsp;&nbsp;&nbsp;<span>"+json.text+"</span><div class='clear'></div></div>");
					  }
			   });
	     	});
	    });
	    
	    
	    
	      </script>
	
	
 </body>
</html>
