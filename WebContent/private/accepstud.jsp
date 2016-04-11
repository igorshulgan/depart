<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>LOOK</title>
</head>
<body>
	<h1>Штука для принятия заявки, надо поместить как галочку возле таблицы заявок</h1>

	<form action = "AcceptStud" method = "POST">
		<fieldset>
			<legend><h3>Данные об обучении</h3></legend>
			 ID:<br>
			<input type="number" name="id"><br>
		</fieldset>
		<input type = "submit" value = "Submit" />
	</form>
</body>
</html>