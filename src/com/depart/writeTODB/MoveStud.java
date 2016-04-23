package com.depart.writeTODB;
/*
 * Принятие заявки, перемещение ее в историю обучения сотрудника
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class MoveStud {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection(); //Установить соединение с базо
	
		JSONArray id = (JSONArray) req.get("id"); //Id пользователя
		
		String sql = "SELECT * FROM movestud(" + id.get(0) + ")"; //SQL запрос для перемещения обучения

		try {
			Statement sqlStat = db.createStatement();
			sqlStat.execute(sql);	
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db); //Закрыть соединение с базой
	}
}
