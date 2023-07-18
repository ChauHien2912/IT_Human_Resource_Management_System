<%-- 
    Document   : rejectForm
    Created on : Jun 22, 2023, 9:35:25 PM
    Author     : flami
--%>

<%@page import="userlogin.User_Login_DTO"%>
<%@page import="contract.TemporaryContractDTO"%>
<%@page import="candidate.CandidateDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/profile.css"/>
    </head>
    <body>

        <%
            CandidateDTO candidateDetail = (CandidateDTO) request.getAttribute("CANDIDATE");
            TemporaryContractDTO tempContract = (TemporaryContractDTO) request.getAttribute("TEMPORARY_CONTRACT");
            String status = "";
            if (candidateDetail != null && tempContract != null) {
                if (tempContract == null || tempContract.getStatus() == null)
                    status = "None";
                else
                    status = tempContract.getStatus();
        %>  

        <section class="vh-80" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12">
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
                                        <%
                                            if (tempContract.getReason() == null) {
                                                tempContract.setReason("");
                                            }
                                        %>
                                        <%=tempContract.getReason()%><br/>
                                        <%
                                            String roleName;
                                            HttpSession Session = request.getSession();
                                            User_Login_DTO userLogin = (User_Login_DTO) Session.getAttribute("USER_LOGIN");
                                            roleName = userLogin.getRoleName();
                                            if (roleName.equals("HRM")) {
                                        %>
                                    <form action="ContractController">
                                        <input type="hidden" name="candidateID" value="<%= candidateDetail.getId()%>"/>
                                        <input type="hidden" name="contractID" value="<%= tempContract.getContractID()%>"/>

                                        <input class="btn btn-sm btn-outline-danger rounded-0" type="submit" target="_blank"  name="action" value="Print Contract"/>

                                        <input class="btn btn-sm btn-outline-danger rounded-0" type="submit" name="action" value="Approve Contract"/>

                                        <input class="btn btn-sm btn-outline-danger rounded-0" type="submit" name="action" value="Reject Contract"/>
                                        <br><br>
                                        <div><input placeholder="Description.." type="text" name="description"></div>            
                                    </form>
                                    <%
                                    } else if (roleName.equals("HRS")) {
                                    %>

                                    <form action="ContractController" target="_blank">
                                        <input type="hidden" name="candidateID" value="<%= candidateDetail.getId()%>"/>
                                        <input type="hidden" name="contractID" value="<%= tempContract.getContractID()%>"/>
                                        <input type="submit" class="btn btn-sm btn-outline-danger rounded-0" name="action" value="Print Contract"><br>
                                        <!--<input type="submit" name="action" value="Delete Contract"/><br>-->       
                                    </form>   

                                    <%
                                        if (status.equals("APPROVED")) {
                                    %>
                                    <br>
                                    <form action="ContractController" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="candidateID" value="<%= candidateDetail.getId()%>"/>
                                        <input type="hidden" name="contractID" value="<%= tempContract.getContractID()%>"/>
                                        <input type="file" name="fileContract" value="Browse" class="btn btn-sm btn-outline-danger rounded-0" multiple>
                                        <input type="submit" class="btn btn-sm btn-outline-danger rounded-0" name="action" value="Apply Contract" ><br>
                                        <!--<input type="submit" name="action" value="Delete Contract"/><br>-->       
                                    </form> 
                                    <%
                                        }
                                    %>

                                    <%
                                        if (tempContract.getStatus().equals("REJECTED")) {
                                    %>
                                    <br>
                                    <form action="ButtonUpdateCandidateContract">
                                        <input type="hidden" name="candidateID" value="<%=candidateDetail.getId() %>">
                                        <input type="hidden" name="tempContractID" value="<%=tempContract.getContractID() %>">
                                        <input type="submit" class="btn btn-sm btn-outline-danger rounded-0" name="action" value="Update Contract"><br>          
                                    </form>
                                    <%
                                                }
                                            }
                                        }
                                        String errMessage = (String) request.getAttribute("ERROR_MESSAGE");
                                        if (errMessage == null) {
                                            errMessage = "";
                                        }
                                    %>
                                    <h4><%=errMessage%></h4>
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
                                                <h6>Notation</h6>
                                                <p class="text-muted"><%=candidateDetail.getNotation()%></p>
                                            </div>
                                        </div>
                                        <h5 style="text-align: center;">CONTRACT</h5>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Status Contract</h6>
                                                <p class="text-muted"><%=status%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Contract ID</h6>
                                                <p class="text-muted"><%=tempContract.getContractID()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Creator ID</h6>
                                                <p class="text-muted"> <%=tempContract.getCreatorID()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Salary</h6>
                                                <p class="text-muted"> <%=tempContract.getSalary()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Allowance</h6>
                                                <p class="text-muted"> <%=tempContract.getAllowance()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Start Date</h6>
                                                <p class="text-muted"> <%=tempContract.getAllowance()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Description</h6>
                                                <%
                                                    if (tempContract.getDescription() == null
                                                            || tempContract.getDescription().trim().isEmpty()) {
                                                        tempContract.setDescription("None");
                                                    }
                                                %>
                                                <p class="text-muted"> <%=tempContract.getDescription()%><br/></p>
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

    </body>
</html>
