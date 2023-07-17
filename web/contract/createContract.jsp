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
            if (candidateDetail != null) {
                TemporaryContractDTO tempContract = (TemporaryContractDTO) request.getAttribute("TEMPORARY_CONTRACT");
                String status = "";
                if (tempContract == null || tempContract.getStatus() == null) {
                    status = "None";
                } else {
                    status = tempContract.getStatus();
                }
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
        %>
    </body>
</html>
