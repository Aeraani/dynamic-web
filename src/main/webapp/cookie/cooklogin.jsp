<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="copyright" />
    <%
        String id="";
        //쿠키를 읽어오자...
        Cookie []cookies=request.getCookies();
        if(cookies!=null){
            for (Cookie cook :cookies){
                if(cook.getName().equals("id")){//내가만든 cookie객체의 이름은 id입니다
                    id=cook.getValue();
                }
            }
        }
        request.setAttribute("id",id);//el을 사용하기 위해 저장합니다
    %>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

    <script>
        $(function(){//onload
            //$("input#checker").prop("checked",<%=id.length()!=0%>);
            $("input#checker").prop("checked",${id.length()!=0});//el로변경
            $("img[title='LOGIN']").click(function(){
                $("form").submit();
            });

        });
    </script>

    <link href="../css/contents.css" rel="stylesheet" type="text/css" />
</head>
<body >
<form name="login" method="post" action="cooklogprocess.jsp" >
    <div id="loginWrapper">
        <div class="loginForm">
            <fieldset>
                <legend>관리자 시스템 로그인</legend>
                <dl>
                    <dt><img src="../img/common/th_id.gif" alt="아이디" /></dt>
                    <dd><input type="text" name="id" class="text" id="user_id" value="<%=id%>" /></dd>

                    <dt><img src="../img/common/th_pw.gif" alt="비밀번호" /></dt>
                    <dd><input type="password" name="pass" class="text" id="user_passwd" /></dd>
                </dl>
                <div class="btn">
                    <img  id="btnSubmit" src="../img/button/btn_login.gif" alt="LOGIN" title="LOGIN"  />
                </div>

                <div class="saveId"> <input type="checkbox" id="checker" name="checker" />
                    <img src="../img/common/save_id.gif" alt="아이디 저장" />
                </div>
            </fieldset>
        </div>
    </div>
</form>
</body>
</html>