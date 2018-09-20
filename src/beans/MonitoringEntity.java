package beans;

import java.sql.Timestamp;
import java.util.Objects;

public class MonitoringEntity extends AbstractEntity implements Comparable<MonitoringEntity> {

    private int sensor;
    private double value;
    private Timestamp createdAt;
    private SensorEntity sensorBySensor;

    public int getSensor() {
        return sensor;
    }
    public void setSensor(int sensor) {
        this.sensor = sensor;
    }

    public double getValue() {
        return value;
    }
    public void setValue(double value) {
        this.value = value;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MonitoringEntity that = (MonitoringEntity) o;
        return getId() == that.getId() &&
            sensor == that.sensor &&
            value == that.value &&
            createdAt == that.createdAt;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, sensor, value, createdAt);
    }

    @Override
    public int compareTo(MonitoringEntity mon) {
        return this.getId() - mon.getId();
    }

}
