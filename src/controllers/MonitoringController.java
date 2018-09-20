package controllers;

import beans.AbstractEntity;
import beans.MonitoringEntity;
import beans.SensorEntity;
import exceptions.EntityNotFoundException;

import java.sql.*;
import java.util.Set;
import java.util.TreeSet;

public class MonitoringController implements Controllable {

    private int sensorId;

    public MonitoringController() {

    }

    public MonitoringController(SensorEntity sensor) {
        this.sensorId = sensor.getId();
    }

    public int getSensorId() {
        return sensorId;
    }

    public void setSensorId(int sensorId) {
        this.sensorId = sensorId;
    }

    /**
     * Finds sensor by by it's id
     * @return UserEntity
     * @throws SQLException In case of SQL Related issues
     */
    @Override
    public AbstractEntity find(int id) throws SQLException, EntityNotFoundException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        PreparedStatement getSensor = conn.prepareStatement("SELECT * FROM monitoring WHERE id = ?");
        getSensor.setInt(1, id);
        ResultSet rs = getSensor.executeQuery();
        MonitoringEntity mon;
        if (rs.next()) {
            mon = new MonitoringEntity();
            mon.setId(id);
            mon.setSensor(rs.getInt("sensor"));
            mon.setValue(rs.getDouble("value"));
        } else {
            throw new EntityNotFoundException("Sensor (id: " + id + ") not found");
        }
        return mon;
    }

    /**
     * Find all Monitoring entities by id of the sensor
     * @param id SensorEntity's id
     * @return Set of all monitoring records for the given sensor
     * @throws SQLException In case of SQL related issues
     */
    public Set<AbstractEntity> findBySensor(int id) throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        PreparedStatement getBySensor = conn.prepareStatement("SELECT * FROM " +
                "monitoring WHERE sensor = ? " +
            "ORDER BY created_at LIMIT 10;");
        getBySensor.setInt(1, id);
        ResultSet rs = getBySensor.executeQuery();
        return getSet(rs);
    }

    /**
     * Find all Monitoring entities by id of the sensor
     * @param sensor SensorEntity
     * @return Set of all monitoring records for the given sensor
     * @throws SQLException In case of SQL related issues
     */
    public Set<AbstractEntity> findBySensor(SensorEntity sensor) throws SQLException {
        return findBySensor(sensor.getId());
    }

    /**
     * Returns all monitoring records.
     * Avoid using this method due to high amount of records being returned
     * @return Set of Monitoring entities
     * @throws SQLException In case of SQL related issues
     */
    @Override
    @Deprecated
    public Set<AbstractEntity> findAll() throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        Statement getSensor = conn.createStatement();
        ResultSet rs = getSensor.executeQuery("SELECT * FROM monitoring;");
        return getSet(rs);
    }

    /**
     * Creates new monitoring record
     * @param entity MonitoringEntity to be created in a database
     * @throws SQLException In case of SQL related issues
     */
    @Override
    public void create(AbstractEntity entity) throws SQLException {
        if (entity instanceof MonitoringEntity) {
            Connection conn = ConnectionManager.getConnection();
            assert conn != null;

            MonitoringEntity mon = (MonitoringEntity) entity;
            PreparedStatement prep = conn.prepareStatement(
                "INSERT INTO monitoring (sensor, value, created_at) VALUES (?,?,?);");
            prep.setInt(1, mon.getSensor());
            prep.setDouble(2, mon.getValue());
            prep.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            prep.execute();
            prep.close();
            conn.close();
        }
    }

    @Override
    public Set<AbstractEntity> getSet(ResultSet rs) throws SQLException {
        Set<AbstractEntity> allSensors = new TreeSet<>();
        while (rs.next()) {
            MonitoringEntity mon = new MonitoringEntity();
            mon.setId(rs.getInt("id"));
            mon.setSensor(rs.getInt("sensor"));
            mon.setValue(rs.getDouble("value"));
            mon.setCreatedAt(rs.getTimestamp("created_at"));
            allSensors.add(mon);
        }
        return allSensors;
    }

    public Set<AbstractEntity> getMonitoring() throws SQLException {
        return findBySensor(sensorId);
    }
}
