<%-- 
    Document   : edit
    Created on : 23/03/2020, 6:39:16 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%! 
    Connection connection;
    PreparedStatement prepare;
    ResultSet resultset;
    
    Integer idcourse;
%>

<% 
    if(request.getParameter("btnubah")!=null){
        idcourse=Integer.parseInt(request.getParameter("idedit"));
        String nama=request.getParameter("txtnamaubah");
        String duration=request.getParameter("txtdurationubah");
        String courseid=request.getParameter("txtcourseidedit");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
            prepare=connection.prepareCall("update course set courseid=?,name=?,duration=? where id=?");
            prepare.setString(1,courseid);
            prepare.setString(2,nama);
            prepare.setString(3,duration);
            prepare.setInt(4,idcourse);
            prepare.executeUpdate();
            response.sendRedirect("./Course.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }
    if(request.getParameter("idedit") !=null && request.getParameter("idedit")!=""){
        idcourse=Integer.parseInt(request.getParameter("idedit"));
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
            prepare=connection.prepareStatement("select * from course where id=?");
            prepare.setInt(1,idcourse);
            resultset=prepare.executeQuery();
            resultset.next();
        }catch(Exception e){
            out.println(e);
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Course Edit Form</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    <div>
                        <label class="form-label">Course ID</label>
                        <input type="text" class="form-control" name="txtcourseidedit" id="txtcourseidedit" value="<%=resultset.getString("courseid")%>" placeholder="ID"/>
                    </div>
                    <div>
                        <label class="form-label">Nama</label>
                        <input type="text" class="form-control" name="txtnamaubah" id="txtnamaubah" placeholder="Nama" value="<%=resultset.getString("name")%>"/>
                    </div>
                    
                    <div>
                        <label class="form-label">Duration</label>
                        <input type="text" class="form-control" name="txtdurationubah" id="txtdurationubah"  placeholder="Duration" value="<%=resultset.getInt("duration") %>"/>
                    </div>
                    
                    <div>
                        <input type="submit" class="btn btn-danger" name="btnubah" id="btnubah" value="Ubah"/>
                        <input type="reset" class="btn btn-danger" name="btnreset" id="btnreset" value="Reset"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
