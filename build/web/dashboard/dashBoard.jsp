<%@page import="userlogin.User_Login_DTO"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" type="text/css" href="CSS/dashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-... Integrity code here ..." crossorigin="anonymous" />
        <style>
            .btn-checkin {
                background-color: #00a65a;
                border-color: #00a65a;
            }
            .btn-checkout {
                background-color: #ffc107;
                border-color: #ffc107;
            }

            .alert {
                padding: 10px;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <%
            int count;
            if (request.getAttribute("TOTAL_LEAVE_LOG") == null) {
                count = 0;
            } else {
                count = (int) request.getAttribute("TOTAL_LEAVE_LOG");
            }
                   
            User_Login_DTO userLogin = (User_Login_DTO) session.getAttribute("USER_LOGIN");
        %>
        <main>
            <section class="mycontent">
                <div class="container-fluid">
                    <div class="row dashboard">
                        <div class="col-lg-9">
                            <div class="card card-success card-outline">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title">Leave application</h3>

                                </div>

                                <div class="card-body p-0" style="display: block;">
                                    <div class="table-responsive text-center">
                                        <table class="table m-0">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th> Type of leave</th>
                                                    <th>Start time</th>
                                                    <th>End time</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><a href="#">#1</a>
                                                    </td>
                                                    <td>Vacation</td>
                                                    <td>2021-10-28 16:00:00</td>
                                                    <td>2021-10-30 12:00:00</td>
                                                    <td><small class="badge badge-warning">Pending approval</small></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="clearfix" style="display: block; padding: .75rem 1.25rem">
                                        <a href="#" class="float-right"> View all</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="info-box day-off-item">
                                <span class="info-box-icon bg-danger elevation-1"><i class="far fa-calendar-alt"></i></span>
                                <div class="info-box-content">
                                    <h5><a href="#" class="info-box-number name-category">Day off</a></h5>
                                    <span class="info-box-text">Used: <%=count%> days </span>
                                    <span class="info-box-text">Remaining: <%=12 - count%> days </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="sticky-top mb-3">
                                <div class="card card-success card-outline ">
                                    <div class="card-body note">
                                        <form action="AttendanceController" method="POST">
                                            <div class="alert text-center note-item" style="background-color: #00a65a">
                                                <button type="submit" name="action" value="CheckIn" class="btn btn-checkin btn-lg">Check In/Out</button>
                                            </div>
                                        </form>

                                        <div class="alert text-center note-item mb-0" style="background-color: #ffff; border: 1px solid #ccc;">
                                            <p>Message: <br/>${requestScope.MESSAGE}</p>
                                        </div>
                                    </div>
                                </div> 
                                <div class="card card-success card-outline info-in-month">
                                    <div class="card-header">
                                        <h4 class="card-title text-center">Information</h4>
                                        <input type="hidden" name="is_locked" value="0">
                                    </div>
                                    <div>
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td>Full Name</td>
                                                    <td class="text-right"><%=userLogin.getEmployeeName() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Employee ID</td>
                                                    <td class="text-right"><%=userLogin.getEmployeeId() %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                                <!--2-->                 
                            </div>
                        </div>

                        <div class="col-md-9">
                            <div class="card card-success card-outline Calendar">
                                <div class="card-header-1 month">
                                    <button class="btn btn-primary" onclick="previousMonth()">Previous Month</button>
                                    <span id="currentMonthYear"></span>
                                    <button class="btn btn-primary" onclick="nextMonth()">Next Month</button>
                                </div>
                                <div class="fc-view-container">
                                    <table id="calendar" class="card-body day-detail">
                                        <thead>
                                            <tr>
                                                <th>Sunday</th>
                                                <th>Monday</th>
                                                <th>Tuesday</th>
                                                <th>Wednesday</th>
                                                <th>Thursday</th>
                                                <th>Friday</th>
                                                <th>Saturday</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
        </script>

        <script>
            // JavaScript ?? t?o l?ch h?ng th?ng v? chuy?n ??i gi?a c?c th?ng
            var currentMonth = new Date().getMonth();
            var currentYear = new Date().getFullYear();

            function generateCalendar(month, year) {
                var calendarTable = document.getElementById("calendar").getElementsByTagName("tbody")[0];
                calendarTable.innerHTML = "";

                // Thi?t l?p ng?y ??u ti?n c?a th?ng
                var firstDay = new Date(year, month, 1).getDay();

                // L?y s? ng?y trong th?ng
                var daysInMonth = new Date(year, month + 1, 0).getDate();

                var date = 1;

                // T?o m?t d?ng cho m?i tu?n trong th?ng
                for (var week = 0; week < 5; week++) {
                    var row = calendarTable.insertRow(-1);

                    // T?o ? cho m?i ng?y trong tu?n
                    for (var day = 0; day < 7; day++) {
                        var cell = row.insertCell(-1);

                        if (week === 0 && day < firstDay) {
                            // C?c ? tr?ng tr??c ng?y ??u ti?n c?a th?ng
                            cell.innerHTML = "";
                        } else if (date > daysInMonth) {
                            // C?c ? tr?ng sau ng?y cu?i c?ng c?a th?ng
                            cell.innerHTML = "";
                        } else {
                            // C?c ? v?i ng?y trong th?ng
                            cell.innerHTML = date;

                            // X?a c?c l?p ?? ??nh d?u tr??c ??
                            cell.classList.remove("current-day");

                            // ??nh d?u ng?y hi?n t?i
                            var currentDate = new Date();
                            if (month === currentDate.getMonth() && year === currentDate.getFullYear() && date === currentDate.getDate()) {
                                cell.classList.add("current-day");
                            }

                            date++;
                        }
                    }
                }

                var monthNames = [
                    "January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                ];

                document.getElementById("currentMonthYear").innerHTML = monthNames[month] + " " + year;
            }

            function previousMonth() {
                if (currentMonth === 0) {
                    currentYear--;
                    currentMonth = 11;
                } else {
                    currentMonth--;
                }

                generateCalendar(currentMonth, currentYear);
            }

            function nextMonth() {
                if (currentMonth === 11) {
                    currentYear++;
                    currentMonth = 0;
                } else {
                    currentMonth++;
                }

                generateCalendar(currentMonth, currentYear);
            }

            // T?o l?ch h?ng th?ng ban ??u
            generateCalendar(currentMonth, currentYear);
        </script>
    </body>

</html>