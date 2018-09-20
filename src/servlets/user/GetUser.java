
package servlets.user;

import beans.AbstractEntity;
import beans.UserEntity;
import controllers.UserController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;


@WebServlet(name = "GetUser", urlPatterns = {"/user/view"})
public class GetUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserController uc = new UserController();
        Set<AbstractEntity> users;
        try {
            users = uc.findAll();

        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }


        request.setAttribute("users", users);
        request.getRequestDispatcher("/UserTable.jsp").forward(request,
                response);


    }



}
