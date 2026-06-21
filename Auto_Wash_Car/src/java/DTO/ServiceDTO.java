package DTO;

import java.io.Serializable;
import java.math.BigDecimal;

public class ServiceDTO implements Serializable {

    private int serviceId;
    private String serviceName;
    private String description;
    private BigDecimal price;
    private int duration;
    private boolean status;

    public ServiceDTO() {
    }

    public ServiceDTO(int serviceId, String serviceName,
            String description, BigDecimal price,
            int duration, boolean status) {

        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.description = description;
        this.price = price;
        this.duration = duration;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}