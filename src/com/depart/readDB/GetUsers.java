package com.depart.readDB;
/*
 * Получить информацию о пользователях
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

public class GetUsers {
	
	public static JSONArray get() throws ParseException{
		Connection db = connectionDB.createConnection();
	
		String sql = "SELECT name, surname, secondname, id FROM users"; //SQL для выполнения на базе
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
