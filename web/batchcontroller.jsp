<%-- 
    Document   : batchcontroller
    Created on : 24/03/2020, 1:10:11 AM
    Author     : Brily Branco
--%>


<%@page import="java.sql.*" %> 

<%! 
    Connection connection;
    PreparedStatement prepare;
%>

<% 
    String batchnama=request.getParameter("txtbatchname");
    String tahunbatch=request.getParameter("txtbatchyear");
    String batchid=request.getParameter("txtbatchid");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
        prepare=connection.prepareStatement("insert into batch(idbatch,namabatch,tahun)values(?,?,?)");
        prepare.setString(1,batchid);
        prepare.setString(2,batchnama);
        prepare.setString(3,tahunbatch);
        prepare.executeUpdate();
        response.sendRedirect("./batch.jsp");
    }catch(Exception e){
        out.println("Koneksi Gagal "+e);
    }
%>
