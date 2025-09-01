package com.multi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction implements  Action {
    private String path;
    private boolean isRedirect;

    public WriteAction(String path, boolean isRedirect) {
        this.path = path;
        this.isRedirect = isRedirect;
    }

    @Override
    public ActionForWard execute(HttpServletRequest request, HttpServletResponse response) {
        //BL
        System.out.println("WriteAction execute");
        return new ActionForWard(path, isRedirect);
    }
}