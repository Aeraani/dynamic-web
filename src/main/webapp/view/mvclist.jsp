<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link href="../css/contents.css" rel="stylesheet" type="text/css" />

</head>
<body >
<%--
 MVC
 Model(DTO,VO,DAO,Service) Java코드로 응용하는 부분
 View(jsp,html)보여지는 부분입니다.. view안에서는 되도독 java코드를 비권장합니다...
 어쩔수 없이 javaCode를 사용 할때는 el,jstl을 권장합니다
실제로 MVC에서 MV는 Model(로직)과 View(다지인)를 말합니다 ..
Model하고 View를  같이 사용하는 모델을 모델1이라고 합니다...
Model(로직)하고 View(디자인) 분리하는 방식을 모델2(mvc)라고합니다
그래서 Controller가 필요합니다
그래서 합쳐서 ... MVC라고합니다 그래서 MVC가 나온 목적은 Model과 View를 분리 할 목적으로 만든다

MVC학습의 선수 학습은 rediect/forward입니다
View에서 어쩔수 없이 들어가는 JavaCode부분은 El/JSTL로 대체한다
 --%>


<%--달러 브레이스 리스트는 request.getAttribute("list") --%>
<div id="wrapper">
    <div id="header">
        <div class="topInfoWrap">
            <div class="topInfoArea clfix">
                <div class="loginWrap">
                    <span class="fir">2025.05.17</span>
                    <span>13:30:22</span>
                    <span><em>님</em> 좋은 하루 되세요</span>
                    <a onclick="logoutProcess()" href="#" class="btnLogout"><img src="../img/common/btn_logout.gif"  alt="로그아웃" /></a>
                </div>
            </div>
        </div>
        <div class="gnbSubWrap">

        </div>
    </div>
    <div id="container">
        <div id="contentsWrap" class="contentsWrap">
            <div class="contents">
                <h1 class="title">게시판 리스트</h1>
                <div class="btnSet clfix mgb15">
						<span class="fr">
							<span class="button"><a href="#">검색</a></span>
							<span class="button"><a href="#">글쓰기</a></span>
						</span>
                </div>

                <table class="bbsWrite mgb35">
                    <caption></caption>
                    <colgroup>
                        <col width="30" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>검색</th>
                        <td>
                            <select>
                                <option>선택하세요</option>
                            </select>
                            <input type="text" name="" class="inputText" size="30" />
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="bbsList">
                    <colgroup>
                        <col width="30" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                        <col width="150" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="fir">NO</th>
                        <th scope="col">EMPNO</th>
                        <th scope="col">ENAME</th>
                        <th scope="col">SAL</th>
                        <th scope="col">JOB</th>
                        <th scope="col">HIREDATE</th>
                    </tr>
                    </thead>

                    <c:forEach var="i" items="${list}" varStatus="cnt">
                        <tr>
                            <td class="fir">${cnt.count}</td>
                            <td>${i.empno}</td>
                            <td class="tal">${i.ename}</a></td>
                            <td>${i.sal}</td>
                            <td>${i.job}</td>
                            <td>${i.hiredate}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="paging">
                    <a href="#"><img src="../img/button/btn_first.gif" alt="처음페이지" /></a>
                    <a href="#"><img src="../img/button/btn_prev.gif" alt="이전" /></a>

                    <span>
							<a href="#">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<strong>4</strong>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
						</span>

                    <a href="#"><img src="../img/button/btn_next.gif" alt="다음" /></a>
                    <a href="#"><img src="../img/button/btn_last.gif" alt="마지막페이지" /></a>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>