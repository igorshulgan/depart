package com.depart.writeTODB;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class uplRequest {
	
	public static void upload(JSONObject req){
		Connection db = connectionDB.createConnection();
	
		JSONArray name = (JSONArray) req.get("name");
		JSONArray surname = (JSONArray) req.get("surname");
		JSONArray secondname = (JSONArray) req.get("secondname");
		JSONArray department = (JSONArray) req.get("department");
		JSONArray role = (JSONArray) req.get("role");
		JSONArray login = (JSONArray) req.get("login");
		JSONArray password =  (JSONArray) req.get("pass");
		
		String pass = new String();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			md.update(password.get(0).toString().getBytes());
			pass = md.digest().toString();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		String sql = "SELECT * FROM adduser('" + name.get(0) + "', '" + surname.get(0) +
				"', '" + secondname.get(0) + "', '" + role.get(0) + 
				"', '"  + department.get(0) + "', '" + login.get(0) + "', '" +
				pass + "')";
		
		
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
