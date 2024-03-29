<%-- 
    Document   : updateContract
    Created on : Jun 25, 2023, 10:32:15 AM
    Author     : flami
--%>


<%@page import="java.time.LocalDate"%>
<%@page import="contract.ContractError"%>
<%@page import="contract.TemporaryContractDTO"%>
<%@page import="candidate.CandidateDTO"%>
<%@page import="candidate.CandidateError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CANDIDATE FORM</title>
        <link rel="stylesheet" href="CSS/candidate.css"/>
    </head>
    <body>
        <%
            CandidateError candidateError = (CandidateError) request.getAttribute("CANDIDATE_ERROR");
            if (candidateError == null) {
                candidateError = new CandidateError();
            }

            ContractError conErr = (ContractError) request.getAttribute("ERROR_CONTRACT");
            if (conErr == null) {
                conErr = new ContractError();
            }

            CandidateDTO candidate = (CandidateDTO) request.getAttribute("CANDIDATE");
            if (candidate == null) {
                candidate = (CandidateDTO) session.getAttribute("CANDIDATE");
            }

            TemporaryContractDTO tempContract = (TemporaryContractDTO) request.getAttribute("TEMPORARY_CONTRACT");
            if (tempContract == null) {
                tempContract = (TemporaryContractDTO) session.getAttribute("TEMPORARY_CONTRACT");
            }
            if (tempContract != null && candidate != null) {
        %>
        <div class="container">  
            <form class="card mb-3 col-12-md shadow" id="contact" action="ContractController" method="post" enctype="multipart/form-data">
                <br>
                <h1 style="text-align: center;" class="fw-bold">Update Contract</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="text">Full Name</label>
                                <input style="width: 100%; height: 2.5em"  placeholder="Jony Dang" type="text" name="fullName" 
                                       value="<%=candidate.getFullName()%>" tabindex="1" 
                                       required autofocus>
                                <div class="errorMessage">  
                                    <%= candidateError.getFullNameError()%>                       
                                </div>
                            </div>     

                            <div class="col-md-6 form-group">
                                <label for="gender">Gender</label><br/>
                                <select style="width: 100%; height: 2.5em" name="gender" class="gender" tabindex="2" value="<%=candidate.getGender()%>">
                                    <option value="male" <%= candidate.getGender() != null
                                            && candidate.getGender().equals("male")
                                            ? "selected" : ""%>>Male</option>
                                    <option value="female" <%= candidate.getGender() != null
                                            && candidate.getGender().equals("female")
                                            ? "selected" : ""%>>Female</option>
                                    <option value="other" <%= candidate.getGender() != null
                                            && candidate.getGender().equals("other")
                                            ? "selected" : ""%>>Other</option>
                                </select>
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <label for="phoneNumber">Phone Number</label><br>
                                <input style="width: 100%; height: 2.5em"  placeholder="0706600127" type="tel" name="phoneNumber"
                                       value="<%=candidate.getPhoneNumber()%>" tabindex="4" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getPhoneNumberError()%>                       
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="date">Date Of Birth</label><br/>
                                <input style="width: 100%; height: 2.5em" type="date" id="birthdate" name="dateOfBirth" 
                                       value="<%= candidate.getDateOfBrith() != null
                                               ? candidate.getDateOfBrith().toString() : ""%>"
                                       min="1963-01-01" max="2005-01-01" tabindex="3" required>
                            </div>
                        </div>
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="email">Email</label>
                                <input style="width: 100%; height: 2.5em" placeholder="abc@xyz.com" type="email" name="email" 
                                       value="<%=candidate.getEmail()%>" tabindex="5" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getEmailError()%>                       
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="address">Address</label>
                                <input style="width: 100%; height: 2.5em" placeholder="Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam"
                                       type="text" name="address" value="<%=candidate.getAddress()%>" 
                                       tabindex="6" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getAddressError()%>                       
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="humanId">Human Id</label>
                                <input style="width: 100%; height: 2.5em" placeholder="xxxx xxxx xxxx" type="text" name="humanId" 
                                       value="<%=candidate.getHumanId()%>" tabindex="7" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getHumanIdEror()%>                       
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="nationality">Nationality</label>
                                <input style="width: 100%; height: 2.5em" placeholder="Viet Nam" type="text" name="nationality"
                                       value="<%=candidate.getNationality()%>" tabindex="8" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getNationalityError()%>                       
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="notation">Notation</label> <br/>
                                <input style="width: 100%; height: 2.5em" placeholder="Type your Message Here...." type="text" 
                                       name="notation" value="<%=candidate.getNotation()%>" 
                                       tabindex="9" ></input>
                                <div class="errorMessage">  
                                    <%= candidateError.getNotationError()%>                       
                                </div>                     
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="image">Image</label><br/>
                                <input style="width: 100%; height: 2.5em" type="file" name="image" tabindex="10" >
                                <div class="errorMessage">  
                                    <%= candidateError.getImageError()%>                       
                                </div>      
                            </div>
                        </div>
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="date">Start Date</label><br/>
                                <input style="width: 102%; height: 2.5em" type="date" name="startDate" min="<%=tempContract.getStartDate().toString()%>"
                                       value="<%=tempContract.getStartDate()%>" tabindex="11">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="salary">Salary</label><br/>
                                <input style="width: 100%; height: 2.5em" type="text" name="salary" 
                                       <%
                                           String salary;
                                           if (tempContract.getSalary() == 0)
                                               salary = "";
                                           else
                                               salary = String.valueOf(tempContract.getSalary());
                                       %>
                                       value="<%=salary%>" tabindex="12" required>
                                <%=conErr.getSalaryError()%>   
                            </div>

                        </div>
                        <div class="row mb-2">

                            <div class="col-md-6 form-group">
                                <label for="discription">Notation Of Contract</label><br/>
                                <input style="width: 100%; height: 2.5em" placeholder="Type your Message Here...." name="discription"
                                       <%
                                           if (tempContract.getDescription() == null)
                                               tempContract.setDescription("");
                                       %>
                                       value="<%=tempContract.getDescription()%>" type="text"
                                       tabindex="13">
                                <div class="errorMessage">  
                                    <%=conErr.getNotationError()%>                       
                                </div>                     
                            </div>
                        </div><br>
                        <div class="row mb-2"> 
                            <div class="col-md-6 form-group">
                                <input type="hidden" name="candidateID" value="<%=candidate.getId()%>"/>
                                <input type="hidden" name="contractID" value="<%=tempContract.getContractID()%>"/>
                                <input class="btn btn-sm btn-outline-danger rounded-0" name="action" type="hidden" value="Update Contract"/>
                                <input class="btn btn-sm btn-outline-danger rounded-0" type="reset" tabindex="14">
                                <input class="btn btn-sm btn-outline-danger rounded-0" type="submit"  value="Update" tabindex="15">
                                <div class="errorMessage">  
                                    <%=conErr.getOtherError()%>      
                                </div>
                            </div>   
                        </div>
                        <div class="errorMessage">  
                            <%= candidateError.getMessageError()%>                       
                        </div>
                        </form>
                    </div>
                    <%
                        }
                    %>
                </div>
        </div>

</body>
</html>

