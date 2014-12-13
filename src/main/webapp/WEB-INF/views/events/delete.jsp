<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");

	try

	{

		Class.forName("com.mysql.jdbc.Driver");

		String DB_URL = "jdbc:mysql://localhost/calendar?characterEncoding=UTF-8";

		Connection con = DriverManager.getConnection(DB_URL, "spring",
				"book");

		String sql = "DELETE FROM events WHERE idx=?";

		PreparedStatement pstmt = con.prepareStatement(sql); // 쿼리를 이용해 delete 실행!!

		pstmt.setInt(1, Integer.parseInt(idx));

		pstmt.executeUpdate();

		pstmt.close();

		con.close();

	}

	catch (ClassNotFoundException e)

	{

		out.println(e);

	}

	catch (SQLException e)

	{

		out.println(e);

	}

	response.sendRedirect("list.jsp");
%>
