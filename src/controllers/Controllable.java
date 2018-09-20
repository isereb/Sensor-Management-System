package controllers;

import beans.AbstractEntity;
import exceptions.EntityNotFoundException;
import exceptions.EntityUpdateNotAllowedException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public interface Controllable {

    /**
     * Finds an entity by an id
     * @param id Entity id
     * @return one of the entities
     * @throws SQLException For SQL related issues
     * @throws EntityNotFoundException When person is not found with given id
     */
    AbstractEntity find(int id) throws SQLException, EntityNotFoundException;

    /**
     * Find all entities of its type
     * @return List of AbstractEntities of the same type
     */
    Set<AbstractEntity> findAll() throws SQLException;

    /**
     * Creates an entity
     * @param entity one of the entities
     * @throws SQLException For SQL related issues
     */
    void create(AbstractEntity entity) throws SQLException;

    /**
     * Updates current entity, using id field
     * By default, could not be updated
     */
    default void update(AbstractEntity entity) throws SQLException, EntityUpdateNotAllowedException {
        throw new EntityUpdateNotAllowedException();
    };

    /**
     * Used to retrieve set of entities from ResultSet
     * @param rs ResultSet from a query
     * @return Set of entities
     * @throws SQLException In case of SQL related issues
     */
    Set<AbstractEntity> getSet(ResultSet rs) throws SQLException;

}
