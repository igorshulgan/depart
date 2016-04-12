<%@ page import="java.net.URL" import="org.json.simple.*" import="org.json.simple.parser.JSONParser" import="java.io.BufferedReader" import="java.io.InputStreamReader" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Регистрация</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container-fluid">
<div class="row header">
		<div class="col-sm-10">
			<h1>Регистрация</h1>
		</div>
</div>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-6">

	<form role="form" action = "NewUser" method = "POST">
			<div class="form-group">
				<label for="surname">Фамилия:</label>
				<input class="form-control" type="text" name="surname" id="surname" required>
			</div>
			<div class="form-group">
				<label for="name">Имя:</label>
				<input class="form-control" type="text" name="name" id="name" required>
			</div>
			<div class="form-group">
				<label for"secondnam">Отчество:</label>
				<input class="form-control" type="text" name="secondname" required>
			</div>
			<div class="form-group">
				<label for="role">Должность:</label>
				<input class="form-control" id="role" type="text" name="role" required>
			</div>
			<% 
	 			URL url = new URL("http://localhost:8080/webApp/Departments");
			    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			    String str = new String();
			    String departs = new String();
			    while ((str = in.readLine()) != null) {
			      departs = departs + str;
			    }
			    in.close(); 
			    JSONParser parser = new JSONParser();
				JSONArray json = (JSONArray) parser.parse(departs);
		    %>
			<div class="form-group">
				<label for="depart">Структурное подразделение:</label>
				<select class="form-control" id="depart" name="department">
					<%	
						JSONObject depart = new JSONObject();
						for (int i = 0; i < json.size(); i ++) {	
							depart = (JSONObject) json.get(i);	
							out.println("<option value='" + depart.get("id") + "'>" + depart.get("name") + "</option>");
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="login">Логин:</label>
				<input class="form-control" id="login" type="text" name="login" required>
			</div>
			<div class="form-group">
				<label for="pass">Пароль:</label>
				<input class="form-control" id="pass" type="password" name="pass" required>
			</div>	
			<div class="form-group">
				<label for="key">Ключ для принятия заявок:</label>
				<input class="form-control" id="key" type="password" name="key">
			</div>	
			<button class="btn-main" type = "submit" onclick="window.location.href='private/menu.jsp'; return true;" >Отправить</button>
	</form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>
</html>