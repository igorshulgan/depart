package com.depart.readDB;
/*
 * Подключение к базе, для получения информации по пользователям
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;

import com.depart.connection.connectionDB;

public class GetDepartments {
	
	public static JSONArray get() throws ParseException{
		Connection db = connectionDB.createConnection(); //Подключение к базе
	
		String sql = "SELECT name, id FROM department"; //SQL для выполения на базе
		JSONArray res = new JSONArray();
		
		System.out.println(sql);
		try {
			Statement sqlStat = db.createStatement();
			res = ResultSetConverter.convert(sqlStat.executeQuery(sql)); //Конвертировать результат в JSON
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db); //Закрыть соединение с базой
		return res;
	}
}
