package controllers;

import beans.AbstractEntity;
import beans.UserEntity;
import exceptions.EntityNotFoundException;

import java.sql.*;
import java.util.Set;
import java.util.TreeSet;

public class UserController implements Controllable {

    private int userId;

    public int getUserId() {
        return userId;
    }
    public void setUserId(UserEntity user) {
        userId = user.getId();
    }

    public UserController() {}

    public UserController(UserEntity user) {
        setUserId(user);
    }

    /**
     * Finds user by earlier defined field userId.
     * Method is for usage right after calling performCheck method,
     * that will check credentials and store id of the user in userId field.
     * @return UserEntity
     * @throws SQLException In case of SQL Related issues
     */
    public UserEntity find() throws SQLException, EntityNotFoundException {
        return find(getUserId());
    }

    /**
     * @param id Retrieve everything about user by his id
     * @return UserEntity
     * @throws SQLException In case of SQL Side issues
     */
    @Override
    public UserEntity find(int id) throws SQLException, EntityNotFoundException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        PreparedStatement getUser = conn.prepareStatement("SELECT * FROM user WHERE id = ?");
        getUser.setInt(1, id);
        ResultSet rs = getUser.executeQuery();
        UserEntity userEntity;
        if (rs.next()) {
            userEntity = new UserEntity();
            userEntity.setId(id);
            userEntity.setUsername(rs.getString("username"));
            userEntity.setEmail(rs.getString("email"));
            userEntity.setPassword(rs.getString("password"));
            userEntity.setName(rs.getString("name"));
            userEntity.setPhone(rs.getInt("phone"));
            userEntity.setCreatedAt(rs.getTimestamp("created_at"));
            userEntity.setUpdatedAt(rs.getTimestamp("updated_at"));
            userEntity.setLastLogin(rs.getTimestamp("last_login"));
        } else {
            throw new EntityNotFoundException("User (id: " + id + ") not found");
        }
        setUserId(userEntity);
        conn.close();
        return userEntity;
    }

    /**
     * Get all users
     * @return Distinct set of all users
     * @throws SQLException In case of SQL related issues
     */
    @Override
    public Set<AbstractEntity> findAll() throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;
        try {
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM user");
            return getSet(rs);
        } finally {
            conn.close();
        }
    }

    /**
     * @param entity UserEntity to be created in a database
     * @throws SQLException In case of SQL Side issues
     */
    @Override
    public void create(AbstractEntity entity) throws SQLException {
        if (entity instanceof UserEntity) {
            Connection conn = ConnectionManager.getConnection();
            assert conn != null;
            try {
                UserEntity user = (UserEntity) entity;
                PreparedStatement prep = conn.prepareStatement(
                    "INSERT INTO user " +
                        "(username, email, password, name, phone, last_login, created_at, updated_at) " +
                        "VALUES (?,?,?,?,?,?,?,?)");
                prep.setString(1, user.getUsername());
                prep.setString(2, user.getEmail());
                prep.setString(3, user.getPassword());
                prep.setString(4, user.getName());
                prep.setInt(5, user.getPhone());
                ;
                prep.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
                prep.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
                prep.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
                prep.execute();
                prep.close();
            } finally {
                conn.close();
            }
        }
    }

    /**
     * Updates username, password, email, name, phone.
     * Automatically updates updated_at field.
     * @param entity UserEntity to be updated
     * @throws SQLException In case of SQL issues
     */
    @Override
    public void update(AbstractEntity entity) throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        assert conn != null;

        UserEntity user = (UserEntity) entity;
        PreparedStatement prep = conn.prepareStatement(
            "UPDATE user SET username = ?, email = ?, password = ?, " +
                "name = ?, phone = ?, updated_at = ? WHERE id = ?;"
        );
        prep.setString(1, user.getUsername());
        prep.setString(2, user.getEmail());
        prep.setString(3, user.getPassword());
        prep.setString(4, user.getName());
        prep.setInt(5, user.getPhone());;
        prep.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
        prep.setInt(7, user.getId());
        prep.execute();
        prep.close();
        conn.close();
    }

    /**
     * Check if given username and password match database records
     * @param username Username to be checked
     * @param password Password to be checked
     * @return true in case user was found, false otherwise
     * @throws SQLException In case of SQL related issues
     */
    public boolean performCheck(String username, String password) throws SQLException, EntityNotFoundException {
        Connection conn = ConnectionManager.getConnection();
        if (conn == null) {
            throw new SQLException("Connection not found, please make sure database credentials are correct");
        }
        try {
            PreparedStatement prep = conn.prepareStatement("SELECT id FROM user WHERE username = ? AND password = ?");
            prep.setString(1, username);
            prep.setString(2, password);
            ResultSet rs = prep.executeQuery();
            boolean success = rs.next();
            try {
                userId = rs.getInt("id");
                return success;
            } catch (Exception e) {
                throw new EntityNotFoundException();
            }
        } finally {
            conn.close();
        }
    }

    /**
     * Check if given username and password match database records
     * @param user User bean that has to be checked
     * @return true in case user was found, false otherwise
     * @throws SQLException In case of SQL related issues
     */
    public boolean performCheck(UserEntity user) throws SQLException, EntityNotFoundException {
        return performCheck(user.getUsername(), user.getPassword());
    }

    /**
     * Get all sensors that belong to the user
     * @return Set of SensorEntity
     * @throws SQLException In case of SQL related issues
     * @throws EntityNotFoundException In case nothing is found
     */
    public Set<AbstractEntity> getSensors() throws SQLException, EntityNotFoundException {
        SensorController sc = new SensorController();
        return sc.findByOwner(getUserId());
    }

    @Override
    public Set<AbstractEntity> getSet(ResultSet rs) throws SQLException {
        Set<AbstractEntity> users = new TreeSet<>();
        while (rs.next()) {
            UserEntity user = new UserEntity();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setName(rs.getString("name"));
            user.setPhone(rs.getInt("phone"));
            user.setLastLogin(rs.getTimestamp("last_login"));
            user.setUpdatedAt(rs.getTimestamp("updated_at"));
            user.setCreatedAt(rs.getTimestamp("created_at"));
            users.add(user);
        }
        return users;
    }
}
