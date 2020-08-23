<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.util.*" %>  
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "girishdb";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<title> CoronaKit </title>
</head>
<body>
<jsp:include page="visitor.jsp" />
<form action ="addKit" method="post">

<h3> Items  currently in stock </h3>

	<table border="3" cellspacing="7px" cellpadding="7px">
	<tr>
		<th>Item Number</th>
		<th>Name</th>
		<th>Cost</th>
		<th>Description</th>	
	</tr>
	<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from coronakit";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("cost") %></td>
<td><%=resultSet.getString("description") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</table>
	<br>
<hr/>
<br>
<div>
<label>Select Item </label>
<Select name = "itemName" required>
<option>--SELECT--</option>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from coronakit";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){ 
%>
<option><%=resultSet.getString("name")%></option>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</Select>
</div>
<br>
<div>
<label>Quantity :</label>
<input type = "text"  name = "quantity"/>
</div>
<br>
<div>
<label>Your Name :</label>
<input type = "text"  name = "Name"/>
</div>
<br>
<div>
<label>Your Address :</label>
<textarea name = "Address">
</textarea>
</div>
<br>
<input type = "submit" name = "save" />
</body>
</html>