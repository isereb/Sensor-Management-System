package servlets.user;

import beans.UserEntity;
import controllers.UserController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UpdateUser", urlPatterns = "/user/update")
public class UpdateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> errors = new ArrayList<>();
        UserEntity user = (UserEntity) request.getSession(false).getAttribute("user");
        try {
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("email"));
            user.setName(request.getParameter("name"));
            user.setPhone(Integer.parseInt(request.getParameter("phone")));
            UserController uc = new UserController();
            uc.update(user);
        } catch (NumberFormatException numformat) {
            errors.add("Phone field has to contain only numeric characters");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
            return;
        } catch (SQLException e) {
            errors.add("Something went wrong...");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
            return;
        }

        request.setAttribute("success", true);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
