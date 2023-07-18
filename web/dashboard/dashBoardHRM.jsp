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
        <div>
            <h1 class="fw-bold" style="padding-left: 5%">Home Page</h1>
        </div>
        <%
            int totalStaff = (int)request.getAttribute("totalStaff");
            int totalHRS = (int)request.getAttribute("totalHRS");
            int hrsAttendance = (int)request.getAttribute("hrsAttendance");
            int staffAttendance = (int)request.getAttribute("staffAttendance");
            int leavePerson = (int)request.getAttribute("leavePerson");
            int totalPerson = (int)request.getAttribute("totalPerson");
        %>

        <main>
            <section class="mycontent">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
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
                        <div class="col-md-6">
                            <div class="card card-success card-outline info-in-month">
                                <div class="card-header" style="background: #CCFF99">
                                    <h3 class="card-title text-center">General Information</h3>
                                    <input type="hidden" name="is_locked" value="0">
                                </div>
                                <div>
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Total Staff:</td>
                                                <td class="text-right"><%=totalStaff %></td>
                                            </tr>
                                            <tr>
                                                <td>Total HRS:</td>
                                                <td class="text-right"><%=totalHRS %></td>
                                            </tr> 
                                            <tr>
                                                <td>Total Person</td>
                                                <td class="text-right"><%=totalPerson %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-success card-outline info-in-month">
                                <div class="card-header" style="background: #CCFF99">
                                    <h3 class="card-title text-center">Current</h3>
                                    <input type="hidden" name="is_locked" value="0">
                                </div>
                                <div>
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Total Attendance Staff:</td>
                                                <td class="text-right"><%=staffAttendance %></td>
                                            </tr>
                                            <tr>
                                                <td>Total Attendance HRS</td>
                                                <td class="text-right"><%=hrsAttendance %></td>
                                            </tr> 
                                            <tr>
                                                <td>Total Leave Person</td>
                                                <td class="text-right"><%=leavePerson %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </main>
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