/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ai
 */
public class FieldTimeOrder {
    private int fieldOrderId;
    private int customerId;
    private int fieldTimeId;
    private String orderDate;

    public FieldTimeOrder() {
    }

    public FieldTimeOrder(int fieldOrderId, int customerId, int fieldTimeId, String orderDate) {
        this.fieldOrderId = fieldOrderId;
        this.customerId = customerId;
        this.fieldTimeId = fieldTimeId;
        this.orderDate = orderDate;
    }

    public FieldTimeOrder(int fieldTimeId) {
        this.fieldTimeId = fieldTimeId;
    }
    

    public int getFieldOrderId() {
        return fieldOrderId;
    }

    public void setFieldOrderId(int fieldOrderId) {
        this.fieldOrderId = fieldOrderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getFieldTimeId() {
        return fieldTimeId;
    }

    public void setFieldTimeId(int fieldTimeId) {
        this.fieldTimeId = fieldTimeId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
    
    
}
