package servlets.sensor;

import beans.AbstractEntity;
import beans.SensorEntity;
import beans.UserEntity;
import controllers.MonitoringController;
import controllers.UserController;
import exceptions.EntityNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;
import java.util.TreeSet;

@WebServlet(name = "MainPage", urlPatterns = "/main")
public class MainPage extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        UserController uc = new UserController((UserEntity) request.getSession(false).getAttribute("user"));
        Set<AbstractEntity> mySensors = new TreeSet<>();

        try {
            mySensors.addAll(uc.getSensors());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (EntityNotFoundException ignore) { }
        request.setAttribute("mySensors", mySensors);
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}
