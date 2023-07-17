/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package attendance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userlogin.User_Login_DTO;

/**
 *
 * @author Hào Cute
 */
@WebServlet(name = "viewAttendanceController", urlPatterns = {"/viewAttendanceController"})
public class viewAttendanceController extends HttpServlet {

    public static String EMPTY_LIST = "Don't have any records";
    public static String ERROR = "error.jsp";
    public static String SUCCESS = "/attendance/viewAttendance.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        String URL = SUCCESS;
        try {
            String dateAttendance = request.getParameter("dateAttendance");
            String employeeId = request.getParameter("employeeId");
            if (dateAttendance == null) {
                dateAttendance = "";
            }
            if (employeeId == null) {
                employeeId = "";
            }

            HttpSession session = request.getSession();
            User_Login_DTO userLogin = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            ViewAttendance_DAO DAO = new ViewAttendance_DAO();
            List<ViewAttendance_DTO> listAttendanceOfEmployees = new ArrayList<>();
            if (dateAttendance.length() == 0) {
                listAttendanceOfEmployees = DAO.listAttendanceOfEmployees(employeeId, userLogin.getEmployeeId());
            } else {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new java.sql.Date(format.parse(dateAttendance).getTime());
                LocalDate searchDateAttendance = date.toLocalDate();
                listAttendanceOfEmployees = DAO.listAttendanceOfEmployees(employeeId, searchDateAttendance.getDayOfMonth(),
                        searchDateAttendance.getMonthValue(), searchDateAttendance.getYear(), userLogin.getEmployeeId());
            }

            if (listAttendanceOfEmployees.size() > 0) {
                request.setAttribute("LIST_ATTENDANCE", listAttendanceOfEmployees);
            } else {
                request.setAttribute("MESSAGE", EMPTY_LIST);
            }
            url = SUCCESS;
            if (userLogin.getRoleName().equalsIgnoreCase("HRS")) {
                URL = "main/mainHRS.jsp";
            } else if (userLogin.getRoleName().equalsIgnoreCase("HRM")) {
                URL = "main/mainHRM.jsp";
            }

        } catch (Exception e) {
            url = ERROR;
            log("Error at View Attendance" + e.toString());
        } finally {
            request.setAttribute("URL", url);
            request.getRequestDispatcher(URL).forward(request, response);
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
