/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userlogin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dashbar.DashboardDAO;
import java.time.LocalDate;

/**
 *
 * @author Hào Cute
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String Staff = "main/mainStaff.jsp";
    private static final String HRS = "main/mainHRS.jsp";
    private static final String HRM = "main/mainHRM.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String dashBoardPath="";
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            User_Login_DAO DAO = new User_Login_DAO();
            User_Login_DTO userLogin = DAO.LoginUser(userID, password);
            if (userLogin != null) {
                if (userLogin.isIsActive() == false) {
                    request.setAttribute("ERROR_MESSAGE", "Tài khoản của bạn đã hết hạn. Vui lòng liên hệ với admin để biết thêm chi tiết!");
                }
                HttpSession Session = request.getSession();
                if (userLogin.getRoleName().equals("Staff")) {
                    Session.setAttribute("USER_LOGIN", userLogin);
                    url = Staff;
                }
                if (userLogin.getRoleName().equals("HRS")) {
                    Session.setAttribute("USER_LOGIN", userLogin);
                    url = HRS;
                }
                if (userLogin.getRoleName().equals("HRM")) {
                    Session.setAttribute("USER_LOGIN", userLogin);
                    url = HRM;
                }
                DashboardDAO dashBardDAO = new DashboardDAO();
//                int count = dashBardDAO.countTotalLeaveLog(userLogin.getEmployeeId());
//                request.setAttribute("TOTAL_LEAVE_LOG", count);
                int totalStaff = dashBardDAO.getNumberStaff();
                int totalHRS = dashBardDAO.getNumberHRStaff();
                int hrsAttendance = dashBardDAO.getAttendanceHRStaff(LocalDate.now());
                int staffAttendance = dashBardDAO.getAttendanceStaff(LocalDate.now());
                int leavePerson = dashBardDAO.getTotal() - (hrsAttendance + staffAttendance);
                int totalPerson = totalStaff + totalHRS;
                
                request.setAttribute("totalStaff", totalStaff);                
                request.setAttribute("totalHRS", totalHRS);                
                request.setAttribute("hrsAttendance", hrsAttendance);                
                request.setAttribute("staffAttendance", staffAttendance);                
                request.setAttribute("leavePerson", leavePerson);                
                request.setAttribute("totalPerson", totalPerson);

            } else {
                request.setAttribute("ERROR_MESSAGE", "Tài khoản không tồn tại hoặc sai mật khẩu");
            }
            //reload page
            if (userLogin.getRoleName().equalsIgnoreCase("HRM")) {
                dashBoardPath = "/dashboard/dashBoardHRM.jsp";
            } else {
                dashBoardPath = "/dashboard/dashBoard.jsp";
            }

        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.setAttribute("URL", dashBoardPath);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
