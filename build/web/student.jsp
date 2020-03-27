<%-- 
    Document   : student
    Created on : 24/03/2020, 6:40:56 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
    Connection connectioncourse;
    ResultSet resultset;
    PreparedStatement prepare;

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1><a href="home.jsp">Form Student</a></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="studentcontroller.jsp">
                    <div>
                        <label class="form-label">Student ID</label>
                        <input type="text" class="form-control" name="txtstudentid" id="txtstudentid" placeholder="ID" required/>
                    </div>
                    <div>
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" name="txtstudentname" id="txtstudentname" placeholder="Name" required/>
                    </div>
                    
                    <div class="dropdown">
                        <label class="form-label">Course</label>
                        <select name="cmbcourse" id="cmbcourse" class="form-control">
                            <% 
                                
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                connectioncourse=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
                                String query="select* from course";
                                Statement statement=connectioncourse.createStatement();
                                resultset=statement.executeQuery(query);
                                while(resultset.next()){
                                    String id=resultset.getString("id");
                                    String nama=resultset.getString("name");
                                   
                                   %>
                                   <option value="<%=id %>"><%=nama %></option>
                                   
                                   <%
                               
                                }
                                
                            %>
                        </select>
                    </div>
                    
                    <div class="dropdown">
                        <label class="form-label">Batch</label>
                        <select name="cmbbatch" id="cmbbatch" class="form-control">
                            <% 
                               String querybatch="select * from batch";
                               Statement statementbatch=connectioncourse.createStatement();
                               resultset=statement.executeQuery(querybatch);
                               while(resultset.next()){
                                   String idbatch=resultset.getString("id");
                                   String namabatch=resultset.getString("namabatch");
                                   %>
                                   <option value="<%=idbatch %>"><%=namabatch %></option>
                                   
                                   <%
                               }
                            %>
                            
                        </select>
                    </div>
                    
                    <div>
                        <label class="form-label">Address</label>
                        <input type="text" name="txtstudentaddress" id="txtstudentaddress" placeholder="Address" class="form-control" required/>
                    </div>
                    
                    <div>
                        <label class="form-label">Phone</label>
                        <input type="number" name="txtstudentnumber" id="txtstudentnumber" placeholder="Phone" class="form-control" required/>
                    </div>
                    <br>
                    
                    <div>
                        <input type="submit" class="btn btn-danger" name="btnsubmit" id="btnsubmit" value="Submit"/>
                        <input type="reset" class="btn btn-danger" name="btnreset" id="btnreset" value="Reset"/>
                    </div>
                </form>
            </div>
                            <div class="col-sm-8">
                                <div class="panel-body">
                                    <table class="table table-responsive table-bordered" cellpadding="0" width="100%">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nama</th>
                                            <th>Matpel</th>
                                            <th>Kelompok</th>
                                            <th>Alamat</th>
                                            <th>Phone</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                        
                                        <% 
                                            
                                            
                                            
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connectioncourse=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem","root","");
                                            String querytable="select student.*,course.*,batch.* from student JOIN course ON student.studentid = course.courseid JOIN batch ON student.studentid=batch.idbatch";
                                            Statement statementtable=connectioncourse.createStatement();
                                            resultset=statement.executeQuery(querytable);
                                            while(resultset.next()){
                                                String idtable=resultset.getString("id");
                                        %>
                                        
                                         
                                        
                                        <tr>
                                            <td><%=resultset.getString("studentid")%></td>
                                            <td><%=resultset.getString("nama")%></td>
                                            <td><%=resultset.getString("name")%></td>
                                            <td><%=resultset.getString("namabatch")%></td>
                                            <td><%=resultset.getString("alamat")%></td>
                                            <td><%=resultset.getString("phone")%></td>
                                            <td><a href="editstudent.jsp?editparam=<%=idtable%>">Edit</a></td>
                                            <td><a href="hapusstudent.jsp?hapusparam=<%=idtable%>" onclick="return confirm('Anda Yakin Ingin Menghapus?')">Delete</a></td>
                                        </tr>
                                        <% 
                                            }
                                        %>
                                        
                                       
                                    </table>
                                </div>
                            </div>
        </div>
    </body>
</html>
