/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CartDAO;
import dao.DAO;
import dao.InvoiceDAO;
import entity.Account;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mim
 */
@WebServlet(name="AddorderControl", urlPatterns={"/addorder"})
public class ManagerOrderControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, Exception {        
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
//        InvoiceDAO idao = new InvoiceDAO();
//        CartDAO cdao = new CartDAO();
        String name = request.getParameter("name");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        String typepay = request.getParameter("typepay");
        String delivery = request.getParameter("deliveryAddress");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int accountID = a.getId();
        List<Cart> list = dao.getCartByAccountID(accountID);
        List<Product> list2 = dao.getAllproduct();
        request.setAttribute("listCart", list);
        request.setAttribute("listProduct", list2);
        request.setCharacterEncoding("UTF-8");
        String context = "";
        double totalMoney = 0;
        for (Cart o : list) {
            for (Product p : list2) {
                if (o.getProductID() == p.getId()) {
                    totalMoney = totalMoney + p.getPrice() * o.getAmount();
                    context += " Name : " + p.getName() + ": Color : " + p.getColor() + ": Size : " + o.getSize() + " : Quanltity : " + o.getAmount() + " // ";
                }
            }
        }
        double totalMoneyVAT = totalMoney * 1.1;
        totalMoneyVAT = Math.round(totalMoneyVAT);
        dao.insertInvoice(accountID, totalMoneyVAT, context, phoneNumber, delivery, name, typepay);
//        idao.insertInvoice(accountID, totalMoneyVAT, context, phoneNumber, delivery, name, typepay);        
        dao.deleteCartByAccountID(accountID);
//        cdao.deleteCartByAccountID(accountID);
        response.sendRedirect("home");
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        } catch (Exception ex) {
            Logger.getLogger(ManagerOrderControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
        } catch (Exception ex) {
            Logger.getLogger(ManagerOrderControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
