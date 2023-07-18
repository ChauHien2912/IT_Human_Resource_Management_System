/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package contract;

import candidate.CandidateDAO;
import candidate.CandidateDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author flami
 */
@WebServlet(name = "ButtonUpdateCandidateContract", urlPatterns = {"/ButtonUpdateCandidateContract"})
public class ButtonUpdateCandidateContract extends HttpServlet {

    private static final String ERROR = "/contract/updateContract.jsp";
    private static final String SUCCESS = "/contract/updateContract.jsp";
    private static final String MAIN = "main/mainHRS.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        String URL = MAIN;

        try {
            String candidateID = request.getParameter("candidateID");
            String coontractID = request.getParameter("tempContractID");

            CandidateDAO dao = new CandidateDAO();
            //get a candidate from database
            CandidateDTO candidate = dao.getACandidate(candidateID);
            if (candidate != null) {
                //get temporary contract of this candidate
                 ContractDAO tempDAO = new ContractDAO();
                TemporaryContractDTO tempContract = tempDAO.getTemporaryContractByCandidateID(candidateID);
                if (tempContract != null) {
                    url = SUCCESS;
                    //return candidate and temporary contract to show
                    request.setAttribute("CANDIDATE", candidate);
                    request.setAttribute("TEMPORARY_CONTRACT", tempContract);
                }
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
