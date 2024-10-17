package service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import uz.click.entity.User;
import uz.click.enums.Role;
import uz.click.repository.UserRepository;

import java.util.Objects;
import java.util.Optional;

public class AuthService {
    private static AuthService userService;
    UserRepository userRepository = UserRepository.getInstance();
    @SneakyThrows
    public void signIn(HttpServletRequest req, HttpServletResponse res){
        String number = req.getParameter("number");
        String password = req.getParameter("password");
        Optional<User> byNumber = userRepository.findByNumber(number);
        if (!byNumber.isPresent() || !Objects.equals(byNumber.get().getPassword(), password)) {
            req.setAttribute("has_eror",true);
            req.setAttribute("message", "Invalid email or password");
            req.getRequestDispatcher("/views/eror.jsp").forward(req, res);
            return;
        }
        User user = byNumber.get();
        HttpSession session = req.getSession();
        session.setAttribute("userId",user.getId());

        res.sendRedirect("/views/main.jsp");

    }
    @SneakyThrows
    public void signUp(HttpServletRequest req, HttpServletResponse res){

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String number = req.getParameter("number");
        String password = req.getParameter("password");
        System.out.println(name);
        System.out.println(surname);
        System.out.println(number);
        System.out.println(password);
        Optional<User> byNumber = userRepository.findByNumber(number);
        System.out.println(byNumber);
        if (byNumber.isPresent()){
            req.setAttribute("has_eror",true);
            req.getRequestDispatcher("/views/eror.jsp");
            return;
        }
        User user = new User();
        user.setName(name);
        user.setSurname(surname);
        user.setPhoneNumber(number);
        user.setPassword(password);
        user.setRole(Role.USER);
        user.setIsConfirmed(true);
        user.setIsActive(true);
        user.setCode("");
        userRepository.saveUser(user);
        res.sendRedirect("/auth/sign-in");
    }






    public static AuthService getAuthService(){
        if(userService == null){
            userService = new AuthService();
        }
        return userService;
    }
}
