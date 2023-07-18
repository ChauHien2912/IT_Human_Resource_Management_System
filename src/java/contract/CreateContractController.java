/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package contract;

import candidate.CandidateDTO;
import userlogin.User_Login_DTO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author flami This servlet class use to create temporary contract from HRS
 */
@WebServlet(name = "CreateContractController", urlPatterns = {"/CreateContractController"})
public class CreateContractController extends HttpServlet {

    public static final int TIEN_COM_TRUA = 25000;
    public static final int TIEN_NHA_O = 1000000;
    public static final int TIEN_XANG_XE = 300000;
    public static final int TIEN_DIEN_THOAI = 200000;
    private static final String ERROR = "/contract/createContract.jsp";
    private static final String SUCCESS = "SearchCandidateController";
    private static final String APPROVERID = "HM1111";
    private final static String CONTRACT_ID_FORMAT = "TC1111";
    private final static String MAIN = "main/mainHRS.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        String URL = MAIN;
        boolean check = true;
        float salary = 0;
        float allowance = TIEN_COM_TRUA * 22 + TIEN_NHA_O + TIEN_XANG_XE + TIEN_DIEN_THOAI;
        String contractID = null;
        LocalDate startDate = null;
        String description = null;
        String candidateID = null;

        try {
            ContractError error = new ContractError();
            ContractDAO dao = new ContractDAO();

            candidateID = request.getParameter("candidateID");

            CandidateDTO candidate = dao.getACandidate(candidateID);

            contractID = dao.getNewIDTemporaryContract(CONTRACT_ID_FORMAT);
            String dateString = request.getParameter("startDate").trim();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            startDate = LocalDate.parse(dateString, formatter);

            String salaryString = request.getParameter("salary");
            description = request.getParameter("description");

            ValidationInputTemporaryContract validation = new ValidationInputTemporaryContract();

            if (!validation.isSalary(salaryString)) {
                String message = validation.getMessageError();
                error.setSalaryError(message);
                check = false;
            } else {
                salary = Float.parseFloat(salaryString);
            }

            if (!validation.isDescription(description)) {
                String message = validation.getMessageError();
                error.setNotationError(message);
                check = false;
            }

            String creatorID;
            HttpSession session = request.getSession();
            User_Login_DTO userLogin = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            creatorID = userLogin.getEmployeeId();

            TemporaryContractDTO contract = new TemporaryContractDTO(
                    contractID, startDate, salary, allowance,
                    APPROVERID, creatorID, description,
                    candidateID, null, "");
            if (check) {
                String status = "PROCESSING";
                contract.setStatus(status);
                contract.setApproverID(APPROVERID);
                contract.setCreatorID(creatorID);
                if (dao.insertContractCandidate(contract)) {
                    URL = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_CONTRACT", error);
                request.setAttribute("TEMPORARY_CONTRACT", contract);
                request.setAttribute("SALARYSTRING", salaryString);
                request.setAttribute("URL", url);
            }
            request.setAttribute("CANDIDATE", candidate);
            request.setAttribute("STATUS_CONTRACT", contract.getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
