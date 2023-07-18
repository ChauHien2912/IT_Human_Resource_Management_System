<%-- 
    Document   : view-personal-overtime-report
    Created on : Jul 8, 2023, 9:43:53 PM
    Author     : Hào Cute
--%>

<%@page import="overtime.OverTimeReport_DTO"%>
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
                    <h1 class="fw-bold">Personal Report</h1>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="OverTimeController">
                            <div class="input-group">
                                <input class="form-control" type="date"  name="searchOverTimeReportByDate" >
                                <input type="hidden" name="action" value="ViewPersonOverTimeReport">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-success">Search</button>
                                </div>                                                </div>
                        </form>
                    </div>
                </div>
                <br>      
                <%
                    List<OverTimeReport_DTO> listReport = null;
                    listReport = (List<OverTimeReport_DTO>) request.getAttribute("LIST_PERSON_OVERTIME_REPORT");
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
                                                <th>Date Type</th>
                                                <th>Date Name</th>
                                                <th>Hours</th>
                                                <th>Co-Salary</th>
                                                <th>Reason</th>
                                                <th>Status</th>
                                                <th>Response</th>
                                                <th>Edit</th>
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
                                                <td><%=report.getDateOT()%></td>
                                                <td><%=report.getDateType()%></td>
                                                <td><%=report.getDateName()%></td>
                                                <td><%=report.getOtHours()%></td>
                                                <td><%=report.getCoSalary()%></td>
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
                                                    if (report.getReasonReject() == null || report.getReasonReject().isEmpty()) {
                                                %>
                                                <td>None</td>
                                                <%
                                                } else {
                                                %>
                                                <td><%=report.getReasonReject()%></td>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (status.equals("Waiting") || status.equals("Rejected")) {
                                                %>
                                            <input type="hidden" name="overTimeID" value="<%=report.getOverTimeId()%>">
                                            <input type="hidden" name="dateOT" value="<%=report.getDateOT()%>">
                                            <input type="hidden" name="action" value="EditOverTimeButton">
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