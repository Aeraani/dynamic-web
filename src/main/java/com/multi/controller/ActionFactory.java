package com.multi.controller;


//Mapper역활을 수행합니다
public class ActionFactory {
    private static ActionFactory actionFactory;

    //싱글패턴 (단 한번생성)
    public static ActionFactory getInstance() {
        if (actionFactory == null) {
            actionFactory = new ActionFactory();
        }
        return actionFactory;
    }
    //DispatcherServlet으로부터 cmd를 전달받아서 명령과 관련된 객체 생성
    public Action getAction(String cmd) {
        Action action = null;
        if(cmd.equals("write")) {//write.do?cmd=write
            action = new WriteAction("list.do?cmd=list",true); //redirect
        }else if(cmd.equals("list")) {//*.do라는  url이면 getAction이 불려진다
            //new ListAction생성할때.. path,redirect는 ActionForward로 저장해서 returnsp
            action = new ListAction("view/mvclist.jsp",false); //forward
        }//mvclogin.jsp를  forward해서 화면을 보여주기
        else if(cmd.equals("loginui")) {
            action=new UiAction("view/mvclogin.jsp",false); //forward
        }else if(cmd.equals("loginprocess")) {
            action=new LoginProcessAction("list.do?cmd=list",true); //redirect
        }
        return action;
    }
}