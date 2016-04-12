<%@ page import="java.net.URL" import="org.json.simple.*" import="org.json.simple.parser.JSONParser" import="java.io.BufferedReader" import="java.io.InputStreamReader" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Заявки</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="container-fluid">
<div class="row header">
		<div class="col-sm-9">
			<h1>Просмотр заявок</h1>
		</div>
		<div class="col-sm-3">
			<a class="logout" href="../menu.jsp">Меню</a>
			<a class="logout" onclick="<% session.invalidate(); %>" href="index.jsp?Retry=out">Выйти</a>
		</div>
</div>
<div class="row">
<div class="col-sm-1">
</div>
<div class="col-sm-10">
			<% 
	 			URL url = new URL("http://localhost:8080/webApp/Requests");
			    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			    String str = new String();
			    String requestxt = new String();
			    while ((str = in.readLine()) != null) {
			      requestxt = requestxt + str;
			    }
			    in.close(); 
			    JSONParser parser = new JSONParser();
				JSONArray requests = (JSONArray) parser.parse(requestxt);
		    %>
			<table class="table table-hover table-condensed table-bordered">
				<thead>
					<tr>
						<th>Сотрудник</th>
						<th>Номер программы обучения</th>
						<th>Форма обучения</th>
						<th>Количество часов</th>
						<th>Название программы</th>
						<th>Стоимость обучения</th>
						<th>Обучающая сторона</th>
						<th>Принять заявку</th>
					</tr>
				</thead>
				<tbody>
					<%	
						JSONObject req = new JSONObject();
						for (int i = 0; i < requests.size(); i ++) {	
							req = (JSONObject) requests.get(i);	
							out.println("<tr>");
							out.println("<td>" + req.get("secondname") + " " + req.get("name") + " " + req.get("surname") + "</td>");
							out.println("<td>" + req.get("num_stud") + "</td>");
							out.println("<td>" + req.get("type_st") + "</td>");
							out.println("<td>" + req.get("hours") + "</td>");
							out.println("<td>" + req.get("name_st") + "</td>");
							out.println("<td>" + req.get("cost") + "</td>");
							out.println("<td>" + req.get("comp_name") + "</td>");
							out.println("<form action = 'AcceptStud' method = 'POST'>");
							out.println("<input hidden type='number' name='id' value='" + req.get("id") + "'>");
							out.println("<td><button class='btn-main' type = 'submit'>Принять</button></td>");
							out.println("</form>");
							
							out.println("</tr>");
							
						}
					%>
				</tbody>
			</table>

</div>
<div class="col-sm-1">
</div>
</div>
</div>
</body>
</html>