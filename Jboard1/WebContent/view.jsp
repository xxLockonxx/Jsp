<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션체크 및 사용자 정보객체 구하기
	MemberBean mb = (MemberBean) session.getAttribute("member");
		
	if(mb == null){		
		response.sendRedirect("/Jboard1/user/login.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	String seq =request.getParameter("seq");
	// 밑에 24번째 줄이 psmt.setInt(1, seq); 일때는 int num = Integer.parseInt(seq);로 맞춰줘야함.
	
	// 1, 2 단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_HIT);
	psmtHit.setString(1, seq);
	
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
	psmt.setString(1, seq);
	
	// 4단계
	psmtHit.executeUpdate();
	ResultSet rs = psmt.executeQuery();
	
	
	// 5단계
	ArticleBean article = new ArticleBean(); //if문 밖에서 article선언 해야 전역에서 참조 가능
	
	if(rs.next()){
		article.setSeq(rs.getInt(1));
		article.setParent(rs.getInt(2));
		article.setComment(rs.getInt(3));
		article.setCate(rs.getString(4));
		article.setTitle(rs.getString(5));
		article.setContent(rs.getString(6));
		article.setFile(rs.getInt(7));
		article.setHit(rs.getInt(8));
		article.setUid(rs.getString(9));
		article.setRegip(rs.getString(10));
		article.setRdate(rs.getString(11));
	}
	
	// 6단계
	psmtHit.close();
	rs.close();
	psmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
                </tr>
                <% if(article.getFile() == 1){ %> <!-- 따로 테이블 나중에 만들어야 함. -->
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#">2020년 상반기 매출자료.xls</a>
                        <span>7회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%= article.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <script>
			
            	function onDelete(){
            		
            		var result = confirm("정말 삭제하시겠습니까?");
            		if(result){
            			return ture;
            		}else{
            			return false;
            		}
            		
            	}
            
            </script>
            <div>
                <a href="/Jboard1/proc/delete.jsp?seq=<%= article.getSeq() %>" onclick="return onDelete()" class="btnDelete">삭제</a>
                <a href="./modify.html" class="btnModify">수정</a>
                <a href="/Jboard1/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <% if(article.getComment() > 0){ %>
                <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                    <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <% } else { %>
                <p class="empty">등록된 댓글이 없습니다.</p>
                <% } %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/proc/comment.jsp" method = "post">
                	<input type="hidden" name="parent" value ="<%= article.getSeq() %>" />
                	<input type="hidden" name="uid" value = "<%= mb.getUid() %>" />
                    <textarea name="comment"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>