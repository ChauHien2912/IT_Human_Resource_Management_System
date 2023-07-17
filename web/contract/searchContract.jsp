<%-- 
    Document   : viewCandidate
    Created on : Jun 16, 2023, 1:27:26 PM
    Author     : flami
--%>

<%@page import="contract.TemporaryContractDTO"%>
<%@page import="contract.CandidateContractDTO"%>
<%@page import="contract.CandidateContractDTO"%>
<%@page import="java.util.List"%>
<%@page import="candidate.CandidateDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responesive Admin Dashboard | Redesign</title>

    </head>

    <body>


        <section class="py-1">
            <div class="container">
                <div>
                    <h1 class="fw-bold">Table</h1>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Asperiores, perspiciatis.</p>
                </div>
                <%
                    String search = (String) request.getParameter("search");
                    if (search == null) {
                        search = "";
                    }
                    String statusContract = (String) request.getAttribute("STATUS_CONTRACT");
                %>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="ContractController">
                            <div class="input-group">
                                <select name="statusContract" class="gender" tabindex="1">
                                    <option value="All" <%= statusContract != null
                                            && statusContract.equals("All")
                                            ? "selected" : ""%>>All</option>
                                    <option value="Rejected" <%= statusContract != null
                                            && statusContract.equals("Rejected")
                                            ? "selected" : ""%>>Rejected</option>
                                    <option value="Approved" <%= statusContract != null
                                            && statusContract.equals("Approved")
                                            ? "selected" : ""%> >Approved</option>
                                    <option value="Processing"  <%= statusContract != null
                                            && statusContract.equals("Processing")
                                            ? "selected" : ""%>>Processing</option>
                                </select>
                                <input type="text" name="search" class="form-control" value="<%= search%>"/>
                                <input type="hidden" name="action" value="Search Contract"/>
                                <input class="btn btn-success" type="submit" value="Search"/>
                            </div>
                        </form>
                    </div>
                </div>
                <br>
                <!--Print List-->    
                <%
                    List<CandidateContractDTO> listCandidateContract = (List<CandidateContractDTO>) request.getAttribute("LIST_CANDIDATE_CONTRACT");
                    if ((listCandidateContract == null || listCandidateContract.isEmpty()) && !search.equals("")) {
                %>
                <h2>No record!</h2>
                <%
                    }
                    if (listCandidateContract != null) {
                        if (!listCandidateContract.isEmpty()) {
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card p-4 rounded-0 shadow">
                            <div class="card-body">
                                <div clas="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID Contract</th>
                                                <th>Full Name</th>
                                                <th>Start Date</th>
                                                <th>Salary</th>
                                                <th>Status</th>
                                                <th>Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <%
                                                    int count = 1;
                                                    for (CandidateContractDTO candidateContract : listCandidateContract) {
                                                        CandidateDTO candidate = candidateContract.getCandidate();
                                                        TemporaryContractDTO tempContract = candidateContract.getTempCont();
                                                %>   
                                        <form action="ContractController" method="POST">
                                            <tr>
                                                <td><%= count++%></td>
                                                <td><%= tempContract.getContractID()%></td>
                                                <td><%= candidate.getFullName()%></td>
                                                <td><%= String.valueOf(tempContract.getStartDate())%></td>
                                                <td><%= tempContract.getSalary()%></td>
                                                <td><%= tempContract.getStatus()%></td>                        
                                                <td class="d-flex gap-2 justify-content-between">
                                                    <input type="hidden" name="action" value="Show Detail Temporary Contract"/>
                                                    <input type="hidden" name="candidateID" value="<%= candidate.getId()%>"/>
                                                    <input type="hidden" name="contractID" value="<%= tempContract.getContractID()%>"/>
                                                    <input type="hidden" name="statusContract" value="<%=statusContract%>"/>
                                                    <input class="btn btn-sm btn-outline-danger rounded-0" type="submit" value="Show Detail"/>
                                                </td>
                                            </tr>                
                                        </form>

                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                    <%
                                            }
                                        }
                                    %>


                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>

    <body/>           
</html>