<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<title> This is a test page </title>
<body>
	Member table contents
	<table width="100%" border="1">
		<tr>
			<td>NAME</td>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try
			{
				String jdbcDriver = "jdbc:mysql://192.168.0.56:3306/testdb";
				String dbUser = "root";
				String dbPass = "Initialpw08";
				String query = "SELECT NAME FROM AAA000";

				//Create DB connection
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

				//Create Statement
				stmt = conn.createStatement();

				//Run query
				rs = stmt.executeQuery(query);

				//Print result(Run by query)
				while(rs.next())
				{
			%>
				<tr>
					<td> <%=rs.getString("NAME") %> </td>
				</tr>
			<%
				}
			}
			catch(SQLException ex)
			{
				out.println(ex.getMessage());
				ex.printStackTrace();
			}
			finally
			{
				//Close statement
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
				
				//Close connection
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			%>
	</table>
</body>
</html>