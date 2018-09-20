package controllers;

import beans.AbstractEntity;
import beans.SensorEntity;
import exceptions.EntityNotFoundException;

import java.sql.*;
import java.util.Set;
import java.util.TreeSet;

public class SensorController implements Controllable {

    /**
     * @param id Retrieve everything about sensor by his id
     * @return SensorEntity
     * @throws SQLException In case of SQL related issues
     */
    @Override
    public AbstractEntity find(int id) throws SQLException, EntityNotFoundException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;
        try {
            PreparedStatement getSensor = conn.prepareStatement("SELECT * FROM sensor WHERE id = ?");
            getSensor.setInt(1, id);
            ResultSet rs = getSensor.executeQuery();
            SensorEntity sensor;
            if (rs.next()) {
                sensor = new SensorEntity();
                sensor.setId(id);
                sensor.setOwner(rs.getInt("owner"));
                sensor.setPassword(rs.getString("password"));
                sensor.setAddress(rs.getString("address"));
                sensor.setMax(rs.getDouble("max"));
                sensor.setMin(rs.getDouble("min"));
                sensor.setCreatedAt(rs.getTimestamp("created_at"));
                sensor.setUpdatedAt(rs.getTimestamp("updated_at"));
                sensor.setIsDeleted(rs.getByte("is_deleted"));
            } else {
                throw new EntityNotFoundException("Sensor (id: " + id + ") not found");
            }
            return sensor;
        } finally {
            conn.close();
        }
    }

    /**
     * Find sensors that belong to user with a given id.
     * @param owner id of the owner
     * @param displayDeleted Used to specify whether deleted records should be included
     * @return Set of SensorEntity
     * @throws SQLException In case of SQL Related issues
     */
    public Set<AbstractEntity> findByOwner(int owner, boolean displayDeleted)
        throws SQLException {

        Connection conn = ConnectionManager.getConnection();
        assert conn != null;
        try {
            PreparedStatement getSensor = conn.prepareStatement(
                "SELECT * FROM sensor WHERE owner = ? AND is_deleted = ?");
            getSensor.setInt(1, owner);
            getSensor.setByte(2, (displayDeleted) ? (byte) 1 : (byte) 0);
            ResultSet rs = getSensor.executeQuery();
            return getSet(rs);
        } finally {
            conn.close();
        }
    }

    /**
     Find sensors that belong to user with a given id.
     * @param owner id of the owner
     * @return Set of SensorEntity
     * @throws SQLException In case of SQL Related issues
     * @throws EntityNotFoundException If nothing is found
     */
    public Set<AbstractEntity> findByOwner(int owner)
        throws SQLException, EntityNotFoundException {
        return findByOwner(owner, false);
    }


    /**
     * Find absolutely all sensors in the system.
     * @return Unique set of sensors
     * @throws SQLException In case of SQL Related issues
     */
    @Override
    public Set<AbstractEntity> findAll() throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery("SELECT * FROM sensor");
        conn.close();
        return getSet(rs);
    }

    /**
     * Creates new sensor
     * @param entity SensorEntity to be created in a database
     * @throws SQLException In case of SQL Side issues
     */
    @Override
    public void create(AbstractEntity entity) throws SQLException {
        if (entity instanceof SensorEntity) {
            Connection conn = ConnectionManager.getConnection();
            assert conn != null;

            SensorEntity sensor = (SensorEntity) entity;
            PreparedStatement prep = conn.prepareStatement(
                "INSERT INTO sensor " +
                    "(owner, password, address, max, min, created_at, updated_at, is_deleted) " +
                    "VALUES (?,?,?,?,?,?,?,?)");

            prep.setInt(1, sensor.getOwner());
            prep.setString(2, sensor.getPassword());
            prep.setString(3, sensor.getAddress());
            prep.setDouble(4, sensor.getMax());
            prep.setDouble(5, sensor.getMin());
            prep.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            prep.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            prep.setByte(8, (byte) 0);
            prep.execute();
            prep.close();
            conn.close();
        }
    }

    /**
     * Update SensorEntity in a database with provided id.
     * Updates record, sets all fields for given sensor id
     * @param entity SensorEntity to retrieve id
     * @throws SQLException In case of SQL related issues
     */
    @Override
    public void update(AbstractEntity entity) throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        SensorEntity sensor = (SensorEntity) entity;
        PreparedStatement prep = conn.prepareStatement(
            "UPDATE sensor " +
                "SET owner = ?, password = ?, address = ?, max = ?, min = ?, " +
                "created_at = ?, updated_at = ?, is_deleted = ? WHERE id = ?");

        prep.setInt(1, sensor.getOwner());
        prep.setString(2, sensor.getPassword());
        prep.setString(3, sensor.getAddress());
        prep.setDouble(4, sensor.getMax());
        prep.setDouble(5, sensor.getMin());
        prep.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
        prep.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
        prep.setByte(8, (byte) 0);
        prep.setInt(9, entity.getId());
        prep.execute();
        prep.close();
        conn.close();
    }

    public Set<AbstractEntity> getMonitoring(SensorEntity sensor) throws SQLException {
        MonitoringController mc = new MonitoringController(sensor);
        return mc.getMonitoring();
    }

    @Override
    public Set<AbstractEntity> getSet(ResultSet rs) throws SQLException {
        Set<AbstractEntity> allSensors = new TreeSet<>();
        while (rs.next()) {
            SensorEntity sensor = new SensorEntity();
            sensor.setId(rs.getInt("id"));
            sensor.setOwner(rs.getInt("owner"));
            sensor.setPassword(rs.getString("password"));
            sensor.setAddress(rs.getString("address"));
            sensor.setMax(rs.getDouble("max"));
            sensor.setMin(rs.getDouble("min"));
            sensor.setCreatedAt(rs.getTimestamp("created_at"));
            sensor.setUpdatedAt(rs.getTimestamp("updated_at"));
            sensor.setIsDeleted(rs.getByte("is_deleted"));
            allSensors.add(sensor);
        }
        return allSensors;
    }
}
