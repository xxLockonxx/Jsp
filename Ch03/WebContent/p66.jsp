<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>�� ���ϱ�</title></head>
<body>
<%
	int sum = 0;
	for(int i = 1 ; i <= 10; i++) {
			sum = sum + i;
	}
%>
1���� 10������ ���� <%= sum %> �Դϴ�.

<br>

<%
	int sum2 = 0;
	for(int i = 11 ; i<=20 ; i++) {
		sum2 = sum2+ i;
	}
%>
11���� 20������ ���� <%=sum2 %> �Դϴ�.
</body>
</html>