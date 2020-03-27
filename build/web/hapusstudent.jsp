<%-- 
    Document   : hapusstudent
    Created on : 27/03/2020, 3:24:47 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    Connection connection;
    ResultSet resultset;
    PreparedStatement prepare;
    
    if(request.getParameter("hapusparam")!=null && request.getParameter("hapusparam")!=""){
        Integer idhapus=Integer.parseInt(request.getParameter("hapusparam"));
        
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
        prepare=connection.prepareStatement("delete from student where id=?");
        prepare.setInt(1,idhapus);
        prepare.executeUpdate();
        response.sendRedirect("./student.jsp");
    }
%>
