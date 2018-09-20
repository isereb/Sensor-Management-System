package controllers;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private DataSource dataSource;
    private Connection connection;

    private static final String url = "jdbc:mysql://localhost/sms";
    private static final String user = "user";
    private static final String pass = "3231323";

    private ConnectionManager() {
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            this.dataSource = (DataSource) ctx.lookup("jdbc/final");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public void open() throws SQLException {
        try
        {
            if(connection==null || connection.isClosed())
                connection = dataSource.getConnection();
        }
        catch(SQLException e) { throw e; }
    }

    public void close() throws SQLException {
        try
        {
            if(connection != null && !connection.isClosed())
                connection.close();
        }
        catch(SQLException e) { throw e; }
    }

    /**
     * Create a connection
     * @return Connection to a database
     */
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("SQL Exception");
            e.printStackTrace();
        }
        return null;
    }

    private static class DAOManagerSingleton {

        public static final ThreadLocal<ConnectionManager> INSTANCE;
        static
        {
            ThreadLocal<ConnectionManager> dm;
            try
            {
                dm = new ThreadLocal<ConnectionManager>(){
                    @Override
                    protected ConnectionManager initialValue() {
                        try
                        {
                            return new ConnectionManager();
                        }
                        catch(Exception e)
                        {
                            return null;
                        }
                    }
                };
            } catch(Exception e) {
                dm = null;
            }
            INSTANCE = dm;
        }

    }

}
