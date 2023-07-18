<%-- 
    Document   : Edit-leavelog-apply
    Created on : Jul 9, 2023, 3:28:57 AM
    Author     : Hào Cute
--%>

<%@page import="leavelog.LeaveLog_DTO"%>
<%@page import="userlogin.User_Login_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/edit.css">

    </head>
    <body>
        <%
            User_Login_DTO loginUser = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            if (loginUser == null) {
                loginUser = new User_Login_DTO();
            }
            LeaveLog_DTO reportIsEditing = (LeaveLog_DTO) session.getAttribute("EDIT_LEAVELOG_APPLY");
        %>
        <%
            if (reportIsEditing != null) {
        %>

        <div class="container">  
            <form class="card mb-3 shadow" action="LeaveLogController">
                <br>
                <h1 style="text-align: center;">Edit Leave Log</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">
                            <br><h3 class="details" vlaue="">Employee: <%= loginUser.getEmployeeName()%></h3>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4 class="details">Date</h4>
                                <input style="width: 100%; height: 2.5em" type="date"
                                       name="dateLeave" required="" value="<%=reportIsEditing.getDateLeave()%>">
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12 form-group">
                                    <br><h4 class="reason">Reason</h4>
                                    <textarea style="width: 100%; height: 5em" type="text" name="reason" value=""></textarea>
                                </div>
                            </div>
                            <div>
                                <div class="box-footer text-center">
                                    <input type="hidden" value="EditLeaveLog" name="action"> <br>
                                    <%
                                        String message = (String) request.getAttribute("MESSAGE");
                                        if (message == null) {
                                            message = "";
                                        }
                                    %>
                                    <%= message%><br>
                                    <button type="submit" class="btn btn-sm btn-outline-success rounded-0">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>

        <%
        } else {
        %>
        <div class="container">  
            <form class="card mb-3 shadow" action="LeaveLogController">
                <br>
                <h1 style="text-align: center;">Edit Leave Log</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">
                            <br><h3 class="details" vlaue="">Employee: <%= loginUser.getEmployeeName()%></h3>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4 class="details">Date</h4>
                                <input style="width: 100%; height: 2.5em" type="date"
                                       name="dateOT" required="" value="" readonly="" >
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12 form-group">
                                    <br><h4 class="reason">Reason</h4>
                                    <textarea style="width: 100%; height: 5em" type="text" name="reason" value="" readonly="" ></textarea>
                                </div>
                            </div>
                            <div>
                                <div class="box-footer text-center">
                                    <input type="hidden" value="EditOverTime" name="action"> <br>
                                    <%
                                        String message = (String) request.getAttribute("MESSAGE");
                                        if (message == null) {
                                            message = "";
                                        }
                                    %>
                                    <%= message%>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
        <%
            }
        %>
    </body>
</html>
