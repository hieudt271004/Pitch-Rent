/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ai
 */
public class EquipmentOrder {
    private int equipment_order_id;
    private int customer_id;
    private String equipment_name;
    private int equipment_id;
    private int quantity;
    private String order_date;
    private double total_amount;

    public EquipmentOrder() {
    }

    public EquipmentOrder(int equipment_order_id, int customer_id, int equipment_id, int quantity, String order_date, double total_amount) {
        this.equipment_order_id = equipment_order_id;
        this.customer_id = customer_id;
        this.equipment_id = equipment_id;
        this.quantity = quantity;
        this.order_date = order_date;
        this.total_amount = total_amount;
    }

    public EquipmentOrder(int equipment_order_id, String equipment_name, int quantity, String order_date, double total_amount) {
        this.equipment_order_id = equipment_order_id;
        this.equipment_name = equipment_name;
        this.quantity = quantity;
        this.order_date = order_date;
        this.total_amount = total_amount;
    }
        
    public int getEquipment_order_id() {
        return equipment_order_id;
    }

    public void setEquipment_order_id(int equipment_order_id) {
        this.equipment_order_id = equipment_order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(int equipment_id) {
        this.equipment_id = equipment_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getEquipment_name() {
        return equipment_name;
    }

    public void setEquipment_name(String equipment_name) {
        this.equipment_name = equipment_name;
    }
    
    
}
