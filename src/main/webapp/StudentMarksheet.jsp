<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.java.UsernameUtility" %>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="CSS/StudentMarksheet.css">
    <title>Student Marks</title>
</head>
<body>
	<form method="post">
        <label for="Sem">Select Semester</label>
        <select name="sem" id="Sem">
            <option value="sem1">Semester 1</option>
            <option value="sem2">Semester 2</option>
            <option value="sem3">Semester 3</option>
            <option value="sem4">Semester 4</option>
            <option value="sem5">Semester 5</option>
            <option value="sem6">Semester 6</option> 
        <!--    <option value="sem7">Semester 7</option>
            <option value="sem8">Semester 8</option>  -->
        </select>
        <br>	
        <input class="box" type="submit" value="View Marksheet">
    </form>
	<%
	String username = UsernameUtility.getUsername();
    // Check if the form is submitted
    if (request.getMethod().equals("POST")) {
        // Retrieve form data
        String course = request.getParameter("course");
        String sem = request.getParameter("sem");
        String studentId = request.getParameter("id");

        // Define MySQL database connection details
        String url = "jdbc:mysql://localhost:3306/admindb";
        String Username = "root";
        String password = "Yash@297";

        // Establish database connection
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(url, Username, password);

            // Create SQL query to fetch data
            String sql = "SELECT " + 
             "cse_" + sem + "_subjects.subject_name, " + 
             "cse_" + sem + "_subjects.subject_code, " + 
             "cse_" + sem + "_subjects.credit, " + 
             "cse_" + sem + "_marksheet.theory_mse, " + 
             "cse_" + sem + "_marksheet.theory_ese, " + 
             "cse_" + sem + "_marksheet.practical_mse, " + 
             "cse_" + sem + "_marksheet.practical_ese " +
             "FROM cse_" + sem + "_students " +
             "JOIN cse_" + sem + "_marksheet ON " + 
             "cse_" + sem + "_students.student_id = " + 
             "cse_" + sem + "_marksheet.student_id " +
             "JOIN cse_" + sem + "_subjects ON " + 
             "cse_" + sem + "_subjects.subject_id = " + 
             "cse_" + sem + "_marksheet.subject_id " +
             "WHERE cse_" + sem + "_students.student_id ='"+ username +"'";


            stmt = conn.createStatement();

            // Execute the query
            rs = stmt.executeQuery(sql);

%>
<div class="container">
    <table border="1" style="width: 100%; border-collapse: collapse; margin-top: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <tr>
            <th>Subject Name</th>
            <th>Subject Code</th>
            <th>CREDIT</th>
            <th>MSE Theory</th>
            <th>ESE Theory</th>
            <th>MSE Practical</th>
            <th>ESE Practical</th>
        </tr>
        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getString("subject_name") %></td>
            <td><%= rs.getString("subject_code") %></td>
            <td><%= rs.getInt("credit") %></td>
            <td><%= rs.getInt("theory_mse") %></td>
            <td><%= rs.getInt("theory_ese") %></td>
            <td><%= rs.getInt("practical_mse") %></td>
            <td><%= rs.getInt("practical_ese") %></td>
        </tr>
        <% } %>
    </table>
    
</div>
<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>



</body>
</html>