
package servlets.user;

import beans.UserEntity;
import controllers.UserController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddUser", urlPatterns = {"/user/add"})
public class AddUser extends HttpServlet {

    private List<String> errors = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserEntity newUser = new UserEntity();

        try {
            newUser.setUsername(request.getParameter("username"));
            newUser.setPassword(request.getParameter("password"));
            newUser.setEmail(request.getParameter("email"));
            newUser.setName(request.getParameter("name"));
            newUser.setPhone(Integer.parseInt(request.getParameter("phone")));
        } catch (NumberFormatException numformat) {
            numformat.printStackTrace();
            errors.add("Phone field has to contain only numeric characters");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        try {
            UserController uc = new UserController();
            uc.create(newUser);
        } catch (SQLException e) {
            e.printStackTrace();
            errors.add("Could not add user due to invalid information");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        request.setAttribute("success", true);
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.getRequestDispatcher("/registration.jsp").forward(req, resp);
    }
}