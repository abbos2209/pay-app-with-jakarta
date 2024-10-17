package uz.click.controller.mainPage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AuthService;


import java.io.IOException;

@WebServlet("/auth/sign-in")
public class SignIn extends HttpServlet {
    AuthService authService = AuthService.getAuthService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("state",false);
        req.getRequestDispatcher("/views/login/auth.jsp").forward(req, resp);
        System.out.println("123");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        authService.signIn(req, resp);
    }
}
