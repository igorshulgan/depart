<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Новое отделение</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="container-fluid">
<div class="row header">
		<div class="col-sm-9">
			<h1>Создать новое отделение</h1>
		</div>
		<div class="col-sm-3">
			<a class="logout" href="../menu.jsp">Меню</a>
			<a class="logout" href="logout.jsp">Выйти</a>
		</div>
</div>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-6">

	<form role="form" action = "AddNewDepart" method = "POST">
			<div class="form-group">
				<label for="name">Название:</label>
				<input class="form-control" id="name" type="text" name="name" required>
			</div>
			<div class="form-group">
				<label for="budget">Информация о наличии средств в бюджете для отделения:</label>
				<input class="form-control" id="budget" type="number" step="0.01" name="budget" required>
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