package com.depart.writeTODB;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class uplRequest {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection();
		String sql = "";
		try {
			Statement sqlStat = db.prepareStatement(sql);
			sqlStat.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		connectionDB.closeConnection(db);
	}
}
