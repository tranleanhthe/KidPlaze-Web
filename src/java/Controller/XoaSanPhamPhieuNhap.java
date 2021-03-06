/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PHIEUNHAP_DAO;
import DAO.SANPHAM_DAO;
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
public class XoaSanPhamPhieuNhap extends HttpServlet {

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
        String MaSanPham = request.getParameter("MaSanPham");
        String MaPhieuNhap = request.getParameter("MaPhieuNhap");
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        
        int ID = sp_dp.return_IDSanPham_Mau(MaSanPham, MaPhieuNhap);
        sp_dp.XoaKhoAnhMau(MaSanPham, MaPhieuNhap);
        sp_dp.XoaLoaiSanPhamMau(MaSanPham, MaPhieuNhap);
        sp_dp.XoaSanPhamMau(MaSanPham, MaPhieuNhap);
        PHIEUNHAP_DAO ph_dp = new PHIEUNHAP_DAO();
        String MaPhieuNhapHT = ph_dp.returnPhieuNhapMax();
        if (MaPhieuNhapHT.equals(MaPhieuNhap)) {
            RequestDispatcher rs = request.getRequestDispatcher("ThemPhieuNhap");
            rs.forward(request, response);
        } else {
            String URL = "XemChiTietSuaPhieuNhap?MaPhieuNhap=" + MaPhieuNhap;
            RequestDispatcher rs = request.getRequestDispatcher(URL);
            rs.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(XoaSanPhamPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(XoaSanPhamPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
