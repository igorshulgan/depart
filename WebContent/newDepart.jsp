<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Новое отделение</title>
</head>
<body>
	<h1>Создать новое отделение</h1>

	<form action = "AddNewDepart" method = "POST">
		<fieldset>
			<legend><h3>Данные об отделении</h3></legend>
			Название:<br>
			<input type="text" name="name"><br>
			Информация о наличии средств в бюджете для отделения:<br>
			<input type="number" step="0.01" name="budget"><br>
		</fieldset>
		<input type = "submit" value = "Submit" />
	</form>
</body>
</html>