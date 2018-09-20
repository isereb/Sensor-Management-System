package servlets.user;


import beans.UserEntity;
import controllers.UserController;
import exceptions.EntityNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = {"/user/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<String> errors = new ArrayList<>();

        UserController userController = new UserController();
        UserEntity userEntity = null;

        try {
            if (userController.performCheck(username, password))
                userEntity = userController.find();
        } catch (EntityNotFoundException enf) {
            errors.add("User with given username or password is not found");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        } catch (SQLException e) {
            errors.add("Something went wrong...");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", userEntity);
        response.sendRedirect("/main");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getRequestDispatcher ("/index.jsp").forward(request, response);
    }
}
