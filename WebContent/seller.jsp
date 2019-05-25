<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Call Center</title>
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="assets/js/jquery.okayNav.js"></script>

    <link rel="stylesheet" type="text/css" href="assets/css/siteStyle.css">
</head>
<body style="background-image: url('image/wall.jpg');width: 100%">

    <div class="site_navBar">
        <img src="image/buy.png" class="logo" onclick="window.location.href='profileServlet'">
        <p onclick="window.location.href='logoutServlet'" >Logout</p>
    </div>

    <div class="userProfileBox">
        <h1>Seller Profile</h1>
        <form action="">
        	<br><br>
            <input type="submit" value="">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="">
        </form>
    </div>

</body>
</html>