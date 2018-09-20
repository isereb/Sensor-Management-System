package beans;

import controllers.MonitoringController;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Objects;
import java.util.Set;

public class SensorEntity extends AbstractEntity implements Comparable<SensorEntity> {

    private int id;
    private int owner;
    private String password;
    private String address;
    private double max;
    private double min;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private byte isDeleted;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getOwner() { return owner; }
    public void setOwner(int owner) {
        this.owner = owner;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public double getMax() {
        return max;
    }
    public void setMax(double max) {
        this.max = max;
    }

    public double getMin() {
        return min;
    }
    public void setMin(double min) {
        this.min = min;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }
    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public byte getIsDeleted() {
        return isDeleted;
    }
    public void setIsDeleted(byte isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Set<AbstractEntity> getMonitoring() throws SQLException {
        return new MonitoringController(this).getMonitoring();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SensorEntity that = (SensorEntity) o;
        return owner == that.owner &&
            Double.compare(that.max, max) == 0 &&
            Double.compare(that.min, min) == 0 &&
            Objects.equals(password, that.password) &&
            Objects.equals(address, that.address);
    }

    @Override
    public int compareTo(SensorEntity sensor) {
        return this.getId() - sensor.getId();
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, owner, password, address, max, min, createdAt, updatedAt, isDeleted);
    }


}
