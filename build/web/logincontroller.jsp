<%-- 
    Document   : logincontroller
    Created on : 23/03/2020, 7:36:03 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Controller</title>
    </head>
    <body>
        
        <% 
            String nama=request.getParameter("txtusername");
            String password=request.getParameter("txtpassword");
            
            if(nama.equals("Admin") && password.equals("Admin")){
                response.sendRedirect("./home.jsp");
            }
            else{
                out.println("Password Atau Username Salah");
                
            }
        %>
        
    </body>
</html>
