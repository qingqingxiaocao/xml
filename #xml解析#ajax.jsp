<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<button id="btn" >button</button>
	<ul id="studentResult">
		
	</ul>
	
	<script type="text/javascript">
		(function(){
			
			var createXmlHttp = function(){
				var xmlHttp = null;
				if(window.ActiveXObject){
					xmlHttp = new ActiveXObject();
				}else{
					xmlHttp = new XMLHttpRequest();
				}
				return xmlHttp;
			};
			
			document.getElementById("btn").onclick = function(){
				
				var xmlHttp = createXmlHttp();
				xmlHttp.open("get","/student.xml?t="+ new Date().getTime());
				
				xmlHttp.onreadystatechange = function(){
					
					if(xmlHttp.readyState == 4){
						if(xmlHttp.status ==200){
							//获取服务器端返回的xml数据
							var result = xmlHttp.responseXML;
							var studentArray = result.getElementsByTagName("student");
							var studentResultElement = document.getElementById("studentResult")
							
							for(var i=0;i<studentArray.length;i++){
								
								var student = studentArray[i];
								var id = student.getAttribute("id");
								var name = student.getElementsByTagName("name")[0].childNodes[0].nodeValue;
								var age = student.getElementsByTagName("age")[0].childNodes[0].nodeValue;
							
								var span = document.createElement("span");
								var li = document.createElement("li");
								var strong = document.createElement("strong");
								
								var idNode = document.createTextNode(id);
								var nameNode = document.createTextNode(name);
								var ageNode = document.createTextNode(age);
								
								
								span.appendChild(idNode);
								strong.appendChild(ageNode);
								
								li.appendChild(span);
								li.appendChild(nameNode);
								li.appendChild(strong);
								
								studentResultElement.appendChild(li);		
							}
						}
					}
				};
				xmlHttp.send();
			};
		})();
	</script>
</body>
</html>
