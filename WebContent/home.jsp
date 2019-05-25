<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Shopping</title>
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="assets/js/jquery.okayNav.js"></script>

    <link rel="stylesheet" type="text/css" href="assets/css/siteStyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body style="background-image: url('image/wall.jpg');width: 100%">

    <div class="site_navBar">
        <img src="image/buy.png" class="logo" onclick="window.location.href='profileServlet'">
        <table>
            <tr>
                <td>Email</td>
                <td>Password</td>
            </tr>
            <tr>
                <form id="loginForm">
                    <td><input type="text" id="loginEmail" placeholder="Enter Email" required></td>
                    <td><input type="password" id="loginPassword" placeholder="Enter Password" required></td>
                    <td><input type="submit" value="Login"></td>
                </form>
            </tr>
        </table>
    </div>

    <div class="registerBox">
        <h1>Sign Up Here</h1>
        <form id="registerForm">
            <p>First Name</p>
            <input type="text" id="fname" placeholder="Enter First Name" required>
            <br><br>
            <p>Last Name</p>
            <input type="text" id="lname" placeholder="Enter Last Name" required>
            <br><br>
            <p>Phone Number</p>
            <input type="tel" id="phone" pattern="[0-9]{10}" placeholder="Enter Phone Number" required>
            <br><br>
            <p>Email</p>
            <input type="email" id="email" placeholder="Enter Email" required>
            <br><br>
            <p>Password</p>
            <input type="password" id="password1" placeholder="Enter Password" required>
            <br><br>
            <p>Confirm Password</p>
            <input type="password" id="password2" placeholder="Enter Confirm Password" required>
            <br><br><br>
            <input type="submit" value="Sign Up">
        </form>
    </div>

</body>
</html>

<script>

	$(document).ready(function(){
		
		$("#registerForm").submit(function(e){
			
			var pass1 =document.getElementById("password1").value;
	        var pass2 =document.getElementById("password2").value;
			
	        if (pass1.length<6){
	        	alert("Your Password Must Contain At Least 6 Characters!");
	        }else if (pass1 != pass2){
	        	alert("Your Password & Confirm Password Are not Match!");
	            document.getElementById("password1").value = "";
	            document.getElementById("password2").value = "";
	        } else {
	        	
	        	var jsonfile = JSON.stringify({
					"fname" : $('#fname').val(),
					"lname" : $('#lname').val(),
					"email" : $('#email').val(),
					"phone" : $('#phone').val(),
					"pass1" : $('#password1').val()
				});
				
				var ans = $.ajax({
					type : 'POST',
					url : 'http://localhost:8080/OnlineShopping/rest/user/register',
					dataType : 'json',
					contentType : 'application/json',
					data : jsonfile
				});
				
				ans.done(function(data){
					if(data['success']=="1"){
						alert("Your Account Has Been Registered. You Can Login Now!");
						$('#fname').val("");
						$('#lname').val("");
						$('#email').val("");
						$('#phone').val("");
						$('#password1').val("");
						$('#password2').val("");
					}else if(data['success']=="0"){
						alert("This Email is Already Exists!");
						$('#email').val("");
					}else if(data['success']=="2"){
						alert("This Phone is Already Exists!");
						$('#phone').val("");
					}
				});
				ans.fail(function(data){
					alert("Connection Error !");
				});
				
	        }
			
			e.preventDefault();
		});
		
		$("#loginForm").submit(function(e){
			
	       	var jsonfile = JSON.stringify({
				"email" : $('#loginEmail').val(),
				"password" : $('#loginPassword').val()
			});
			
			var ans = $.ajax({
				type : 'POST',
				url : 'http://localhost:8080/OnlineShopping/rest/user/login',
				dataType : 'json',
				contentType : 'application/json',
				data : jsonfile
			});
			
			ans.done(function(data){
				if(data['success']=="3"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "seller"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/sellerServlet";
			             }
			         });
				}else if(data['success']=="2"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "admin"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/adminServlet";
			             }
			         });
				}else if(data['success']=="1"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "user"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/userServlet";
			             }
			         });
				}else if(data['success']=="0"){
					alert("Your Password Or Email Is Wrong!");
				}
			});
			ans.fail(function(data){
				alert("Connection Error !");
			});
			
			e.preventDefault();
		});
		
	});
	
	
</script>