package com.depart.writeTODB;
/*
 * Добавление в базу нового отдела
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class NewDepart {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection(); //Установить соединение с базой
	
		JSONArray name = (JSONArray) req.get("name"); //Название отдела
		JSONArray budget = (JSONArray) req.get("budget"); //Бюджет отдела
		
		
		String sql = "SELECT * FROM newdepart('" + name.get(0) + "', "
				+ budget.get(0) + ")"; //SQL для добавления отдела
		
		try {
			Statement sqlStat = db.createStatement();
			sqlStat.execute(sql);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db); //Закрыть соединение с базой
	}
}
