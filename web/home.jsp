<%-- 
    Document   : home.jsp
    Created on : 23/03/2020, 8:12:24 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body class="bg-primary">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a href="#" class="navbar-brand">Student Management System</a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="#" class="nav-link">Home</a>
                </li>
                
                <li class="nav-item">
                    <a href="Course.jsp" class="nav-link">Course</a>
                </li>
                
                <li class="nav-item">
                    <a href="batch.jsp" class="nav-link">Batch</a>
                </li>
                
                <li>
                    <a href="student.jsp" class="nav-link">Student</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="index.html">Logout</a>
                </li>
            </ul>
        </nav> 
        <div class="col-sm-8">
            <img src="gambar/Studentbg2.png" alt=""/>
        </div>
    </body>
</html>
