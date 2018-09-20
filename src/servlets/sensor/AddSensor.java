
package servlets.sensor;

import beans.SensorEntity;
import beans.UserEntity;
import controllers.SensorController;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddSensor", urlPatterns = {"/sensor/add"})
public class AddSensor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<>();

        UserEntity user = (UserEntity) session.getAttribute("user");

        String address;
        String pin;
        int min;
        int max;

        try {
            address = request.getParameter("address");
            pin = request.getParameter("password");
            min = Integer.parseInt(request.getParameter("min"));
            max = Integer.parseInt(request.getParameter("max"));
        } catch (NumberFormatException numformat) {
            errors.add("Min and Max have to be numeric");
            request.setAttribute("errors", errors);
            doGet(request, response);
            return;
        }

        try {
            SensorController sc = new SensorController();
            SensorEntity sensor = new SensorEntity();
            sensor.setAddress(address);
            sensor.setMax(max);
            sensor.setMin(min);
            sensor.setOwner(user.getId());
            sensor.setPassword(pin);
            sc.create(sensor);
        } catch (SQLException e) {
            e.printStackTrace();
            errors.add("Something went wrong");
            request.setAttribute("errors", errors);
            doGet(request, response);
        }

        request.setAttribute("success", true);
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getRequestDispatcher("/createSensor.jsp").forward(request, response);
    }

}
