<%-- 
    Document   : coursecontroller
    Created on : 23/03/2020, 12:41:08 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Controller</title>
    </head>
    <body>
        <%! 
            Connection connection;
            PreparedStatement prepare;
        %>
        
        <% 
            String nama=request.getParameter("txtnamecourse");
            String courseid=request.getParameter("txtcourseid");
            Integer duration=Integer.parseInt(request.getParameter("txtduration"));
            
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
                prepare=connection.prepareStatement("insert into course(courseid,name,duration)values(?,?,?)");
                prepare.setString(1,courseid);
                prepare.setString(2,nama);
                prepare.setInt(3,duration);
                prepare.executeUpdate();
                response.sendRedirect("./Course.jsp");
            }catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
