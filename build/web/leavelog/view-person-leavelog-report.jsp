<%-- 
    Document   : view-person-leavelog-report
    Created on : Jul 9, 2023, 3:19:27 AM
    Author     : Hào Cute
--%>


<%@page import="leavelog.LeaveLog_DTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/view.css">

    </head>
    <body>
        <section class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">Personal Leave Log Report</h1>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="LeaveLogController">
                            <div class="input-group">
                                <input class="form-control" type="date" name="searchLeaveLogApplyByDate" >
                                <input type="hidden" name="action" value="ViewPersonLeaveLogApplication">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-success">Search</button>
                                </div>     
                            </div>

                        </form>
                    </div>
                </div>
                <br>
                <%
                    List<LeaveLog_DTO> listReport = null;
                    listReport = (List<LeaveLog_DTO>) request.getAttribute("LIST_PERSON_LEAVELOG_APPLY");
                    if (listReport != null) {
                %>

                <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>NO</th>
                                                <th>Date</th>
                                                <th>Reason</th>
                                                <th>Status</th>

                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                String status = null;
                                                for (LeaveLog_DTO report : listReport) {
                                            %>

                                        <form action="LeaveLogController">
                                            <tr>
                                                <td><%=count%></td>
                                                <td><%=report.getDateLeave()%></td>
                                                <%
                                                    if (report.getReason() == null || report.getReason().isEmpty()) {
                                                        report.setReason("None");
                                                    }
                                                %>
                                                <td><%=report.getReason()%></td>
                                                <%
                                                    if (report.getIsStatus() == null) {
                                                        status = "Waiting";
                                                %>
                                                <%
                                                    } else if (report.getIsStatus() == true) {
                                                        status = "Approved";
                                                    } else {
                                                        status = "Rejected";
                                                    }
                                                %>
                                                <td><%=status%></td>
                                                <%
                                                    if (status.equals("Waiting") || status.equals("Rejected")) {
                                                %>
                                            <input type="hidden" name="leaveLogID" value="<%=report.getLeaveLogID()%>">
                                            <input type="hidden" name="dateLeave" value="<%=report.getDateLeave()%>">
                                            <input type="hidden" name="action" value="EditLeaveLogButton">
                                            <td>
                                                <input type="submit" name="confirm" value="Edit" class="btn btn-success">
                                            </td>
                                            <%
                                                }
                                            %>
                                            </tr>
                                        </form>
                                        <%
                                                count += 1;
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                    <%
                                        }
                                    %>
                                    <%
                                        String message = (String) request.getParameter("MESSAGE");
                                        if (message != null) {
                                    %>
                                    <%=message%>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
