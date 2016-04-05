package com.depart.writeTODB;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class UplRequest {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection();
	
		JSONArray user = (JSONArray) req.get("user");
		JSONArray num = (JSONArray) req.get("num");
		JSONArray hours = (JSONArray) req.get("hours");
		JSONArray cost = (JSONArray) req.get("amount");
		JSONArray name = (JSONArray) req.get("eduname");
		JSONArray type = (JSONArray) req.get("edutype");
		JSONArray budget = (JSONArray) req.get("budget");
		
		String sql = "SELECT * FROM addnewrequest(" + user.get(0) + ", " + num.get(0) +
				", " + hours.get(0) + ", " + cost.get(0) + 
				", '"  + name.get(0) + "', '" + type.get(0) + "', " + budget.get(0) + ")";
		
		System.out.println(sql);
		try {
			Statement sqlStat = db.createStatement();
			sqlStat.execute(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db);
	}
}
