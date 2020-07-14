<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션체크 및 사용자 정보객체 구하기
	MemberBean mb = (MemberBean) session.getAttribute("member");

	if(mb == null){
		response.sendRedirect("/Jboard1/user/login.jsp");
	}
	
	ArticleBean article = (ArticleBean) session.getAttribute("article");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Jboard1/proc/modify.jsp">
               		<input type="hidden" name="seq" value="<%= article.getSeq() %>" />
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" value="<%= article.getTitle() %>" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"><%= article.getContent() %></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard/view.jsp?seq=<%=article.getSeq()%>" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>