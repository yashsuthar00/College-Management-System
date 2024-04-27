<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subjects Administration</title>
    <!-- Style and CSS Imports -->
    <!-- Example CSS (adjust as needed) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600&display=swap">
    <style>
       
/*=========================header css==============================*/
    /*=============== GOOGLE FONTS ===============*/
@import url("https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600&display=swap");

/*=============== VARIABLES CSS ===============*/
:root {
  --header-height: 3.5rem;

  /*========== Colors ==========*/
  /*Color mode HSL(hue, saturation, lightness)*/
  --first-color: hsl(230, 75%, 56%);
  --title-color: hsl(230, 75%, 15%);
  --text-color: hsl(230, 12%, 40%);
  --body-color: hsl(230, 100%, 98%);
  --container-color: hsl(230, 100%, 97%);
  --border-color: hsl(230, 25%, 80%);

  /*========== Font and typography ==========*/
  /*.5rem = 8px | 1rem = 16px ...*/
  --body-font: "Syne", sans-serif;
  --h2-font-size: 1.25rem;
  --normal-font-size: .938rem;

  /*========== Font weight ==========*/
  --font-regular: 400;
  --font-medium: 500;
  --font-semi-bold: 600;

  /*========== z index ==========*/
  --z-fixed: 100;
  --z-modal: 1000;
}

/*========== Responsive typography ==========*/
@media screen and (min-width: 1023px) {
  :root {
    --h2-font-size: 1.5rem;
    --normal-font-size: 1rem;
  }
}

/*=============== BASE ===============*/
/* * {
  box-sizing: border-box;
  padding: 0;
  margin: 0; rrrrrrrrrrrrrrrrrrr
} */



body,
input,
button {
  font-family: var(--body-font);
  font-size: var(--normal-font-size);
}

body {
  background-color: var(--body-color);
  color: var(--text-color);
  background-color: #f2f2f2;
            margin: 0;
            padding: 0;
}

input,
button {
  border: none;
  outline: none;
}

ul {
  list-style: none;
}

a {
  text-decoration: none;
}

img {
  display: block;
  max-width: 100%;
  height: auto;
}

/*=============== REUSABLE CSS CLASSES ===============*/
.container {
  max-width: 100%;
  margin-inline: 3rem;
  /* margin: 10px auto; */
}

.main {
  position: relative;
  height: 100vh;
}

.main__bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
  z-index: -1;
}



/*=============== HEADER & NAV ===============*/
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: var(--body-color);
  box-shadow: 0 2px 16px hsla(230, 75%, 32%, .15);
  z-index: var(--z-fixed);
}

.nav {
  /*height: var(--header-height); */
  height:9vh;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav__logo {
  color: var(--title-color);
  font-weight: var(--font-semi-bold);
  transition: color .4s;
}


        h2 {
            text-align: center;
        }

      form {
       	margin: 0px auto;
	    width: 30%;
	    padding: 20px;
	    margin-top: 100px;
	    background-color: #fff;
	    border-radius: 20px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    align-items: center;
	    text-align: center;
}

        label {
            font-weight: bold;
        }

        select, input[type="submit"] {
            width: 200px;
            padding: 5px;
            margin: 5px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #dddddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .search {
        width: quto;
        padding: 5px;
        border-radius: 5px;
        background-color: #fff;
        /* border: 1px solid #ccc; */
        box-sizing: border-box;
        }

        .row {
            margin-bottom: 10px;
        }
        
        .box{
        	 border: 1px solid #ccc;
			  border-radius: 5px;
			  cursor: pointer;
			  transition: all 0.3s ease;
  			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);	
        }
        
    </style>
</head>
<body>
<header class="header" id="header">
        <nav class="nav container">
           <a href="#" class="nav__logo">Indus University</a>
        </nav>
   </header>

<form method="post" action="AdminSubjects.jsp">
    <h2>Select Course and Semester</h2>
    <div>
        <label for="course">Select Course:</label>
        <select name="course" id="course">
            <option value="CSE">COMPUTER SCIENCE ENGINEERING</option>
            <option value="CE">COMPUTER ENGINEERING</option>
            <option value="IT">INFORMATION TECHNOLOGY</option>
            <option value="ME">MECHANICAL ENGINEERING</option>
            <option value="AE">AUTOMOBILE ENGINEERING</option>
        </select>
    </div>
    <div>
        <label for="sem">Select Semester:</label>
        <select name="sem" id="sem">
            <option value="sem-1">Semester 1</option>
            <option value="sem-2">Semester 2</option>
            <option value="sem-3">Semester 3</option>
            <option value="sem-4">Semester 4</option>
            <option value="sem-5">Semester 5</option>
            <option value="sem-6">Semester 6</option>
            <option value="sem-7">Semester 7</option>
            <option value="sem-8">Semester 8</option>
        </select>
    </div>
    <input type="submit" value="View Detail">
</form>

<%-- JSP Block to handle database interaction --%>
<%
String course = request.getParameter("course");
String sem = request.getParameter("sem");

if (course != null && !course.isEmpty() && sem != null && !sem.isEmpty()) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Connect to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AdminDb", "root", "Yash@297");

        // Prepare a parameterized query to fetch subject details based on course and semester
        String query = "SELECT * FROM subjects WHERE course = ? AND semester = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, course);
        pstmt.setString(2, sem);

        // Execute the query and display the results
        rs = pstmt.executeQuery();
%>

<div class="container">
    <table>
      <tr>
          <th>Course</th>
          <th>Semester</th>
          <th>Subject Code</th>
          <th>Subject Name</th>
          <th>Faculty Name</th>
          <th>Subject Credit</th>
          <th>Theory</th>
          <th>Practical</th>
      </tr>
      <% while(rs.next()) { %>
      <tr>
          <td><%= rs.getString("course") %></td>
          <td><%= rs.getString("semester") %></td>
          <td><%= rs.getString("subject_code") %></td>
          <td><%= rs.getString("subject_name") %></td>
          <td><%= rs.getString("Faculty_name") %></td>
          <td><%= rs.getString("subject_credit") %></td>
          <td><%= rs.getString("Theory") %></td>
          <td><%= rs.getString("Practical") %></td>
      </tr>
      <% } %>
  </table>
</div>

<% 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources to prevent leaks
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>

</body>
</html>