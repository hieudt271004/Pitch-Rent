/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EquipmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Equipments;

/**
 *
 * @author ai
 */
public class MangeEquipmentServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MangeEquipmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MangeEquipmentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        List<Equipments> equipmentList = EquipmentDAO.INSTANCE.getAllEquipment();
        request.setAttribute("equipmentList", equipmentList);
        request.getRequestDispatcher("views/ManageEquipment.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        String equipmentId_raw = request.getParameter("equipment_id");
        if (type != null) {
            if (type.equals("2")) { // Add operation
                String equipmentName = request.getParameter("equipment_name");
                String priceStr = request.getParameter("price");
                String img = request.getParameter("img");

                double price;
                try {
                    price = Double.parseDouble(priceStr);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid price format: " + priceStr);
                    response.sendRedirect("admin.jsp?error=InvalidPrice");
                    return;
                }

                EquipmentDAO.INSTANCE.addEquipment(equipmentName, price, img);
                response.sendRedirect("manageequipment");
            } else if (equipmentId_raw != null) {
                int equipmentId;
                try {
                    equipmentId = Integer.parseInt(equipmentId_raw);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid equipment ID format: " + equipmentId_raw);
                    response.sendRedirect("admin.jsp?error=InvalidEquipmentId");
                    return;
                }

                if (type.equals("0")) { // Update operation
                    String equipmentName = request.getParameter("equipment_name");
                    String priceStr = request.getParameter("price");
                    String img = request.getParameter("img");

                    double price;
                    try {
                        price = Double.parseDouble(priceStr);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid price format: " + priceStr);
                        response.sendRedirect("admin.jsp?error=InvalidPrice");
                        return;
                    }

                    EquipmentDAO.INSTANCE.updateEquipment(equipmentId, equipmentName, price, img);
                    response.sendRedirect("manageequipment");

                } else if (type.equals("1")) { // Delete operation
                    EquipmentDAO.INSTANCE.deleteEquipment(equipmentId);
                    response.sendRedirect("manageequipment");
                }
            } else {
                response.sendRedirect("admin.jsp?error=InvalidRequest");
            }
        } else {
            response.sendRedirect("admin.jsp?error=InvalidRequest");
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
