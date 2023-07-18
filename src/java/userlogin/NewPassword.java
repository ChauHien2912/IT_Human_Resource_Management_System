package userlogin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String SUCCESS = "login.jsp";
    private static final String ERROR = "newPassword.jsp";
    private static final String LENGTH = "At least 8 characters";
    private static final String NUMBER = "At least 1 number";
    private static final String UPPERCASE = "At least 1 characters UpperCase";
    private static final String SPECIAL = "At least 1 Special";
    private static final String NOTMATCH = "NewPassword and ConfirmPassword doesn't match";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String URL = ERROR;
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            // Check Length Password
            if (newPassword.length() >= 8) {
                // Check UpperCase
                if (newPassword.matches(".*[A-Z].*")) {
                    // Check Number
                    if (newPassword.matches(".*\\d.*")) {
                        // Check Special 
                        if (newPassword.matches(".*[!@#$%^&*()].*")) {
                            try {

                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                String url = "jdbc:sqlserver://localhost:1433;databaseName=ITHumanResourceManagementSystem";
                                Connection conn = DriverManager.getConnection(url, "sa", "12345");
                                PreparedStatement pst = conn.prepareStatement("UPDATE UserLogin SET password = ? WHERE employeeId IN "
                                        + "(SELECT employeeID FROM EmployeeInformation WHERE email = ?)");

                                pst.setString(1, newPassword);
                                pst.setString(2, (String) session.getAttribute("email"));

                                int rowCount = pst.executeUpdate();
                                if (rowCount > 0) {
                                    request.setAttribute("status", "resetSuccess");
                                    URL = SUCCESS;
                                } else {
                                    request.setAttribute("status", "resetFailed");
                                }
                                dispatcher.forward(request, response);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                            request.setAttribute("MESSAGE", SPECIAL);
                        }
                    } else {
                        request.setAttribute("MESSAGE", NUMBER);
                    }
                } else {
                    request.setAttribute("MESSAGE", UPPERCASE);
                }
            } else {
                request.setAttribute("MESSAGE", LENGTH);
            }
        } else {
            request.setAttribute("MESSAGE", NOTMATCH);
        }
        request.getRequestDispatcher(URL).forward(request, response);
    }

}
