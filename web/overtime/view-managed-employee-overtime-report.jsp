<%-- 
    Document   : view-managed-employee-overtime-report
    Created on : Jul 8, 2023, 9:44:28 PM
    Author     : Hào Cute
--%>

<%@page import="overtime.OverTimeReport_DTO"%>
<%@page import="java.util.ArrayList"%>
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
                    <h1 class="fw-bold">Staff Report</h1>
                </div>
                 <div class="row">
                    <div class="col-lg-6">
                        <form action="OverTimeController">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter ID"  name="searchOverTimeReportById" >
                                <input class="form-control" type="date" name="searchOverTimeReportByDate" >
                                <input type="hidden" name="action" value="ViewManagedEmployeeOverTimeReport">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-success">Search</button>
                                </div>        
                            </div>                        

                        </form>
                    </div>
                </div>
                <br>
                <%
                    List<OverTimeReport_DTO> listReport = null;
                    listReport = (List<OverTimeReport_DTO>) request.getAttribute("LIST_MANAGED_EMPLOYEE_OVERTIME_REPORT");
                    if (listReport != null && !listReport.isEmpty()) {
                %>
                <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">

                                    <table class="table">                    <thead>
                                            <tr>
                                                <th>NO</th>
                                                <th>EmployeeID</th>
                                                <th>Date</th>
                                                <th>Date Type</th>
                                                <th>Date Name</th>
                                                <th>Hours</th>
                                                <th>Co-Salary</th>
                                                <th>Reason</th>
                                                <th>Status</th>
                                                <th>Response</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                String status = null;
                                                for (OverTimeReport_DTO report : listReport) {
                                            %>

                                        <form action="OverTimeController">
                                            <tr>
                                                <td><%=count%></td>
                                                <td><%=report.getEmployeeId()%></td>
                                                <td><%=report.getDateOT()%></td>
                                                <td><%=report.getDateType()%></td>
                                                <%
                                                    if(report.getDateName()==null || report.getDateName().trim().isEmpty()){
                                                        report.setDateName("None");
                                                    }
                                                %>
                                                <td><%=report.getDateName()%></td>
                                                <td><%=report.getOtHours()%></td>
                                                <td><%=report.getCoSalary()%></td>
                                                <%
                                                    if (report.getReason() == null) {
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
                                                    if (report.isIsStatus() == null) {
                                                        status = "Waiting";
                                                %>
                                                <%
                                                    } else if (report.isIsStatus() == true) {
                                                        status = "Approved";
                                                    } else {
                                                        status = "Rejected";
                                                    }
                                                %>
                                                <td><%=status%></td>
                                                <%
                                                    if (status.equals("Waiting")) {
                                                %>
                                            <input type="hidden" name="overTimeID" value="<%=report.getOverTimeId()%>">
                                            <input type="hidden" name="employeeId" value="<%=report.getEmployeeId()%>">
                                            <td><input type="text" name="reasonReject" value=""></td>
                                            <input type="hidden" name="action" value="ConfirmOverTime">
                                            <td>
                                                <input type="submit" name="confirm" value="Approve">
                                                <input type="submit" name="confirm" value="Reject">
                                            </td>
                                            <%
                                            } else {
                                                if (report.getReasonReject() == null || report.getReasonReject().isEmpty()) {
                                            %>
                                            <td>None</td>
                                            <%
                                            } else {
                                            %>

                                            <td><%=report.getReasonReject()%></td>
                                            <%
                                                    }
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
        </section>
    </body>
</html>