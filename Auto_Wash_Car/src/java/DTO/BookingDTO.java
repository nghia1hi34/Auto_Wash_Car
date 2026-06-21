/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author ADMIN
 */
public class BookingDTO {
     private int bookingId;
    private int customerId;
    private int vehicleId;
    private int serviceId;
    private String bookingTime;
    private double originalPrice;
    private double finalPrice;
    private double discountPercent;
private double discountAmount;
    private String note;
    

    public BookingDTO() {
    }

    public BookingDTO(int bookingId, int customerId, int vehicleId, int serviceId, String bookingTime, double originalPrice, double finalPrice, double discountPercent, double discountAmount, String note) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.vehicleId = vehicleId;
        this.serviceId = serviceId;
        this.bookingTime = bookingTime;
        this.originalPrice = originalPrice;
        this.finalPrice = finalPrice;
        this.discountPercent = discountPercent;
        this.discountAmount = discountAmount;
        this.note = note;
    }

    

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public double getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(double finalPrice) {
        this.finalPrice = finalPrice;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }
    
    
}

