package com.depart.logout;
/*
 * Выход пользователя
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

@WebServlet("/private/LogOut")
public class LogOut extends HttpServlet {

	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		request.getSession().invalidate(); //Закончить сессию пользователя
    		response.sendRedirect("/webApp/?Retry=out"); //Редирект пользователя на главную страницу
    		
    }

}