package com.depart.writeTODB;

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
		Connection db = connectionDB.createConnection();
	
		JSONArray id = (JSONArray) req.get("id");
		
		
		String sql = "SELECT * FROM movestud(" + id.get(0) + ")";
		
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
