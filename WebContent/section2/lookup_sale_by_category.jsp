<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 매출 현황</h3>
<table border="1">
<tr>
	<td>카테고리명</td>
	<td>총 판매 금액</td>
	<td>판매 개수</td>
</tr>
	<%
	    try
	    {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection(
	        "jdbc:oracle:thin:@122.128.169.32:1521/xe", "smc_user_12", "1234");
	        Statement stmt=con.createStatement();
	
	        String query = "SELECT " +
	        	    "CATEGORY.CATEGORY_ID as CATEGORY_ID, " +
	        	    "CATEGORY.NAME, " +
	        	    "SUM(SALE.SALE_PRICE) as PRICE, " +
	        	    "SUM(SALE.AMOUNT)as AMOUNT " +
	        	"FROM " +
	        	    "CATEGORY, SALE, PRODUCT " +
	        	"WHERE " +
	        	   	"SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID AND " +
	        	    "PRODUCT.CATEGORY_ID = CATEGORY.CATEGORY_ID " +
	        	"GROUP BY " +
	    	        "CATEGORY.CATEGORY_ID, CATEGORY.NAME " +
	    	    "ORDER BY " +
	    	    	"CATEGORY_ID ASC ";
				
	        ResultSet rs=stmt.executeQuery(query);
	        while(rs.next()) {
	            %>
	            	<tr>
	            		<td><%=rs.getString("NAME") %></td>
	            		<td><%=rs.getInt("PRICE") %></td>
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