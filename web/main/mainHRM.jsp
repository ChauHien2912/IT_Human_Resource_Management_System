
<%@page import="userlogin.User_Login_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responesive Admin Dashboard | Redesign</title>
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&display=swap" rel="stylesheet">

    </head>

    <body>
        <%
            User_Login_DTO userLogin = (User_Login_DTO) session.getAttribute("USER_LOGIN");
            if (!userLogin.getRoleName().equalsIgnoreCase("HRM")) {
                return;
            }
        %>
        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><i class="bi bi-github"></i> HRM</h3>
                </div>

                <ul class="list-unstyled components">
                    <!--Home Page-->
                    <li class="active">
                        <a href="#" class="includeButton" data-url="dashboard/dashBoard.jsp">
                            <i class="bi bi-house-door"></i> Home Page
                        </a>
                    </li>
                    <!--View Attendance-->
                    <li >
                        <a href="AttendanceController?action=viewAttendance">
                            <i class="bi bi-filter-square"></i>  HRS Attendance</a>
                    </li>
                    <!--View Information-->
                    <li>
                        <a href="#viewSubmenu" data-bs-toggle="collapse" aria-expanded="false"><i class="bi bi-filter-square"></i>  View Information</a>
                        <ul class="collapse list-unstyled" id="viewSubmenu">
                            <li><a href="#" class="includeButton" data-url="EmployeeController?action=Show Information">User Profile</a></li>
                            <li><a href="EmployeeController?action=Search Employee&search=&statusActive=All" >HRS Information</a></li>
                            <li><a href="#" class="includeButton" data-url="PayrollController?action=ViewPayRollStaff">View PayRoll HRS</a></li>
                        </ul>
                    </li>
                    <!--OverTime-->
                    <li>
                        <a href="#overSubmenu" data-bs-toggle="collapse" aria-expanded="false"><i class="bi bi-calendar-date"></i> Overtime Report</a>
                        <ul class="collapse list-unstyled" id="overSubmenu">
                            <li><a href="OverTimeController?action=ViewManagedEmployeeOverTimeReport">HRS Report</a></li>
                        </ul>
                    </li>
                    <!--Leavelog-->
                    <li>
                        <a href="#leaveSubmenu" data-bs-toggle="collapse" aria-expanded="false"><i class="bi bi-calendar-date"></i> Leave Application</a>
                        <ul class="collapse list-unstyled" id="leaveSubmenu">
                            <li><a href="LeaveLogController?action=ViewManagedEmployeeLeaveLogApplication">HRS Leave Log</a></li>
                        </ul>
                    </li>
                    <!--Candidate-->
                    <li>
                        <a href="#candSubmenu" data-bs-toggle="collapse" aria-expanded="false"><i class="bi bi-newspaper"></i> Candidate</a>
                        <ul class="collapse list-unstyled" id="candSubmenu">
                            <li><a href="ContractController?action=Search Contract&search=&statusContract=All">Contract Candidate</a></li>
                        </ul>
                    </li>
                    <!--Payroll-->
                    <li>
                        <a href="#payrollSubmenu" data-bs-toggle="collapse" aria-expanded="false"><i class="bi bi-newspaper"></i> Payroll</a>
                        <ul class="collapse list-unstyled" id="candSubmenu">
                            <li><a href="PayrollController?action=Caculate Payroll">Caculate Payroll</a></li>
                        </ul>
                    </li>
                </ul>


            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="bi bi-list"></i>
                            <span></span>
                        </button>

                        <div class="d-flex align-items-center ms-auto">
                            <div class="btn-group me-3">
                                <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-gear fs-5"></i>
                                </button>
                               <ul class="dropdown-menu">
                                    <li><a href="#" class="includeButton dropdown-item" data-url="change_password.jsp">Change Password</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item " href="LogoutController?action=Logout">Sign Out</a></li>                        
                                </ul>
                            </div>

                            <div class="">
                                <img src="image_1.jpg" width="50" height="50" alt="" class="rounded-circle">
                            </div>
                        </div>

                    </div>
                </nav>

                <!--Noi dung-->
                <div class="main">
                    <div id="includedContent">
                        <jsp:include page="${URL}"/>
                    </div>
                </div>
                <footer>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <p>&copy; 2023 - Responsive Admin Dashboard</p>
                            </div>
                            <div class="col-md-6">
                                <p class="text-md-end">Designed by Your Name</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
