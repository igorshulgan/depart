package com.depart.writeTODB;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.depart.connection.connectionDB;

public class SignIn {
	
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
		String hex = new String();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			md.update(password.get(0).toString().trim().getBytes());
			
			byte byteData[] = md.digest();
			md.reset();
			
	        StringBuffer sb = new StringBuffer();
	        
	        for (int i = 0; i < byteData.length; i++) {
	            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        try {
		        pass = sb.toString();
		    } catch (Exception e) {
		        pass = "";
		    }

		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		String sql = "SELECT * FROM adduser('" + name.get(0) + "', '" + surname.get(0) +
				"', '" + secondname.get(0) + "', '" + role.get(0) + 
				"', "  + department.get(0) + ", '" + login.get(0) + "', '" +
				pass + "')";
		
		
		System.out.println(sql);
		System.out.println(hex);
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
