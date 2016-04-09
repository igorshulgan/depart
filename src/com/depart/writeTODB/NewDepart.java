package com.depart.writeTODB;

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
		Connection db = connectionDB.createConnection();
	
		JSONArray name = (JSONArray) req.get("name");
		JSONArray budget = (JSONArray) req.get("budget");
		
		
		String sql = "SELECT * FROM newdepart('" + name.get(0) + "', "
				+ budget.get(0) + ")";
		
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
