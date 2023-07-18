<%-- 
    Document   : createContract
    Created on : Jul 17, 2023, 12:21:11 AM
    Author     : flami
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="contract.ContractError"%>
<%@page import="contract.TemporaryContractDTO"%>
<%@page import="candidate.CandidateDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Contract Page</title>
    </head>
    <body>
        <!--Contract Form-->  
        <%
            CandidateDTO candidateDetail = (CandidateDTO) request.getAttribute("CANDIDATE");
            TemporaryContractDTO tempContract = (TemporaryContractDTO) request.getAttribute("TEMPORARY_CONTRACT");
            ContractError conErr = (ContractError) request.getAttribute("ERROR_CONTRACT");
            if (conErr == null) {
                conErr = new ContractError();
            }
        %>
        <div class="container">  
            <form class="card mb-3 shadow" action="ContractController" method="POST">
                <br>
                <h1 style="text-align: center;">Create Contract</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                            <label for="date"><h3>Start Date</h3></label><br/>
                            <input style="width: 100%; height: 2.5em" type="date" name="startDate" min="<%=LocalDate.now().toString()%>"
                                   value="<%= (tempContract != null) ? tempContract.getStartDate() : ""%>" tabindex="1" required=""><br/>
                                           </div>
                            <div class="col-md-6 form-group">

                          <label for="date"><h3>Salary</h3></label><br/>
                            <input style="width: 100%; height: 2.5em" type="text" placeholder="Your salary here" name="salary" 
                                   <%
                                       String salary = (String) request.getAttribute("SALARYSTRING");
                                       if (salary == null) {
                                           salary = "";
                                       }
                                   %>
                                   value="<%=salary%>" tabindex="2" required=""><br/>
                            <%=conErr.getSalaryError()%>   
                            </div>
                        
                        </div>
                       
                        <div class="row mb-2">
                                                        <div class="col-md-12 form-group">
                            <label for="description"><h3>Notation</h3></label><br/>
                            <input style="width: 100%; height: 5em" placeholder="Type your Message Here...." name="description"
                                   value="<%= tempContract == null ? "" : tempContract.getDescription()%>" type="text"tabindex="3"><br/><br/>
                            <%=conErr.getNotationError()%>   
                                                        </div>
                                                    </div>
                        <div class="box-footer text-center">
                            <input type="hidden" name="candidateID"  value="<%=candidateDetail.getId()%>">
                            <input type="reset"class="btn btn-sm btn-outline-success rounded-0" tabindex="4">
                            <input name="action" type="submit" class="btn btn-sm btn-outline-success rounded-0"  value="Create Contract" tabindex="5">
                            <div class="errorMessage">  
                                <%=conErr.getOtherError()%>     
                          </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
