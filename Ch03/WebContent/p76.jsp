<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Insert title here</title></head>
<body>

<form action="/chap03/viewParameter.jsp" method="post">
이름 : <input type = "text" name = "name" size ="10"><br>
주소 : <input type = "text" name = "address" size ="30"><br>
좋아하는 동물 :
 <input type = "checkbox" name = "pet" size ="dog">강아지
 <input type = "checkbox" name = "pet" size ="cat">고양이
 <input type = "checkbox" name = "pet" size ="pig">돼지
<br>
<input type = "submit" value = "전송">
</form>
</body>
</html>