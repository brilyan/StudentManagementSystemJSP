<%-- 
    Document   : Course
    Created on : 23/03/2020, 11:25:37 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Course Form</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="coursecontroller.jsp">
                    <div>
                        <label class="form-label">Course ID</label>
                        <input type="text" id="txtcourseid" name="txtcourseid" placeholder="ID" class="form-control" required/>
                    </div>
                    <div>
                        <label class="form-label">Course</label>
                        <input type="text" id="txtnamecourse" name="txtnamecourse" placeholder="Name" class="form-control" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Duration</label>
                        <input type="number" id="txtduration" name="txtduration" placeholder="Duration" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <input type="submit" class="btn btn-danger" value="Simpan" name="btnsimpan" id="btnsimpan"/>
                        <input type="reset" class="btn btn-danger" value="Batal" name="btnbatal" id="btnbatal"/>
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
            <div class="panel-body">
                <table class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nama</th>
                            <th>Duration</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <% 
                            Connection connection;
                            ResultSet resultset;
                            PreparedStatement prepare;
                            
                            
                                Class.forName("com.mysql.jdbc.Driver");
                                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
                                prepare=connection.prepareStatement("select * from course");
                                resultset=prepare.executeQuery();
                                while(resultset.next()){
                                    
                                String idcourse=resultset.getString("id");
                                    
                        %>
                        <tr>
                            <td><%=resultset.getString("courseid")%></td>
                            <td><%=resultset.getString("name") %></td>
                            <td><%=resultset.getString("duration")%></td>
                            <td><a href="edit.jsp?idedit=<%=idcourse %>">Edit</a></td>
                            <td><a href="hapus.jsp?idhapus=<%=idcourse %>">Delete</a></td>
                        </tr>
                        <% 
                            }
                        %>
                    </thead>
                </table>
        </div>
            </div>
        </div>
    </body>
</html>
