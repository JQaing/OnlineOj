<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<%@ include file="/WEB-INF/common/common-jhc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="contain">
		<div class="coding">
		  <form action="<%=request.getContextPath() %>/ScriptHtmlCssServlet" method="post">
			<textarea name="code" id="code"></textarea>
			<div class="sub">
				<select onchange="changeTheme(this)">
					<option value="lesser-dark">Dark</option>
					<option value="eclipse" >GTK</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select onclick="changeLanguage(this)">
					<option value="java">Java</option>
					<option value="jhc">JavaScript</option>
					<option value="jhc">HTML</option>
					<option value="jhc">CSS</option>
				</select>
				<input type="submit" value="Run" id="sub"/>
			</div>
			</form>
		</div>
		
		<div class="mes">
			<div class="conlog">
				<font color="#599eff" >ConsoleMessge</font>
			</div>
			<iframe src="<%=request.getContextPath() %>/JsHtml/ifram.jsp" class="iframe" id="iframe"></iframe>
		</div>
	</div>
</body>
</html>
<script>
var editor;
var defaultText = '<!DOCTYPE html>' + '\n' +
				 '<html>\n<head>\n' + 
				 '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n' +
				 '<title>Insert title here</title>\n' + 
				 '</head>\n' + '	<body>\n' + '		<!-- 在此写html代码 -->\n\n' + '	</body>\n' + 
				 '</html>\n' + '<script>\n' + '	//在此写JavaScript代码\n\n' +'</script' + '>' ;
		
$(function() {
	var mixedMode = {
	        name: "htmlmixed",
	        scriptTypes: [{matches: /\/x-handlebars-template|\/x-mustache/i,
	                       mode: null},
	                      {matches: /(text|application)\/(x-)?vb(a|script)/i,
	                       mode: "vbscript"}]};
	var myTextarea = document.getElementById('code');
	editor = CodeMirror.fromTextArea(myTextarea, {
		//光标高度
		cursorHeight: 0.8,
	  	mode: mixedMode,
	  	smartIndent: true,		//自动缩进
	  	selectionPointer: true,
	  	theme:'lesser-dark', 	//主题
        lineNumbers: true,		//显示行号
        autoCloseBrackets: true,	//括号匹配
        extraKeys: {"Alt-/": "autocomplete"},  //快捷键关键字提示
        keymap:'sublime',	 //快捷键风格和sulimeyiyang
	});
	editor.setSize('650px','600px');
	editor.setValue(defaultText);
	editor.on('change', submit);
});

function changeTheme(obj)
{
	
	editor.setOption('theme', obj.value);
	if(obj.value == 'eclipse')
	{
		$('.sub').css('background', '#e8f2ff');
		$('.conlog').css('background', '#e8f2ff');
		$('.iframe').css('background', '#FFFFFF')
	}
	else
	{
		$('.sub').css('background', '#45443B');
		$('.conlog').css('background', '#45443B');
		$('.iframe').css('background', '#262626')
	}
}

function submit()
{
	var param = {
		code:editor.getValue().toString()
	}
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath() %>/ScriptHtmlCssServlet',
		data:param,
		success: function(data) {
			document.getElementById("iframe").src = '<%=request.getContextPath() %>/JsHtml/ifram.jsp';
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
