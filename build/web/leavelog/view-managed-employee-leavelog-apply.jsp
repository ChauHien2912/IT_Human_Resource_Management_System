<%-- 
    Document   : view-managed-employee-leavelog-apply
    Created on : Jul 9, 2023, 2:43:41 AM
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
        <div class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">Staff Report</h1>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="LeaveLogController">
                            <div class="input-group">
                                <input class="form-control" type="text"  placeholder="Enter ID" name="searchLeaveLogApplyById" >
                                <input class="form-control" type="date" name="searchLeaveLogApplyByDate" >
                                <input type="hidden" name="action" value="ViewManagedEmployeeLeaveLogApplication">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-success">Search</button>
                                </div>                                                         </div>                        
                        </form>
                    </div>
                </div>
                <br>
                <%
                    List<LeaveLog_DTO> listReport = null;
                    listReport = (List<LeaveLog_DTO>) request.getAttribute("LIST_MANAGED_EMPLOYEE_LEAVELOG_APPLY");
                    if (listReport != null) {
                %>
                <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">

                                    <table class="table">            <thead>
                                            <tr>
                                                <th>NO</th>
                                                <th>Date</th>
                                                <th>Reason</th>
                                                <th>Status</th>
                                                <th></th>
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
                                                %>
                                                <td>None</td>
                                                <%
                                                } else {
                                                %>
                                                <td><%=report.getReason()%></td>
                                                <%
                                                    }
                                                %>
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
                                                    if (status.equals("Waiting")) {
                                                %>
                                            <input type="hidden" name="leaveLogID" value="<%=report.getLeaveLogID()%>">
                                            <input type="hidden" name="employeeId" value="<%=report.getEmployeeId()%>">
                                            <input type="hidden" name="action" value="ConfirmLeaveLog">
                                            <td>
                                                <input type="submit" name="confirm" value="Approve">
                                                <input type="submit" name="confirm" value="Reject">

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
                                        String message = (String) request.getAttribute("MESSAGE");
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
        </div>
    </body>
</html>
