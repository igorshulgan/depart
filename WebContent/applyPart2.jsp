<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Подать заявку</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container-fluid">
<div class="row">
	<div class="header">
		<h1>Подать заявку о необходимости обучения сотрудника</h2>
	</div>
</div>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-6"

	<form role="form" action = "StudUpload" method = "POST">
			<div class="form-group">
				<label for="user">User ID:</label>
				<input class="form-control" type="number" name="user" id="user" required>
			</div>
			<div class="form-group">
				<label for="num">Номер программы обучения:</label>
				<input type="number" name="num" id="num" class="form-control">
			</div>
			<div class="form-group">
				<label for="edutype">Форма обучения:</label>
				<input class="form-control" id="edutype" type="text" name="edutype">
			</div>
			<div class="form-group">
				<label for="hours">Количество часов:</label>
				<input class="form-control" type="number" step="1" name="hours">
			</div>
			<div class="form-group">
				<label for="eduname">Название программы:</label>
				<input class="form-control" id="eduname" type="text" name="eduname">
			</div>
			<div class="form-group">
				<label for="amount">Стоимость обучения:</label>
				<input class="form-control" id="amount" type="number" step="0.01" name="amount">
			</div>
			<div class="form-group">
				<label for="educomp">Обучающая сторона:</label>
				<input class="form-control" id="educomp" type="text" name="educomp">
			</div>
			<button class="btn-main" type = "submit">���������</button>
	</form>
</div>
<div class="col-sm-3">
</div>
</div>
</body>
</html>