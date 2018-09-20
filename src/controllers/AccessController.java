package controllers;

import beans.AbstractEntity;
import exceptions.EntityNotFoundException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public class AccessController implements Controllable {
    @Override
    public AbstractEntity find(int id) throws SQLException, EntityNotFoundException {
        return null;
    }

    @Override
    public Set<AbstractEntity> findAll() throws SQLException {
        return null;
    }

    @Override
    public void create(AbstractEntity entity) throws SQLException {

    }

    @Override
    public Set<AbstractEntity> getSet(ResultSet rs) throws SQLException {
        return null;
    }
}
