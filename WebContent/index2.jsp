<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css2/css2.css">
</head> 
<body>

	<%@ include file="common/header2.jsp" %>
	<%@ include file="common/nav2.jsp" %>
	<section>
	<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : "";
		
		switch(section) {
		case "registration_sale":
			%> <%@ include file="section2/registration_sale.jsp" %> <%
			break;
		case "lookup_sale":
			%> <%@ include file="section2/lookup_sale.jsp" %> <%
			break;
		case "lookup_sale_by_product":
			%> <%@ include file="section2/lookup_sale_by_product.jsp" %> <%
			break;
		case "lookup_sale_by_category":
			%> <%@ include file="section2/lookup_sale_by_category.jsp" %> <%
			break;
			
		default:
			%><pre>
			이 프로그램은 쇼핑몰 관리해주는 프로그램입니다
			</pre><%
			break;
		}
	%>
	</section>
	
	<%@ include file="common/footer2.jsp" %>
</body>
</html>