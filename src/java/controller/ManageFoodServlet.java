/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FoodDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Foods;

/**
 *
 * @author ai
 */
public class ManageFoodServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageFoodServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageFoodServlet at " + request.getContextPath() + "</h1>");
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
        List<Foods> listFood = FoodDAO.INSTANCE.getAllFood();
        request.setAttribute("foodList", listFood);
        request.getRequestDispatcher("views/ManageFood.jsp").forward(request, response);
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
            String id_raw = request.getParameter("food_id");

            if (type != null) {
                if (type.equals("2")) { // Add operation
                    String foodName = request.getParameter("food_name");
                    String priceStr = request.getParameter("price");
                    String img = request.getParameter("img");

                    double price;
                    try {
                        price = Double.parseDouble(priceStr);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid price format: " + priceStr);
                        response.sendRedirect("food?error=InvalidPrice");
                        return;
                    }

                    FoodDAO.INSTANCE.addFood(foodName, price, img);
                    response.sendRedirect("managefood");
                } else if (id_raw != null) {
                    int id;
                    try {
                        id = Integer.parseInt(id_raw);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid food ID format: " + id_raw);
                        response.sendRedirect("food?error=InvalidFoodId");
                        return;
                    }

                    if (type.equals("0")) { // Update operation
                        String foodName = request.getParameter("food_name");
                        String priceStr = request.getParameter("price");
                        String img = request.getParameter("img");

                        double price;
                        try {
                            price = Double.parseDouble(priceStr);
                        } catch (NumberFormatException e) {
                            System.out.println("Invalid price format: " + priceStr);
                            response.sendRedirect("food?error=InvalidPrice");
                            return;
                        }

                        FoodDAO.INSTANCE.updateFood(id, foodName, price, img);
                        response.sendRedirect("managefood");

                    } else if (type.equals("1")) { // Delete operation
                        FoodDAO.INSTANCE.deleteFood(id);
                        response.sendRedirect("managefood");
                    }
                } else {
                    response.sendRedirect("food?error=InvalidRequest");
                }
            } else {
                response.sendRedirect("food");
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
