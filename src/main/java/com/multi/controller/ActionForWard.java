package com.multi.controller;

//비즈니스 직을 수행하고 어느 페이지로 어떻게 이용할지 판단하는 클래스
//path에는 이동할 경로를 작성 (list.jsp로 이동하고나 lost.do?cmd=list와 같은 path이동)
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