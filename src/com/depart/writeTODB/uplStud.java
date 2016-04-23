package com.depart.writeTODB;
/*
 * Загрузка информации об обучении пользователя
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class uplStud {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection();
	
		JSONArray user = (JSONArray) req.get("user"); 	 //Пользователь
		JSONArray num = (JSONArray) req.get("num"); 	 //Номер обучения
		JSONArray hours = (JSONArray) req.get("hours");  //Количество часов
		JSONArray cost = (JSONArray) req.get("amount");  //Стоимость обучения
		JSONArray name = (JSONArray) req.get("eduname"); //Название программы обучения
		JSONArray type = (JSONArray) req.get("edutype"); //Тип обучения:очное или заочное
		JSONArray comp = (JSONArray) req.get("educomp"); //Название обучающей компании
		/*
		 * Если поле часов пустое, установить 0
		 */
		if (hours.get(0).toString().isEmpty()) {
			hours.clear();
			hours.add(0, new Integer(0));	
		}
		
		String sql = "SELECT * FROM adduserstud(" + user.get(0) + ", " + num.get(0) +
				", " + hours.get(0) + ", " + cost.get(0) + 
				", '"  + name.get(0) + "', '" + type.get(0) + "', '"  + comp.get(0) +"')"; //SQL для загруки обучения
		
		try {
			Statement sqlStat = db.createStatement();
			sqlStat.execute(sql);	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db); //Закрыть соединение с базой
	}
}
