package controllers;

import beans.AbstractEntity;
import beans.GroupEntity;
import beans.SensorEntity;
import beans.UserEntity;
import exceptions.EntityNotFoundException;

import java.sql.*;
import java.util.Set;
import java.util.TreeSet;

public class GroupController implements Controllable {

    /**
     * Finds Group by id
     * @param id Entity id to be found
     * @return GroupEntity
     * @throws SQLException In case of SQL related issues
     * @throws EntityNotFoundException Thrown when no group was found with given id
     */
    @Override
    public AbstractEntity find(int id) throws SQLException, EntityNotFoundException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        PreparedStatement getGroup = conn.prepareStatement("SELECT * FROM group WHERE id = ?");
        getGroup.setInt(1, id);
        ResultSet rs = getGroup.executeQuery();
        AbstractEntity group;
        if (rs.next()) {
            GroupEntity g = new GroupEntity();
            g.setId(id);
            g.setName(rs.getString("name"));
            group = g;
        } else {
            throw new EntityNotFoundException("Sensor (id: " + id + ") not found");
        }
        return group;
    }


    @Override
    public Set<AbstractEntity> findAll() throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        Statement getall = conn.createStatement();
        ResultSet rs = getall.executeQuery("SELECT * FROM `group`");
        return getSet(rs);
    }

    @Override
    public void create(AbstractEntity entity) throws SQLException {
        if (entity instanceof GroupEntity) {
            Connection conn = ConnectionManager.getConnection();
            assert conn != null;

            GroupEntity group = (GroupEntity) entity;
            PreparedStatement prep = conn.prepareStatement(
                "INSERT INTO `group` (name) VALUES (?);");

            prep.setString(1, group.getName());
            prep.execute();
            prep.close();
            conn.close();
        }
    }

    public Set<AbstractEntity> getGroupMembers(GroupEntity group) throws SQLException{

        Connection conn = ConnectionManager.getConnection();
        assert conn != null;


        PreparedStatement prep = conn.prepareStatement(
            "SELECT user.id, username, email, password, phone, last_login, created_at, updated_at" +
                "FROM user " +
                "INNER JOIN access ON user.id = access.user" +
                "WHERE access.user = user.id and access.group = ?");

        prep.setInt(1, group.getId());
        ResultSet rs = prep.executeQuery();

        prep.close();
        conn.close();

        return new UserController().getSet(rs);
    }

    @Override
    public Set<AbstractEntity> getSet(ResultSet rs) throws SQLException {
        Set<AbstractEntity> allGroups = new TreeSet<>();
        while (rs.next()) {
            GroupEntity g = new GroupEntity();
            g.setId(rs.getInt("id"));
            g.setName(rs.getString("name"));
            allGroups.add(g);
        }
        return allGroups;
    }

}
