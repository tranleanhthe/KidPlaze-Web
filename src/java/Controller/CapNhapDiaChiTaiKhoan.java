/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.KHACHHANG_DAO;
import DTO.KHACHHANG;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tranl
 */
public class CapNhapDiaChiTaiKhoan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String telephone = request.getParameter("telephone");
        String street = request.getParameter("street");
        String region_id = request.getParameter("region_id");
        
        firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
        lastname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
        street = new String(street.getBytes("ISO-8859-1"), "UTF-8");
        region_id = new String(region_id.getBytes("ISO-8859-1"), "UTF-8");
        String Email = (String)request.getSession().getAttribute("Email");
        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
        KHACHHANG kh = kh_dp.getKhachHang(Email);
        
        kh.setDiaChi(street);
        kh.setTenKhachHang(firstname);
        kh.setHoKhachHang(lastname);
        kh.setSoDienThoai(telephone);
        kh.setTinh(region_id);
        
        kh_dp.updateAddress(kh);
        
        request.setAttribute("KhachHang", kh);
        RequestDispatcher rd = request.getRequestDispatcher("ChiTietKhachHang.jsp");
        rd.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CapNhapDiaChiTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CapNhapDiaChiTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
        }
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
