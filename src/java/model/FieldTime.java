/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ai
 */
public class FieldTime {
    private int fieldTimeId;
    private int fieldId;
    private String startTime;
    private String endTime;
    private double price;

    public FieldTime() {
    }

    public FieldTime(int fieldTimeId, int fieldId, String startTime, String endTime, double price) {
        this.fieldTimeId = fieldTimeId;
        this.fieldId = fieldId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.price = price;
    }

    public int getFieldTimeId() {
        return fieldTimeId;
    }

    public void setFieldTimeId(int fieldTimeId) {
        this.fieldTimeId = fieldTimeId;
    }

    public int getFieldId() {
        return fieldId;
    }

    public void setFieldId(int fieldId) {
        this.fieldId = fieldId;
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
}
