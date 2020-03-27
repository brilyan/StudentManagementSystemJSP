<%-- 
    Document   : hapus
    Created on : 23/03/2020, 10:58:20 PM
    Author     : Brily Branco
--%>

<%@page import="java.sql.*"%>

<%! 
    Connection connection;
    PreparedStatement prepare;
    
    Integer idhapuscourse;
%>

<% 
   if(request.getParameter("idhapus")!=null && request.getParameter("idhapus")!=""){
       idhapuscourse=Integer.parseInt(request.getParameter("idhapus"));
       
       try{
           Class.forName("com.mysql.jdbc.Driver");
           connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
           prepare=connection.prepareStatement("delete from course where id=?");
           prepare.setInt(1,idhapuscourse);
           prepare.executeUpdate();
           response.sendRedirect("./Course.jsp");
       }catch(Exception e){
           out.println(e);
       }
   }
%>
