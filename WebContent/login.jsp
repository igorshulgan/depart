<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Войти</title>
</head>
<body>
	<h1>Войти</h1>

	<form action = "login" method = "POST">
			Логин:<br>
			<input type="text" name="login"><br>
			Пароль:<br>
			<input type="password" name="psw"><br>
		<input type = "submit" value = "Войти" />
	</form>
</body>
</html>