<%-- 
    Document   : create-leavelog-apply
    Created on : Jul 9, 2023, 2:37:46 AM
    Author     : Hào Cute
--%>


<%@page import="java.time.LocalDate"%>
<%@page import="userlogin.User_Login_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>       
        <link rel="stylesheet" type="text/css" href="CSS/create.css">

    </head>
    <body>

        <%
            User_Login_DTO loginUser = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            if (loginUser == null) {
                loginUser = new User_Login_DTO();
            }
        %>
        <div class="container">  
            <form class="card mb-3 shadow" action="LeaveLogController">
                <br>
                <h1 style="text-align: center;">Create Leave Log Form</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">
                            <br><h3 class="details" vlaue="">Employee: <%= loginUser.getEmployeeName()%></h3>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4 class="details">Date:</h4>
                                <input style="width: 100%; height: 2.5em" type="date"
                                       name="dateLeave" required="" min="<%=LocalDate.now().toString()%>">
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12 form-group">
                                    <br><h4 class="reason">Reason</h4>
                                    <textarea style="width: 100%; height: 5em" type="text" name="reason" value="CreateLeaveLogApplication"></textarea>
                                </div>
                            </div>
                            <div>
                                <div class="box-footer text-center">
                                    <input type="hidden" value="CreateLeaveLogApplication" name="action"> <br>
                                    <%            String message = (String) request.getAttribute("MESSAGE");
                                        if (message == null) {
                                            message = "";
                                        }
                                    %>
                                    <%= message%>
                                    <button type="submit" class="btn btn-sm btn-outline-success rounded-0">Create</button>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </body>
</html>


