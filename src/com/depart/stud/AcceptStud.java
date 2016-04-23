package com.depart.stud;
/*
 * Принятие заявки на обучение
 * Метод доступен только пользователям указавшим код доступа:e46gh78
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

import com.depart.writeTODB.*;
import com.google.gson.Gson;

@WebServlet("/private/AcceptStud")
public class AcceptStud extends HttpServlet {

	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8"); //Кодировка данных
    	/*
    	 * Обертка получаемых данных в JSON
    	 */
        Map<String, String[]> options = new LinkedHashMap<>();
        
        options = request.getParameterMap();
  
        String jsonString = new Gson().toJson(options);
        JSONParser parser = new JSONParser();
        JSONObject json = new JSONObject();
		try {
			json = (JSONObject) parser.parse(jsonString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8"); //Кодировка данных
        MoveStud.upload(json); //Отправить данные для загрузки в базу
        response.sendRedirect("/webApp/private/requests.jsp"); //Редирект к списку заявок
    }

}