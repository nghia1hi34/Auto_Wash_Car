package DTO;

import java.io.Serializable;
import java.math.BigDecimal;

public class ServiceDTO implements Serializable {
    private int serviceId;
    private String serviceName;
    private BigDecimal price;
    private int durationMinutes;
    private boolean status;

    public ServiceDTO() {
    }

    public ServiceDTO(int serviceId, String serviceName, BigDecimal price, int durationMinutes, boolean status) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.price = price;
        this.durationMinutes = durationMinutes;
        this.status = status;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
