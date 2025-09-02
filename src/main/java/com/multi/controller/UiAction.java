package com.multi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//ui를 forward를 통해서 보여주는 역활
public class UiAction  implements Action {
    private String path;
    private boolean isRedirect;

    public UiAction(String path, boolean isRedirect) {
        this.path = path;
        this.isRedirect = isRedirect;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public boolean isRedirect() {
        return isRedirect;
    }

    public void setRedirect(boolean redirect) {
        isRedirect = redirect;
    }

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        //login을 클릭했을 때.. mvclogin 화면을 forward로 보여준다
        return new ActionForward(path, isRedirect);
    }
}