<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Р РµРіРёСЃС‚СЂР°С†РёСЏ</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12>
	<h1>Р—Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°С‚СЊ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ</h1>

	<form action = "RequestUpload" method = "POST">
		<fieldset>
			<legend><h3>Р”Р°РЅРЅС‹Рµ Рѕ СЃРѕС‚СЂСѓРґРЅРёРєРµ</h3></legend>
			Р¤Р°РјРёР»РёСЏ:<br>
			<input type="text" name="surname"><br>
			Р�РјСЏ:<br>
			<input type="text" name="name"><br>
			РћС‚С‡РµСЃС‚РІРѕ:<br>
			<input type="text" name="secondname"><br>
			Р”РѕР»Р¶РЅРѕСЃС‚СЊ:<br>
			<input type="text" name="role"><br>
			РЎС‚СЂСѓРєС‚СѓСЂРЅРѕРµ РїРѕРґСЂР°Р·РґРµР»РµРЅРёРµ:<br>
			<input type="text" name="department"><br>
			Р›РѕРіРёРЅ:<br>
			<input type="text" name="login"><br>
			РџР°СЂРѕР»СЊ:<br>
			<input type="password" name="pass"><br>
			
		</fieldset>
		<input type = "submit" value = "Submit" />
	</form>
</div>
</div>
</div>
</body>
</html>