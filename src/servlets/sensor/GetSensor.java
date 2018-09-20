
package servlets.sensor;

import beans.AbstractEntity;
import beans.UserEntity;
import controllers.SensorController;
import exceptions.EntityNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;


@WebServlet(name = "GetSensor", urlPatterns = {"/sensor/view"})
public class GetSensor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // TODO: 8/3/2018 AuthFilter
        UserEntity user = (UserEntity) request.getSession(false).getAttribute("user");
        SensorController sc = new SensorController();

        Set<AbstractEntity> sensors;

        try {
            sensors = sc.findByOwner(user.getId());
        } catch (SQLException | EntityNotFoundException e) {
            // TODO: 8/3/2018 Handle exception
            e.printStackTrace();
            return; // It will continue executing if you won't put this return
        }


        request.setAttribute("sensors", sensors);
        request.getRequestDispatcher("/SensorTable.jsp").forward(request,
                response);


    }
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        // Its either get or post
    }}
