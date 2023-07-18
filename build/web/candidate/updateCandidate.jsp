<%-- 
    Document   : newjsp
    Created on : Jul 19, 2023, 3:16:28 AM
    Author     : admin
--%>

<%@page import="candidate.CandidateError"%>
<%@page import="candidate.CandidateDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/candidate.css"/>
    </head>
    <body>
        <%
            CandidateError candidateError = (CandidateError) request.getAttribute("CANDIDATE_ERROR");
            if (candidateError == null) {
                candidateError = new CandidateError();
            }

            CandidateDTO candidate = (CandidateDTO) session.getAttribute("CANDIDATE");
            if (candidate == null) {
                candidate = (CandidateDTO) request.getAttribute("CANDIDATE");
                if (candidate == null) {
                    candidate = new CandidateDTO();
        %>
        <h1></h1>
        <%
                }
            }
        %>
        <div class="container">  
            <form id="contact" action="CandidateController" method="post" enctype="multipart/form-data">
                <br>
                <h1 style="text-align: center;" class="fw-bold">Update Candidate Form</h1><br>
                <div class="content col-12-md">
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="col-md-4 form-group">
                                <br><h4>Full Name</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="Jony Dang" type="text" name="fullName" 
                                       value="<%=candidate.getFullName()%>" tabindex="1" 
                                       required autofocus>
                                <div class="errorMessage">  
                                    <%= candidateError.getFullNameError()%>                       
                                </div>
                            </div>
                            <div class="col-md-4 form-group">
                                <br><h4>Gender</h4>
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
                            <div class="col-md-4 form-group">
                                <br><h4>Phone</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="0706600127" type="tel" name="phoneNumber"
                                       value="<%=candidate.getPhoneNumber()%>" tabindex="4" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getFullNameError()%>                       
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4>Email</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="abc@xyz.com" type="email" name="email" 
                                       value="<%=candidate.getEmail()%>" tabindex="5" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getEmailError()%>                       
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <br><h4>Date Of Birth</h4>
                                <input style="width: 100%; height: 2.5em" type="date" id="birthdate" name="dateOfBirth" 
                                       value="<%= candidate.getDateOfBrith() != null
                                               ? candidate.getDateOfBrith().toString() : ""%>"
                                       min="1963-01-01" max="2005-01-01" tabindex="3" required>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4>Address</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam"
                                       type="text" name="address" value="<%=candidate.getAddress()%>" 
                                       tabindex="6" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getAddressError()%>                  
                                </div> 
                            </div>
                            <div class="col-md-6 form-group">
                                <br><h4>Human Id</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="xxxx xxxx xxxx" type="text" name="humanId" 
                                       value="<%=candidate.getHumanId()%>" tabindex="7" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getHumanIdEror()%>                       
                                </div>
                            </div> 
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">
                                <br><h4>Nationality</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="Viet Nam" type="text" name="nationality"
                                       value="<%=candidate.getNationality()%>" tabindex="8" required>
                                <div class="errorMessage">  
                                    <%= candidateError.getNationalityError()%>                       
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <br><h4>Notation</h4>
                                <input style="width: 100%; height: 2.5em" placeholder="Type your Message Here...." type="text" 
                                       name="notation" value="<%=candidate.getNotation()%>" 
                                       tabindex="9" ></input>
                                <div class="errorMessage">  
                                    <%= candidateError.getNotationError()%>                       
                                </div>  
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-6 form-group">

                                <br><h4>Image</h4>
                                <input style="width: 100%; height: 2.5em" type="file" name="image" tabindex="10">  
                                <div class="errorMessage">  
                                    <%= candidateError.getImageError()%>                       
                                </div>
                            </div>
                        </div><br>
                        <div class="row mb-2"> 
                            <div class="col-md-6 form-group">
                                <!--                                <input class="btn btn-sm btn-outline-danger rounded-0" type="reset" value=" Reset "id="contact-submit">
                                                               <input class="btn btn-sm btn-outline-success rounded-0" name="action" type="submit" value="Create" id="contact-submit" >-->
                                <input name="candidateID" type="hidden" value="<%=candidate.getId()%>">
                                <input type="hidden" name="creatorID" value="<%=candidate.getCreatorID()%>" >
                                <input type="hidden" name="action" value="Update Candidate" >
                                <input type="RESET" id="contact-submit">
                                <input type="submit" id="contact-submit" value="UPDATE" >
                            </div>
                        </div>
                        <div class="errorMessage">  
                            <%= candidateError.getMessageError()%>                       
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
