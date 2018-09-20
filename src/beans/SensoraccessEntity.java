package beans;

import javax.persistence.*;
import java.util.Objects;

public class SensoraccessEntity {
    private int id;
    private int user;
    private int sensor;
    private long givenAt;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUser() {
        return user;
    }
    public void setUser(int user) {
        this.user = user;
    }

    public int getSensor() {
        return sensor;
    }
    public void setSensor(int sensor) {
        this.sensor = sensor;
    }

    public long getGivenAt() {
        return givenAt;
    }
    public void setGivenAt(long givenAt) {
        this.givenAt = givenAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SensoraccessEntity that = (SensoraccessEntity) o;
        return id == that.id &&
            user == that.user &&
            sensor == that.sensor &&
            givenAt == that.givenAt;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, user, sensor, givenAt);
    }

}
