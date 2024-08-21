/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ai
 */
public class HistoryBookingModel {

    private String fieldName;
    private String startTime;
    private String endTime;
    private double price;
    private String location;
    private String orderDate;

    public HistoryBookingModel() {
    }

    public HistoryBookingModel(String fieldName, String startTime, String endTime, double price, String location, String orderDate) {
        this.fieldName = fieldName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.price = price;
        this.location = location;
        this.orderDate = orderDate;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

}
