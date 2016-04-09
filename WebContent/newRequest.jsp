<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Подать заявку</title>
</head>
<body>
	<h1>Подать заявку на обучение сотрудника</h1>

	<form action = "NewRequest" method = "POST">
		<fieldset>
			<legend><h3>Данные об обучении</h3></legend>
			User ID:<br>
			<input type="number" name="user"><br>
			Номер программы обучения:<br>
			<input type="number" name="num"><br>
			Форма обучения:<br>
			<input type="text" name="edutype"><br>
			Количество часов:<br>
			<input type="number" step="1" name="hours"><br>
			Название программы:<br>
			<input type="text" name="eduname"><br>
			Стоимость обучения:<br>
			<input type="number" step="0.01" name="amount"><br>
			Обучающая сторона:<br>
			<input type="text" name="educomp"><br>

		</fieldset>
		<input type = "submit" value = "Submit" />
	</form>
</body>
</html>