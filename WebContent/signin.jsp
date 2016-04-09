<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<h1>Регистрация сотрудника</h1>
		</div>
		<div class="col-sm-2">
			<a class="logout" href="logout.jsp">Выйти</a>
		</div>

</div>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-6"

	<form role="form" action = "RequestUpload" method = "POST">
			<div class="form-group">
				<label for="surname">Фамилия:</label>
				<input class="form-control" type="text" name="surname" id="surname">
			</div>
			<div class="form-group">
				<label for="name">Имя:</label>
				<input class="form-control" type="text" name="name" id="name">
			</div>
			<div class="form-group">
				<label for"secondnam">Отчество:</label>
				<input class="form-control" type="text" name="secondname">
			</div>
			<div class="form-group">
				<label for="role">Должность:</label>
				<input class="form-control" id="role" type="text" name="role">
			</div>
			<div class="form-group">
				<label for="depart">Структурное подразделение:</label>
				<input class="form-control" id="depart" type="text" name="department">
			</div>
			<div class="form-group">
				<label for="login">Логин:</label>
				<input class="form-control" id="login" type="text" name="login">
			</div>
			<div class="form-group">
				<label for="pass">Пароль:</label>
				<input class="form-control" id="pass" type="password" name="pass">
			</div>		
			<button class="btn-main" type = "submit">Отправить</button>
	</form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>
</html>