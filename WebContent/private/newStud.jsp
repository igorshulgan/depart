<%@ page import="java.net.URL" import="org.json.simple.*" import="org.json.simple.parser.JSONParser" import="java.io.BufferedReader" import="java.io.InputStreamReader" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Добавить обучение</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="container-fluid">
<div class="row header">

		<div class="col-sm-9">
			<h1>Добавить данные об обучении сотрудника</h1>
		</div>
		<div class="col-sm-3">
			<a class="logout" href="../menu.jsp">Меню</a>
			<a class="logout" onclick="<% session.invalidate(); %>" href="index.jsp?Retry=out">Выйти</a>
		</div>

</div>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-6">

	
	<form action = "StudUpload" method = "POST">
		<% 
 			URL url = new URL("http://localhost:8080/webApp/Users");
		    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
		    String str = new String();
		    String userstxt = new String();
		    while ((str = in.readLine()) != null) {
		      userstxt = userstxt + str;
		    }
		    in.close(); 
		    JSONParser parser = new JSONParser();
			JSONArray users = (JSONArray) parser.parse(userstxt);
		%>
		    <div class="form-group">
				<label for="user">Обучаемый сотрудник:</label>
				<select class="form-control" id="user" name="user">
					<%	
						JSONObject user = new JSONObject();
						for (int i = 0; i < users.size(); i ++) {	
							user = (JSONObject) users.get(i);	
							out.println("<option value='" + user.get("id") + "'>" + user.get("surname") + " " + user.get("name") + "</option>");
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="num">Номер программы обучения:</label>
				<input type="number" min="1" name="num" id="num" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="edutype">Форма обучения:</label>
				<select class="form-control" id="edutype" name="edutype">
					<option value="очная">очная</option>
					<option value="заочная">заочная</option>
					<option value="очно-заочная">очно-заочная</option>
				</select>
			</div>
			<div class="form-group">
				<label for="hours">Количество часов:</label>
				<input class="form-control" min="1" type="number" step="1" name="hours" required>
			</div>
			<div class="form-group">
				<label for="eduname">Название программы:</label>
				<input class="form-control" id="eduname" type="text" name="eduname">
			</div>
			<div class="form-group">
				<label for="amount">Стоимость обучения:</label>
				<input class="form-control" min="1" id="amount" type="number" step="0.01" name="amount" required>
			</div>
			<div class="form-group">
				<label for="educomp">Обучающая сторона:</label>
				<input class="form-control" id="educomp" type="text" name="educomp">
			</div>
			<button class="btn-main" type = "submit">Отправить</button>
	</form>
</div>
<div class="col-sm-3">
</div>
</div>
</body>
</html>