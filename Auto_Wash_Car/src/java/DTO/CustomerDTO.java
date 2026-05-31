/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author huynh
 */
public class CustomerDTO implements Serializable {
    private int customerId;
    private int userId;
    private int tierId;
    private int points;
    private int totalWashes;
    private BigDecimal totalSpending;
    private Timestamp createdAt;

    public CustomerDTO() {
    }

    public CustomerDTO(int customerId, int userId, int tierId, int points,
            int totalWashes, BigDecimal totalSpending, Timestamp createdAt) {
        this.customerId = customerId;
        this.userId = userId;
        this.tierId = tierId;
        this.points = points;
        this.totalWashes = totalWashes;
        this.totalSpending = totalSpending;
        this.createdAt = createdAt;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTierId() {
        return tierId;
    }

    public void setTierId(int tierId) {
        this.tierId = tierId;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getTotalWashes() {
        return totalWashes;
    }

    public void setTotalWashes(int totalWashes) {
        this.totalWashes = totalWashes;
    }

    public BigDecimal getTotalSpending() {
        return totalSpending;
    }

    public void setTotalSpending(BigDecimal totalSpending) {
        this.totalSpending = totalSpending;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
