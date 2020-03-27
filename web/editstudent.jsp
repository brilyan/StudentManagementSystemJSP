<%-- 
    Document   : editstudent
    Created on : 27/03/2020, 1:31:22 PM
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
    
    if(request.getParameter("btnedit")!= null){
        String nama=request.getParameter("txtname");
        String alamat=request.getParameter("txtaddress");
        String number=request.getParameter("txtnumberphone");
        Integer ideditbtn=Integer.parseInt(request.getParameter("editparam"));
        
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
        prepare=connection.prepareStatement("update student set nama=?,alamat=?,phone=? where id=?");
        prepare.setString(1,nama);
        prepare.setString(2,alamat);
        prepare.setString(3,number);
        prepare.setInt(4,ideditbtn);
        prepare.executeUpdate();
        response.sendRedirect("./student.jsp");
    }
    if(request.getParameter("editparam")!=null && request.getParameter("editparam")!=""){
        Integer idedit=Integer.parseInt(request.getParameter("editparam"));
        
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
        prepare=connection.prepareStatement("select * from student where id=?");
        prepare.setInt(1,idedit);
        resultset=prepare.executeQuery();
        resultset.next();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Student</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Edit Form</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    <div>
                        <label class="form-label">ID</label>
                        <input type="text" class="form-control" placeholder="ID" name="txtid" id="txtid" value="<%=resultset.getString("studentid")%>" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Name" name="txtname" id="txtstudentname" value="<%=resultset.getString("nama")%>" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Alamat</label>
                        <input type="text" class="form-control" placeholder="Alamat" name="txtaddress" id="txtaddress" value="<%=resultset.getString("alamat")%>" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Phone</label>
                        <input type="number" class="form-control" placeholder="Number Phone" name="txtnumberphone" id="txtnumberphone" value="<%=resultset.getString("phone")%>" required/>
                    </div>
                    
                    <br>
                    
                    <div>
                        <input type="submit" class="btn btn-danger" name="btnedit" id="btnedit" value="Edit"/>
                        <input type="reset" class="btn btn-danger" name="btnreset" id="btnreset" value="Reset"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
