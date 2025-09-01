package com.multi.controller;


//비지니스로직을 수행하고 어느 페이지로 어떻게 이용 할지 판단하는 클래스
//path list.jsp로 이동하거나. list.do?cmd=list와 같은 path이동을 연습..
public class ActionForWard {
    private String path;
    private boolean isRedirect;

    public ActionForWard() {
    }

    public ActionForWard(String path, boolean isRedirect) {
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
}