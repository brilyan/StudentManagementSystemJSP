<%-- 
    Document   : editbatch
    Created on : 24/03/2020, 4:07:09 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%!
    Connection connection;
    ResultSet resultset;
    PreparedStatement prepare;
%>

<% 
    if(request.getParameter("btnedit")!=null && request.getParameter("btnedit")!=""){
        String nama=request.getParameter("txtbatchname");
        String years=request.getParameter("txtbatchyears");
        String idbatch=request.getParameter("txtbatchid");
        Integer ideditbtn=Integer.parseInt(request.getParameter("ideditbatch"));
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
            prepare=connection.prepareStatement("update batch set idbatch=?,namabatch=?,tahun=? where id=?");
            prepare.setString(1,idbatch);
            prepare.setString(2,nama);
            prepare.setString(3,years);
            prepare.setInt(4,ideditbtn);
            prepare.executeUpdate();
            response.sendRedirect("./batch.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }
    
    if(request.getParameter("ideditbatch")!=null && request.getParameter("ideditbatch")!=""){
    Integer ideditbatch=Integer.parseInt(request.getParameter("ideditbatch"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
        prepare=connection.prepareStatement("select * from batch where id=?");
        prepare.setInt(1,ideditbatch);
        resultset=prepare.executeQuery();
        resultset.next();
    }catch(Exception e){
        out.println(e);
    }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Edit Form</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                     
                    <div>
                        <label class="form-label">Batch ID</label>
                        <input type="text" class="form-control" placeholder="ID" name="txtbatchid" id="txtbatchid" value="<%=resultset.getString("idbatch") %>" required/>
                    </div>
                    <div>
                        <label class="form-label">Batch Name</label>
                        <input type="text" class="form-control" placeholder="Name" name="txtbatchname" id="txtbatchname" value="<%=resultset.getString("namabatch") %>" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Years Batch</label>
                        <input type="number" class="form-control" placeholder="Years" name="txtbatchyears" id="txtbatchyears" value="<%=resultset.getString("tahun")%>"required/>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-danger" name="btnedit" id="btnedit" value="Edit"/>
                    <input type="reset" class="btn btn-danger" name="btnreset" id="btnreset" value="Reset"/>
                </form>
            </div>
        </div>
    </body>
</html>
