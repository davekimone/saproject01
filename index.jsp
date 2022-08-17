<%@ page import="java.sql.*"
         contentType="text/html;charset=utf-8"%>
<%

         String DB_URL = "jdbc:mysql://192.168.0.56:3306/testdb";

         String DB_USER = "root";

         String DB_PASSWORD= "Initialpw08";

         Connection conn;

         Statement stmt;

         try {

              Class.forName("com.mysql.jdbc.Driver");

              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

              stmt = conn.createStatement();

              conn.close();

              out.println("MySQL/MariaDB Connection Success!");

         }
         catch(Exception e){

              out.println(e);
         }
%>