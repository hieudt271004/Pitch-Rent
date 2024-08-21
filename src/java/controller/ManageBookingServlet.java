/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FieldTimeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.FieldTime;

/**
 *
 * @author ai
 */
public class ManageBookingServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageBookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageBookingServlet at " + request.getContextPath() + "</h1>");
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
        List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
        request.setAttribute("fieldTimelist", fieldTimelist);
        request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
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
        String fieldTimeIdRaw = request.getParameter("fieldTimeId");
        
        if (type != null) {
            if (type.equals("2")) { // Add operation
                String startTime = request.getParameter("startTime");
                String endTime = request.getParameter("endTime");
                String priceStr = request.getParameter("price");
                String location_raw = request.getParameter("location");

                double price;
                int location;
                try {
                    price = Double.parseDouble(priceStr);
                    location = Integer.parseInt(location_raw);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid price or location format: " + priceStr + ", " + location_raw);
                    request.setAttribute("error", "Invalid price or location format.");
                    List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                    request.setAttribute("fieldTimelist", fieldTimelist);
                    request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                    return;
                }

                if (endTime.compareTo(startTime) <= 0) {
                    request.setAttribute("error", "End time must be after start time.");
                    List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                    request.setAttribute("fieldTimelist", fieldTimelist);
                    request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                    return;
                }

                try {
                    FieldTimeDAO.INSTANCE.addFieldTime(location, startTime, endTime, price);
                } catch (Exception e) {
                    System.out.println("Database error: " + e.getMessage());
                    request.setAttribute("error", "Database error.");
                    List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                    request.setAttribute("fieldTimelist", fieldTimelist);
                    request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                    return;
                }
                response.sendRedirect("managebooking");

            } else if (fieldTimeIdRaw != null) {
                int fieldTimeId;
                try {
                    fieldTimeId = Integer.parseInt(fieldTimeIdRaw);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid field time ID format: " + fieldTimeIdRaw);
                    request.setAttribute("error", "Invalid field time ID format.");
                    List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                    request.setAttribute("fieldTimelist", fieldTimelist);
                    request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                    return;
                }

                if (type.equals("0")) { // Update operation
                    String startTime = request.getParameter("startTime");
                    String endTime = request.getParameter("endTime");
                    String priceStr = request.getParameter("price");

                    double price;
                    try {
                        price = Double.parseDouble(priceStr);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid price format: " + priceStr);
                        request.setAttribute("error", "Invalid price format.");
                        List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                        request.setAttribute("fieldTimelist", fieldTimelist);
                        request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                        return;
                    }
                    
                    if (endTime.compareTo(startTime) <= 0) {
                        request.setAttribute("error", "End time must be after start time.");
                        List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                        request.setAttribute("fieldTimelist", fieldTimelist);
                        request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                        return;
                    }

                    try {
                        FieldTimeDAO.INSTANCE.updateFieldTime(fieldTimeId, startTime, endTime, price);
                    } catch (Exception e) {
                        System.out.println("Database error: " + e.getMessage());
                        request.setAttribute("error", "Database error.");
                        List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                        request.setAttribute("fieldTimelist", fieldTimelist);
                        request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                        return;
                    }
                    response.sendRedirect("managebooking");

                } else if (type.equals("1")) { // Delete operation
                    try {
                        FieldTimeDAO.INSTANCE.deleteFieldTime(fieldTimeId);
                    } catch (Exception e) {
                        System.out.println("Database error: " + e.getMessage());
                        request.setAttribute("error", "Database error.");
                        List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                        request.setAttribute("fieldTimelist", fieldTimelist);
                        request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
                        return;
                    }
                    response.sendRedirect("managebooking");
                }
            } else {
                request.setAttribute("error", "Invalid request.");
                List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
                request.setAttribute("fieldTimelist", fieldTimelist);
                request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid request.");
            List<FieldTime> fieldTimelist = FieldTimeDAO.INSTANCE.getAllFieldTime();
            request.setAttribute("fieldTimelist", fieldTimelist);
            request.getRequestDispatcher("views/ManageBooking.jsp").forward(request, response);
        }
    }
}
