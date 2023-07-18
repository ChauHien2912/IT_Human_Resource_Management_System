<%-- 
    Document   : PayRoll
    Created on : Jun 20, 2023, 1:03:16 AM
    Author     : CAO-KIEN-QUOC
--%>
<%@page import="java.util.List"%>
<%@page import="payroll.Payroll_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <section class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">Payroll Information</h1>
                </div>
                <%
                    List<Payroll_DTO> listPayRoll = (List<Payroll_DTO>) request.getAttribute("LIST_PAYROLL");
                    if (listPayRoll != null) {
                        if (listPayRoll.size() > 0) {
                %>    
                <div class="row">

                    <div class="col-lg-12">


                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">

                                <div clas="table-responsive">
                                    <table class="table">  
                                        <thead>
                                            <tr>
                                                <th>Pay ID</th>
                                                <th>employee ID</th>
                                                <th>paid Date</th>
                                                <th>office Hours</th>
                                                <th>ot Hours</th>
                                                <th>ot_income</th>
                                                <th>stand_income</th>
                                                <th>BHXH</th>
                                                <th>BHTN</th>
                                                <th>TNCN</th>
                                                <th>allowance</th>
                                                <th>total</th>
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
                                                <td><%= payRoll.getPaidDate()%></td>
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
                                    <br><h3><%=mes%></h3>    
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </body>  
</html>
