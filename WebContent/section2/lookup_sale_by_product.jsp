<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품별 매출 현황</h3>
<table border="1">
<tr> 
	<td>상품명</td>
	<td>총 판매 금액</td>
	<td>판매 개수</td>
</tr>
	<%
	    try
	    {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection(
	        "jdbc:oracle:thin:@//122.128.169.32:1521/xe", "smc_user_12", "1234");
	        Statement stmt=con.createStatement();
	
	        String query = "SELECT " +
	        		"SALE.SALE_ID, " +
	        	    "PRODUCT.NAME, " +
	        	    "PRODUCT.PRICE * SALE.AMOUNT as money, " +
	        	    "SALE.AMOUNT " +
	        	"FROM " +
	        	    "PRODUCT, SALE " +
	        	"WHERE " +
	        	    "SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID ";
				
	        ResultSet rs=stmt.executeQuery(query);
	        while(rs.next()) {
	            %>
	            	<tr>
	            		<td><%=rs.getString("NAME") %></td>
	            		<td><%=rs.getInt("money") %></td>
	            		<td><%=rs.getInt("AMOUNT") %></td>
	            	</tr>
	            <%
	        }
	        con.close();
	    }
	    catch(Exception e)
	    { 
	        System.out.println(e);
	    }
	%>
</table>