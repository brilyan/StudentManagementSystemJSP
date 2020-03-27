<%-- 
    Document   : hapusbatch
    Created on : 24/03/2020, 6:10:07 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<%! 
    Connection connection;
    PreparedStatement prepare;
%>

<% 
    if(request.getParameter("idhapusbatch")!=null && request.getParameter("idhapusbatch")!=""){
            Integer idhapus=Integer.parseInt(request.getParameter("idhapusbatch"));
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
                prepare=connection.prepareStatement("delete from batch where id=?");
                prepare.setInt(1,idhapus);
                prepare.executeUpdate();
                response.sendRedirect("./batch.jsp");
            }catch(Exception e){
                out.println(e);
            }
    }
%>
