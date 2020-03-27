<%-- 
    Document   : studentcontroller
    Created on : 26/03/2020, 8:19:49 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%!
    Connection connection;
    PreparedStatement prepare;
    String studentid,nama,matpel,kelompok,alamat,phone;
%>

<% 
   try{
       studentid=request.getParameter("txtstudentid");
       nama=request.getParameter("txtstudentname");
       matpel=request.getParameter("cmbcourse");
       kelompok=request.getParameter("cmbbatch");
       alamat=request.getParameter("txtstudentaddress");
       phone=request.getParameter("txtstudentnumber");
       Class.forName("com.mysql.jdbc.Driver");
       connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
       prepare=connection.prepareStatement("insert into student(studentid,nama,matpel,kelompok,alamat,phone)values(?,?,?,?,?,?)");
       prepare.setString(1,studentid);
       prepare.setString(2,nama);
       prepare.setString(3,matpel);
       prepare.setString(4,kelompok);
       prepare.setString(5,alamat);
       prepare.setString(6,phone);
       prepare.executeUpdate();
       response.sendRedirect("./student.jsp");
   }catch(Exception e){
       out.println("Koneksi Gagal "+e.getMessage());
   }
%>