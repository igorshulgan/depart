package com.writeTODB;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.connection.connectionDB;

public class uplRequest {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection();
		/**
		 * TODO: get values from JSON and pass to DB
		 */
		connectionDB.closeConnection(db);
	}
}
