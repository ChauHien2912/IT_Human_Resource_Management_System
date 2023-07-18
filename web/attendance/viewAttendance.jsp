<%-- 
    Document   : viewAttendance
    Created on : Jul 16, 2023, 11:37:40 PM
    Author     : Hào Cute
--%>

<%@page import="attendance.ViewAttendance_DTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">View Attendance</h1>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="AttendanceController">
                                <input type="text" name="employeeId"  placeholder="ID">
                                <input type="date" name="dateAttendance">

                                <input type="hidden" name="action" value="viewAttendance">
                                <input type="submit" class="btn btn-success" value="Search">
                            

                        </form>
                    </div>
                </div>
                <br>
                <%
                    List<ViewAttendance_DTO> listReport = null;
                    listReport = (List<ViewAttendance_DTO>) request.getAttribute("LIST_ATTENDANCE");
                    if (listReport != null) {
                %>
                <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">

                                    <table class="table">                     <thead>
                                            <tr>
                                                <th>NO</th>
                                                <th>EmployeeID</th>
                                                <th>Start Hour</th>
                                                <th>End Hour</th>
                                                <th>Office Hours</th>
                                                <th>total Hours</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                String status = null;
                                                for (ViewAttendance_DTO report : listReport) {
                                            %>

                                        <form action="LeaveLogController">
                                            <tr>
                                                <td><%=count%></td>
                                                <td><%=report.getEmployeeId()%></td>
                                                <td><%=report.getStartHour()%></td>
                                                <td><%=report.getEndHour()%></td>
                                                <td><%=report.getOfficeHours()%></td>
                                                <td><%=report.getTotalHours()%></td>
                                            </tr>
                                        </form>
                                        <%
                                                count += 1;
                                            }
                                        %>
                                        <%
                                            }
                                        %>
                                        <%
                                            String message = (String) request.getAttribute("MESSAGE");
                                            if (message != null) {
                                        %>
                                        <%=message%>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
