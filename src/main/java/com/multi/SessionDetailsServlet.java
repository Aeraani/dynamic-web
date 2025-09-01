package com.multi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/sessionDetails")
public class SessionDetailsServlet extends HttpServlet {
    public SessionDetailsServlet() {
        System.out.println("SessionDetailsServlet");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String sessionId = session.getId();
        System.out.println("sessionId = " + sessionId);

        long creationtime=session.getCreationTime();
        System.out.println("creationTime = " + creationtime);

        long lastaccesstime=session.getLastAccessedTime();
        System.out.println("lastaccesstime = " + lastaccesstime);

        session.setMaxInactiveInterval(60);
        System.out.println("session.setMaxInactiveInterval = " + session.getMaxInactiveInterval());

        boolean isnew=session.isNew();
        System.out.println("session.isNew = " + isnew);

        session.setAttribute("name", "taeran");
        session.setAttribute("age", 30);

        Enumeration<String>attributeNames=session.getAttributeNames();
        while(attributeNames.hasMoreElements()){
            String name=attributeNames.nextElement();
            System.out.println("name = " + name+", value = " + session.getAttribute(name));
        }

    }


}
