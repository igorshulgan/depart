package com.depart.readDB;
/*
 * Подключение к базе, для получения таблицы запросов
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

public class GetRequests {
	
	public static JSONArray get() throws ParseException{
		Connection db = connectionDB.createConnection();
		/*
		 * SQL для выполнения на базе
		 */
		String sql = "SELECT user_request.*, users.name, users.secondname, users.surname, department.name as depart"
				+ " FROM user_request inner join users on "
				+ "(user_request.user_id = users.id) "
				+ "inner join department on(department.id = users.department);";
		JSONArray res = new JSONArray();
		
		System.out.println(sql);
		try {
			Statement sqlStat = db.createStatement();
			res = ResultSetConverter.convert(sqlStat.executeQuery(sql));  //Конвертировать результат в JSON
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db); //Закрыть соединение с базой
		return res;
	}
}
