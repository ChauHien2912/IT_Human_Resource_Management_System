<%-- 
    Document   : showDetaiCandidate
    Created on : Jun 16, 2023, 3:01:15 AM
    Author     : flami
--%>

<%@page import="contract.TemporaryContractDTO"%>
<%@page import="contract.ContractError"%>
<%@page import="java.time.LocalDate"%>
<%@page import="candidate.CandidateDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CANDIATE DETAIL</title>
        <link rel="stylesheet" href="CSS/profile.css"/>
    </head>
    <body>
        <%
            CandidateDTO candidateDetail = (CandidateDTO) request.getAttribute("CANDIDATE");
            if (candidateDetail != null) {
                TemporaryContractDTO tempContract = (TemporaryContractDTO) request.getAttribute("TEMPORARY_CONTRACT");
                String status = "abc";
                if (tempContract == null || tempContract.getStatus() == null) {
                    status = "None";
                } else {
                    status = tempContract.getStatus();
                }

        %>  
        <section class="vh-80" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-8 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="<%=candidateDetail.getImage()%>"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />

                                    <h5><%= candidateDetail.getFullName()%></h5>

                                    <p>Candidate <br>
                                        ID: <%=candidateDetail.getId()%><br/><p>

                                        <i class="far fa-edit mb-5"></i>
                                        <!--Update Form-->  
                                        <%
                                            if (status.equals("REJECTED") || status.equals("None")) {
                                        %>
                                    <div>
                                        <form action="CandidateController" method="POST">
                                            <input type="hidden" name="candidateID" value="<%=candidateDetail.getId()%>">
                                            <input name="action" class="btn btn-sm btn-outline-danger rounded-0"
                                                   type="submit"  value="Update" tabindex="2">
                                        </form>            
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">

                                        <h5 style="text-align: center;">INFORMATION</h5>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Gender</h6>
                                                <p class="text-muted"><%= candidateDetail.getGender()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Date of birth</h6>
                                                <p class="text-muted"><%= candidateDetail.getDateOfBrith()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted"><%= candidateDetail.getEmail()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted"> <%= candidateDetail.getPhoneNumber()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted"><%= candidateDetail.getAddress()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Human ID</h6>
                                                <p class="text-muted"><%= candidateDetail.getHumanId()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Nationality</h6>
                                                <p class="text-muted"><%= candidateDetail.getNationality()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Status Contract</h6>
                                                <p class="text-muted"><%=status%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-12 mb-6">
                                                <h6 style="text-align: center;">Notation</h6>
                                                <p class="text-muted" style="text-align: center;"><%= candidateDetail.getNotation()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


            <%
                ContractError contractErr = new ContractError();

                if (tempContract == null) {
                    tempContract = new TemporaryContractDTO();
                }
            %>


            <!--Contract Form-->  
            <%
                String statusContract = (String) request.getAttribute("STATUS_CONTRACT");
                if (statusContract != null) {
            %>
            <p><%=statusContract%></p>
            <%
            } else {
                ContractError conErr = (ContractError) request.getAttribute("ERROR_CONTRACT");
                if (conErr == null) {
                    conErr = new ContractError();
                }

                if (!status.equals("None")) {
                %>
                <p>Contract of this candidate is created</p>
                <%
                } else {
                    %>
                    <form action="ContractController" method="POST">

                        <label for="date">Start Date</label><br/>
                        <input type="date" name="startDate" min="<%=LocalDate.now().toString()%>"
                               value="<%=tempContract.getStartDate()%>" tabindex="1">

                        <label for="date">Salary</label><br/>
                        <input type="text" name="salary" 
                               <%
                                   String salary = (String) request.getAttribute("SALARYSTRING");
                                   if (salary == null) {
                                       salary = "";
                                   }
                               %>
                               value="<%=salary%>" tabindex="2" required>
                        <%=conErr.getSalaryError()%>   
                        <label for="description">Notation</label><br/>
                        <input placeholder="Type your Message Here...." name="description"
                               <%
                                   if (tempContract.getDescription() == null)
                                       tempContract.setDescription("");
                               %>
                               value="<%=tempContract.getDescription()%>" type="text"tabindex="3">
                        <%=conErr.getNotationError()%>                            
                        <input type="hidden" name="candidateID" value="<%=candidateDetail.getId()%>">
                        <input type="reset" tabindex="4">
                        <input name="action" type="submit"  value="Create Contract" tabindex="5">
                        <div class="errorMessage">  
                            <%=conErr.getOtherError()%>                       
                        </div>   
                    </form>
                    <%
                }
            }
        }
        %>
    </body>
</html>
