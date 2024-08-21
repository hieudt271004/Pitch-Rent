/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ai
 */
public class FoodOrder {

    private int food_order_id;
    private int customer_id;
    private String food_id;
    private String food_name;
    private int quantity;
    private double total_amount;
    private String order_date;

    public FoodOrder() {
    }

    public FoodOrder(int foood_order_id, int customer_id, String food_id, int quantity, double total_amount, String order_date) {
        this.food_order_id = foood_order_id;
        this.customer_id = customer_id;
        this.food_id = food_id;
        this.quantity = quantity;
        this.total_amount = total_amount;
        this.order_date = order_date;
    }

    public FoodOrder(int food_order_id, String food_name, int quantity, double total_amount, String order_date) {
        this.food_order_id = food_order_id;
        this.food_name = food_name;
        this.quantity = quantity;
        this.total_amount = total_amount;
        this.order_date = order_date;
    }

    public int getFoood_order_id() {
        return food_order_id;
    }

    public void setFoood_order_id(int food_order_id) {
        this.food_order_id = food_order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getFood_id() {
        return food_id;
    }

    public void setFood_id(String food_id) {
        this.food_id = food_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getFood_name() {
        return food_name;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

}
