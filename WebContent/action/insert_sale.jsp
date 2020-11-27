<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<%
int categoryid = Integer.parseInt(request.getParameter("categoryid"));
String name = request.getParameter("name");
int amount = Integer.parseInt(request.getParameter("amount"));
String purchase_date = request.getParameter("purchase_date")); 


String query = "INSERT INTO SALE(ID, CATEGORYID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN) " +
			   "VALUES(SEQ_PRODUCT.NEXTVAL, %d, '%s', %d, %d, '%s', '%s')";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	stmt.executeQuery(String.format(query, categoryid, name, price, stock, description, origin));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>