<%-- 
    Document   : showInformationEmployee
    Created on : Jul 2, 2023, 3:57:11 PM
    Author     : flami
--%>


<%@page import="employee.Employee_Info_DTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CANDIATE DETAIL</title>
        <link rel="stylesheet" href="CSS/profile.css"/>
    </head>
    <body>  <%
        Employee_Info_DTO employeeInfo = (Employee_Info_DTO) request.getAttribute("USER_INFO");
        if (employeeInfo == null) {
            employeeInfo = new Employee_Info_DTO();
        }
        %>  

        <!--    <div class="container">
                <img class="employee-image" src="<%=employeeInfo.getImage()%>" alt="Employee Image">
                <div class="info-row">
                    <span class="info-label">Employee ID:</span>
                    <span class="employee-info"><%= employeeInfo.getEmployeeID()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Full Name:</span>
                    <span class="employee-info"><%= employeeInfo.getFullName()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Gender:</span>
                    <span class="employee-info"><%= employeeInfo.getGender()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Date of Birth:</span>
                    <span class="employee-info"><%= employeeInfo.getDateOfBirth()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Phone Number:</span>
                    <span class="employee-info"><%= employeeInfo.getPhoneNumber()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Email:</span>
                    <span class="employee-info"><%= employeeInfo.getEmail()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Address:</span>
                    <span class="employee-info"><%= employeeInfo.getAddress()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Human ID:</span>
                    <span class="employee-info"><%= employeeInfo.getHumanId()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Nationality:</span>
                    <span class="employee-info"><%= employeeInfo.getNationality()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Active Status:</span>
                    <span class="employee-info"><%= employeeInfo.isIsActive()%></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Contract ID:</span>
                    <span class="employee-info"><%= employeeInfo.getContractID()%></span>
                </div>-->
        <section class="vh-80" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="<%=employeeInfo.getImage()%>"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />

                                    <h5><%= employeeInfo.getFullName()%></h5>

                                    <p>Candidate <br>
                                        ID: <%=employeeInfo.getEmployeeID()%><br/><p>

                                        <i class="far fa-edit mb-5"></i>
                                    <form action="EmployeeController" method="post">
                                        <input type="hidden" name="employeeID" value="<%=employeeInfo.getEmployeeID()%>">
                                        <input type="hidden" name="action" value="View Employee Contract Detail">
                                        <input class="btn btn-sm btn-outline-danger rounded-0" type="submit" value="View Contract">
                                    </form>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">

                                        <h5 style="text-align: center;">INFORMATION</h5>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Gender</h6>
                                                <p class="text-muted"><%= employeeInfo.getGender()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Date of birth</h6>
                                                <p class="text-muted"><%= employeeInfo.getDateOfBirth()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted"><%= employeeInfo.getEmail()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted"> <%= employeeInfo.getPhoneNumber()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted"><%= employeeInfo.getAddress()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Human ID</h6>
                                                <p class="text-muted"><%= employeeInfo.getHumanId()%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Nationality</h6>
                                                <p class="text-muted"><%= employeeInfo.getNationality()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Status Contract</h6>
                                                <p class="text-muted"><%="abc"%></p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-12 mb-6">
                                                <h6 style="text-align: center;">Notation</h6>
                                                <p class="text-muted" style="text-align: center;"><%= "abcd"%></p>
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



        <!--        <form action="EmployeeController" method="post">
                    <input type="hidden" name="employeeID" value="<%=employeeInfo.getEmployeeID()%>">
                    <input type="hidden" name="action" value="View Employee Contract Detail">
                    <input class="view-contract-btn" type="submit" value="View Contract">
                </form>-->
        <!--</div>-->
    </body>
</html>