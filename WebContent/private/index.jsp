<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Войти</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container">
<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4 mrg-top">
	<form role="form" action="j_security_check" method = "POST">
			<div class="form group">
				<label for="username">Логин:</label>
				<input type="text" class="form-control" name="j_username" id="username">
			</div>
			<div class="form-group">
				<label for="psw">Пароль:</label>
				<input type="password" class="form-control" name="j_password" id="psw">
			</div>
		<button class="btn-main" type = "submit">Войти</button>
	</form>
	<a class="btn-main btn-second" href="../signin.jsp">Регистрация</a>
</div>
<div class="col-sm-4">
</div>
</div>
</div>
</body>
</html>