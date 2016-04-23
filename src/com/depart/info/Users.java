package com.depart.info;
/*
 * Получить информацию по существующим пользователям
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.depart.readDB.*;
import com.google.gson.Gson;

@WebServlet("/Users")
public class Users extends HttpServlet {

	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		JSONArray res = null;
			try {
				/*
				 * Подключиться к базе, для выполнения запроса 
				 * получения пользователей
				 */
				res = GetUsers.get();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			response.setCharacterEncoding("UTF-8"); //Кодировка данных
    		response.getWriter().write(res.toString());
    		
    }

}