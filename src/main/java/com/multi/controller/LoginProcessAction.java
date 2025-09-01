
package com.multi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProcessAction implements  Action{
    private String path;
    private boolean isRedirecct;

    public LoginProcessAction(String path, boolean isRedirecct) {
        this.path = path;
        this.isRedirecct = isRedirecct;
    }

    @Override
    public ActionForWard execute(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("id");
        String password=request.getParameter("password");
        if(id.equals("admin")&&password.equals("1234")){//로그인 성공시....
            request.getSession().setAttribute("admin",id);
            request.getSession().setMaxInactiveInterval(60);//60초...
            //로그인 성공했을때....empList
            //path="list.do?cmd=list";
            //isRedirecct = true;

        }


        return new  ActionForWard(path, isRedirecct);
    }
}
