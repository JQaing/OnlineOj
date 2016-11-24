<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/codemirror/addon/hint/java-hint.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/codemirror/mode/clike/clike.js"></script>
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
	<div class="contain">
		<div class="coding">
			<textarea name="code" id="code"></textarea>
			<div class="sub">
				<select onchange="changeTheme(this)">
					<option value="lesser-dark">Dark</option>
					<option value="eclipse">GTK</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select onclick="changeLanguage(this)">
					<option value="java">Java</option>
					<option value="jhc">JavaScript</option>
					<option value="jhc">HTML</option>
					<option value="jhc">CSS</option>
				</select>
				<input type="submit" value="Run" id="sub" onclick="submit()"/>
			</div>
		</div>
		<div class="mes">
			<div class="conlog">
				<font color="#599eff" >ConsoleMessge</font>
			</div>
			<textarea id="message"></textarea>
		</div>
	</div>
</body>
</html>
<script>
var editor;
var message;
//默认值
var value = '//请勿删除头文件，否则编译失败' + '\n'
		+ 'import java.util.*;' + '\n'
		+ 'import java.lang.*;' + '\n'
		+ 'import java.io.*;'	+ '\n\n'
		+ '//请勿更改类名，否则编译失败' + '\n'
		+ 'public class online' + '\n'
		+ '{' + '\n'
		+ '	public static void main(String[] args) throws Exception' + '\n'
		+ '	{' + '\n'
		+ '		//在主函数内编写代码\n'
		+ '\n' + '	}'
		+ '\n' + '}';
		
$(function() {
	var myTextarea = document.getElementById('code');
	editor = CodeMirror.fromTextArea(myTextarea, {
		//光标高度
		cursorHeight: 0.8,
	  	mode: 'text/x-java',
	  	smartIndent: true,		//自动缩进
	  	theme:'lesser-dark', 	//主题
        lineNumbers: true,		//显示行号
        autoCloseBrackets: true,	//括号匹配
        keymap:'sublime',	 //快捷键风格和sulimeyiyang
        extraKeys: {"Alt-/": "autocomplete"},  //快捷键关键字提示
	});
	editor.setSize('650px','600px');
	editor.setValue(value);
	editor.on('change', submit);

});

$(function() {
	var myTextarea = document.getElementById('message');
	message = CodeMirror.fromTextArea(myTextarea, {
		cursorHeight: 0.85,
	  	mode: 'text/x-java',
	  	theme:'lesser-dark', 
	  	readOnly: true,
	  	lineWrapping: true,
        smartIndent: true,
	});
	message.setSize('500px','600px');
	message.setValue("");
});

function changeTheme(obj)
{
	
	editor.setOption('theme', obj.value);
	message.setOption('theme', obj.value);
	if(obj.value == 'eclipse')
	{
		$('.sub').css('background', '#d6d5d4');
		$('.conlog').css('background', '#d6d5d4');
	}
	else
	{
		$('.sub').css('background', '#45443B');
		$('.conlog').css('background', '#45443B');
	}
	
}
function submit()
{
	var param = {
		code:editor.getValue()
	}
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath() %>/complierServlet',
		data:param,
		success: function(data) {
			message.setValue(data);
		},
		error: function() {
			alert("服务器错误，请重新编译");
		}
	});
}
function changeLanguage(obj)
{
	if(obj.value == 'java')
		window.location.href = '<%=request.getContextPath() %>/index.jsp';
	if(obj.value == 'jhc')
		window.location.href = '<%=request.getContextPath() %>/JsHtml/jhc.jsp';
}
</script>