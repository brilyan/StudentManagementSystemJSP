<%-- 
    Document   : batch
    Created on : 24/03/2020, 12:21:20 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Batch</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Batch Form</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="batchcontroller.jsp">
                    
                    <div>
                        <label class="form-label">Batch ID</label>
                        <input type="text" name="txtbatchid" id="txtbatchid" placeholder="ID" class="form-control" required/>
                    </div>
                    <div>
                        <label class="form-label">Batch Name</label>
                        <input class="form-control" type="text" placeholder="Name" id="txtbatchname" name="txtbatchname" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Years</label>
                        <input class="form-control" type="number" placeholder="Year" id="txtbatchyear" name="txtbatchyear" required/>
                    </div>
                    
                    <br>
                    
                    <div>
                        <input type="submit" class="btn btn-danger" name="btnsimpanbatch" id="btnsimpanbatch" value="Simpan"/>
                        <input type="reset" class="btn btn-danger" name="btnresetbatch" id="btnresetbatch" value="Reset"/>
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Batch Name</th>
                                <th>Year</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
                            <% 
                                Connection connection;
                                ResultSet resultset;
                                PreparedStatement prepare;
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                connection=DriverManager.getConnection("jdbc:mysql://localhost/studentmanagementsystem","root","");
                                prepare=connection.prepareStatement("select * from batch");
                                resultset=prepare.executeQuery();
                                
                                while(resultset.next()){
                                    String idbatch=resultset.getString("id");
                            %>
                            <tr>
                                <td><%=resultset.getString("idbatch")%></td>
                                <td><%=resultset.getString("namabatch") %></td>
                                <td><%=resultset.getString("tahun")%></td>
                                <td><a href="editbatch.jsp?ideditbatch=<%=idbatch %>">Edit</a></td>
                                <td><a href="hapusbatch.jsp?idhapusbatch=<%=idbatch %>">Delete</a></td>
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
