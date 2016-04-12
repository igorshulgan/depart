<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Меню</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container-fluid">
	<div class="row header">

		<div class="col-sm-10">
			<h1>Главное меню</h1>
		</div>
		<div class="col-sm-2">
			<a class="logout" onclick="<% session.invalidate(); %>" href="login.jsp?Retry=out">Выйти</a>
		</div>

</div>
<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4 menu-box">	
	<a class="btn-main btn-second" href="private/newRequest.jsp">Подать заявку на обучение</a>
	<a class="btn-main btn-second" href="private/newStud.jsp">Добавить информацию об обучении</a>
	<a class="btn-main btn-second" href="private/requests.jsp">Просмотр заявок</a>
	<a class="btn-main btn-second" href="private/newDepart.jsp">Добавить отдел</a>
</div>
<div class="col-sm-4">
</div>
</div>
</div>
</body>
</html>