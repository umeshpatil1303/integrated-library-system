/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author umesh patil
 */
@WebServlet(urlPatterns = {"/logout"})
public class logout extends HttpServlet {
public void service(HttpServletRequest request, HttpServletResponse response)
{
    HttpSession session = request.getSession();
    
    session.setMaxInactiveInterval(0);
    try {
        response.sendRedirect("login2.html");
    } catch (IOException ex) {
       ex.getMessage();
    }
}
}
