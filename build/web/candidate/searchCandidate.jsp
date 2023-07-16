<%-- 
    Document   : viewCandidate
    Created on : Jun 16, 2023, 1:27:26 PM
    Author     : flami
--%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
                %>
                <div class="row">
                    <div class="col-lg-6">
                        <form action="CandidateController">
                            <div class="input-group">
                                <input type="text" class="form-control" name="search" placeholder="Name of Candidate" >
                                <input type="hidden" name="action" value="Search Candidate"/>
                                <input class="btn btn-success" type="submit" value="Search"/> 
                            </div>
                        </form>
                    </div>
                </div>
                <br>
                <!--Print List-->    
                <%
                    List<CandidateDTO> listCandidate = (List<CandidateDTO>) request.getAttribute("LIST_CANDIDATE");
                    if ((listCandidate == null || listCandidate.isEmpty()) && !search.equals("")) {
                %>
                <h3>No record!</h3>
                <%
                    }
                    if (listCandidate != null) {
                        if (!listCandidate.isEmpty()) {
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
                                                <th>ID</th>
                                                <th>Full Name</th>
                                                <th>Gender</th>
                                                <th>Date Of Birth</th>
                                                <th>Phone Number</th>
                                                <th>Address</th>
                                                <th>Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                for (CandidateDTO candidate : listCandidate) {
                                            %> 
                                        <form action="CandidateController">
                                            <tr>
                                                <td><%= count++%></td>
                                                <td><%= candidate.getId()%></td>
                                                <td><%= candidate.getFullName()%></td>
                                                <td><%= candidate.getGender()%></td>
                                                <td><%= candidate.getDateOfBrith()%></td>
                                                <td><%= candidate.getPhoneNumber()%></td>
                                                <td><%= candidate.getAddress()%></td>
                                                <td class="d-flex gap-2 justify-content-between">
                                                    <input  class="btn btn-sm btn-outline-danger rounded-0" type="submit" value="Show Detail"/>                            
                                                    <input type="hidden" name="action" value="Show Candidate Detail"/>
                                                    <input type="hidden" name="candidateID" value="<%= candidate.getId()%>"/>
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
    </body>

</html>