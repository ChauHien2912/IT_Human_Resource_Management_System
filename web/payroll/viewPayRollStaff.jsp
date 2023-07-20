<%-- 
    Document   : viewPayRollStaff
    Created on : Jul 18, 2023, 1:35:31 AM
    Author     : PC-CAOKIENQUOC
--%>

<%@page import="java.util.List"%>
<%@page import="payroll.Payroll_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View PayRoll Staff Page</title>
    </head>
    <body>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <section class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">Staff Report</h1>
                </div>
        <%
            List<Payroll_DTO> listPayRoll = (List<Payroll_DTO>) request.getAttribute("LIST_PAYROLL_STAFF");
            if(listPayRoll==null || listPayRoll.isEmpty()){
            %>
            <h3>Payroll is empty!!!!</h3>
            <%
            }
            if (listPayRoll != null) {
                if (listPayRoll.size() > 0) {
        %>    
  <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">

                                    <table class="table">               <thead>
                <tr>
                    <th>Pay ID</th>
                    <th>Employee ID</th>
                    <th>Month</th>
                    <th>Office Hours</th>
                    <th>Ot Hours</th>
                    <th>Ot_income</th>
                    <th>Stand_income</th>
                    <th>BHXH</th>
                    <th>BHTN</th>
                    <th>TNCN</th>
                    <th>Allowance</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Payroll_DTO payRoll : listPayRoll) {
                %>
            <form action="PayrollController">
                <tr>   
                    <td><%= payRoll.getPayID()%></td>
                    <td><%= payRoll.getEmployeeID()%></td>
                    <td><%= payRoll.getMonth()%></td>
                    <td><%= payRoll.getOfficeHours()%></td>
                    <td><%= payRoll.getOtHours()%></td>
                    <td><%= payRoll.getOt_income()%></td>
                    <td><%= payRoll.getStand_income()%></td>
                    <td><%= payRoll.getBHXH()%></td>
                    <td><%= payRoll.getBHTN()%></td>
                    <td><%= payRoll.getTNCN()%></td>
                    <td><%= payRoll.getAllowance()%></td>
<!--                    <td><%= payRoll.getTotalHours()%></td>-->
                    <td><%= payRoll.getTotal()%></td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>
    <%
            }
        }
    %>
    <%
        String mes = (String) request.getAttribute("MESSAGE");
        if (mes == null) {
            mes = "";
        }
    %>
    <%=mes%> </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    
    </body>
</html>
