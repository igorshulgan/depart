package com.depart.readDB;

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
	
		String sql = "SELECT user_request.*, users.name, users.secondname, users.surname"
				+ " FROM user_request inner join users on "
				+ "(user_request.user_id = users.id);";
		JSONArray res = new JSONArray();
		
		System.out.println(sql);
		try {
			Statement sqlStat = db.createStatement();
			res = ResultSetConverter.convert(sqlStat.executeQuery(sql));
			System.out.println(res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db);
		return res;
	}
}
