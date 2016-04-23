package com.depart.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionDB {
	
    public static Connection createConnection() {
    	Connection connection = null;
        System.out.println("-------- PostgreSQL JDBC Connection Testing ------------");
        
        /*
         * Проверка наличия драйвера PostgreSQL
         */
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException var3) {
            System.out.println("Where is your PostgreSQL JDBC Driver? Include in your library path!");
            var3.printStackTrace();
        }

        System.out.println("PostgreSQL JDBC Driver Registered!");
        /*
         * Проверка подключения к базе данных
         */
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/depart", "postgres", "postgres");
        } catch (SQLException var2) {
            System.out.println("Connection Failed! Check output console");
            var2.printStackTrace();
        }

        if(connection != null) {
            System.out.println("You made it, take control your database now!");
        } else {
            System.out.println("Failed to make connection!");
        }
        return connection;
    }
    public static void closeConnection(Connection con)
    {
    	/*
    	 * Закрыть соединение с базой
    	 */
    	try {
			con.close();
		} catch (SQLException e) {
			/*
			 * Catch the exception if occurred
			 */
			e.printStackTrace();
		}
    }
}
