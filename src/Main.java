import beans.AbstractEntity;
import beans.MonitoringEntity;
import beans.SensorEntity;
import beans.UserEntity;
import controllers.MonitoringController;
import controllers.SensorController;
import controllers.UserController;
import exceptions.EntityNotFoundException;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Main {

//    UserController userController = new UserController();

    public static void main(String[] args) throws SQLException, EntityNotFoundException {
        //displayAllUsers();
        //checkUser();
        //createSensor();
        //viewSensors();
        //viewMySensors();
        //createSomeUser();
//        Set<AbstractEntity> set;
//        SensorController sc = new SensorController();
//        set = sc.findByOwner(2);
//        Iterator iter = set.iterator();
//        while (iter.hasNext()) {
//            System.out.println(iter.next());
//        }
//
//        MonitoringController mc = new MonitoringController();
//        Set<AbstractEntity>  mSet = null;
//        mSet = mc.findByOwner(2);
//        Iterator iter2 = mSet.iterator();
//        while (iter2.hasNext()) {
//            System.out.println(iter2.next());
//        }


        //createSensorValues(10);
    }



    private static void viewMySensors() throws SQLException, EntityNotFoundException {
        UserController uc = new UserController();
        UserEntity user = uc.find(2);
        uc.getSensors().forEach(entity -> {
            System.out.println(((SensorEntity) entity).getAddress() + "\n" +
                "Created at: " + ((SensorEntity) entity).getCreatedAt() + "\n");
        });
    }

    private static void viewSensors() throws SQLException {
        SensorController sc = new SensorController();
        Set<AbstractEntity> sensors = sc.findAll();
        sensors.forEach( entity -> {
            System.out.println(((SensorEntity) entity).getAddress() + "\n" +
                    "Created at: " + ((SensorEntity) entity).getCreatedAt() + "\n");
        });

    }

    private static void createSensor() throws SQLException {
        SensorController sc = new SensorController();
        SensorEntity sensor = new SensorEntity();
        sensor.setAddress("33 street, Brampton, ON");
        sensor.setIsDeleted((byte) 0);
        sensor.setMax(50);
        sensor.setMin(20);
        sensor.setOwner(3);
        sensor.setPassword("pass");
        sc.create(sensor);
    }

    private static void checkUser() throws SQLException, EntityNotFoundException {
        UserController userController = new UserController();
        System.out.println(
            userController.performCheck(
                new UserEntity("myUniqueUsername","myUniquePassword" )
            )
        );
    }

    public static void createSomeUser() throws SQLException {
        UserController userController = new UserController();
        UserEntity userEntity = new UserEntity();
        userEntity.setUsername("UTest");
        userEntity.setEmail("test@email.com");
        userEntity.setPassword("pass");
        userEntity.setName("Test Testy");
        userEntity.setPhone(123123);
        userController.create(userEntity);
    }

    public static void createSensorValues(int id) throws SQLException {
        MonitoringController mc = new MonitoringController();
        MonitoringEntity monEntity = new MonitoringEntity();
        for(int i = 0; i<10 ; i++) {
            monEntity.setSensor(id);
            monEntity.setValue(26+i*3 +(i/5));
            mc.create(monEntity);
        }
    }

    public static UserEntity getUser(int id) throws SQLException, EntityNotFoundException {
        UserController userController = new UserController();
        return userController.find(id);
    }

    public static Set<AbstractEntity> findAll() throws SQLException {
        UserController userController = new UserController();
        return userController.findAll();
    }


    public static void displayAllUsers() throws SQLException {
        Set<AbstractEntity> allUsers = findAll();
        allUsers.forEach(entity -> {
            UserEntity user = (UserEntity) entity;
            System.out.println(user.toString());
        });
    }

}
