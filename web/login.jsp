<%-- 
    Document   : login
    Created on : May 29, 2023, 11:39:29 AM
    Author     : Hào Cute
--%>

<!DOCTYPE html>

<html>
    <head>
        <title>Animated Login Form</title>
        <link rel="stylesheet" type="text/css" href="CSS/login.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Bacasime+Antique&display=swap"rel="stylesheet">
        
    </head>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Bacasime Antique', cursive;
        }
    </style>

    <body>




        <div class="container">
            <div class="img">
                <img src="imageLogin/1.svg">		</div>
            <div class="login-content">

                <form action="UserLoginController" method="post">
                    <img src="imageLogin/avatar.svg">
                    <h2 class="title">Welcome</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <input placeholder="Username" type="text" class="input" name="userID">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <input placeholder="Password" type="password" class="input" name="password">
                        </div>
                    </div>
                    <a href="login/run.jsp">Forgot Password?</a>
                    <input type="submit" class="btn" name="action" value="Login">
                </form>

            </div>
        </div>
        <script type="text/javascript" src="login/login.js"></script>
    </body>
</html>

