<%-- 
    Document   : viewEmployeeContract
    Created on : Jul 5, 2023, 10:48:00 AM
    Author     : flami
--%>

<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="employee.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Contract</title>
    </head>
    <body>
        <h1 style="text-align: center">Information of Contract</h1>
        <%
            List<ContractDTO> listContract = (List<ContractDTO>) request.getAttribute("EMPLOYEE_CONTRACT");
            if (listContract == null) {
        %>
        <h1 style="text-align: center">Do not have Contract!</h1>
        <%
        } else {
            for (ContractDTO contract : listContract) {
                if (contract.isActive()) {
                    %>
                    <h3 style="text-align: center">Current Contract</h3><br>
                    <%
                } else {
                    %>
                    <h3 style="text-align: center">Pass Contract</h3><br>
                    <%
                }

            int sizeImage = contract.getSizeImage();
            String pathImage = contract.getPathImage();
            String separateFile = File.separator;
            for (int i = 1; i <= sizeImage; i++) {
        %>
        <div style="text-align: center">
        <img src="<%=pathImage + separateFile + "image_" + i + ".jpg"%>" alt="Image of contract"
             style="width: 500px; height: auto;"><br/>
        </div>
        <%
                    }

                }
            }

        %>
    </body>
</html>
