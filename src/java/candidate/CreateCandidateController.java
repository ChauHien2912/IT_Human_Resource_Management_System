/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package candidate;

import userlogin.User_Login_DTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author flami this servlet class use to create candidate
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "CreateCandidateController", urlPatterns = {"/CreateCandidateController"})
public class CreateCandidateController extends HttpServlet {

    private final static String ERROR = "/candidate/createCandidate.jsp";
    private final static String SUCCESS = "/candidate/searchCandidate.jsp";
    private final static String URL = "main/mainHRS.jsp";
    private final static String SAVE_DIR = "personalImage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        boolean check = true;
        String messageError;
        CandidateDTO candidate = null;

        try {
            CandidateDAO dao = new CandidateDAO();
            String candidateID = dao.getNewIDCandidate();
            String fullName = request.getParameter("fullName").trim();
            String gender = request.getParameter("gender").trim();

            String dateString = request.getParameter("dateOfBirth").trim();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate dateOfBirth = LocalDate.parse(dateString, formatter);

            String phoneNumber = request.getParameter("phoneNumber").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            String humanId = request.getParameter("humanId").trim();
            String nationality = request.getParameter("nationality").trim();
            String notation = request.getParameter("notation").trim();
            Part file = request.getPart("image");
            String creatorID = null;
            //get user logining 
            HttpSession session = request.getSession();
            User_Login_DTO userLogin = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            if (userLogin.getRoleName().equals("HRS")) {
                creatorID = userLogin.getEmployeeId();
            }

            boolean isActive = true;

            CandidateError candidateError = new CandidateError();
            ValidationInput errorChecking = new ValidationInput();

            //check full name of candidate
            if (!errorChecking.isFullName(fullName)) {
                messageError = errorChecking.getMessage();
                candidateError.setFullNameError(messageError);
                check = false;
            }
            //check phone number 
            if (!errorChecking.isPhoneNumber(phoneNumber)) {
                messageError = errorChecking.getMessage();
                candidateError.setPhoneNumberError(messageError);
                check = false;
            }
            //check email
            if (!errorChecking.isEmail(email)) {
                messageError = errorChecking.getMessage();
                candidateError.setEmailError(messageError);
                check = false;
            }
            //check address
            if (!errorChecking.isAddress(address)) {
                messageError = errorChecking.getMessage();
                candidateError.setAddressError(messageError);
                check = false;
            }
            //check humanId
            if (!errorChecking.isHumanId(humanId)) {
                messageError = errorChecking.getMessage();
                candidateError.setHumanIdEror(messageError);
                check = false;
            }
            //check nationality
            if (!errorChecking.isNationality(nationality)) {
                messageError = errorChecking.getMessage();
                candidateError.setNationalityError(messageError);
                check = false;
            }
            //check notation
            if (!errorChecking.isNotation(notation)) {
                messageError = errorChecking.getMessage();
                candidateError.setNotationError(messageError);
                check = false;
            }
            //check img
            if (!errorChecking.isImageFile(file)) {
                messageError = errorChecking.getMessage();
                candidateError.setImageError(messageError);
                check = false;
            }
            //check save img
            String path = getServletContext().getRealPath("/");
            String imagePath = Helper.getPath(candidateID, SAVE_DIR);
            if (imagePath == null) {
                candidateError.setImageError("Error in save image to server!!!");
                check = false;
            }

            candidate = new CandidateDTO(candidateID, fullName, gender, dateOfBirth,
                    phoneNumber, email, address, humanId, nationality, notation, imagePath, creatorID, isActive);
            if (check) {
                //save img
                boolean check2 = Helper.saveImage(candidateID, file, path, SAVE_DIR);
                //insert to database
                check = dao.insertCandidate(candidate);
                url = SUCCESS;
            } else {
                request.setAttribute("CANDIDATE", candidate);
                request.setAttribute("CANDIDATE_ERROR", candidateError);
                url = ERROR;
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        request.setCharacterEncoding("UTF-8");
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
