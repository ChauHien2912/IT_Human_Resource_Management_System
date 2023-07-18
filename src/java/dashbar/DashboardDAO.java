/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dashbar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import utils.DBUtils;

/**
 *
 * @author Hào Cute
 */
public class DashboardDAO {

    private final String COUNT_LEAVELOG = "select leaveLogID "
            + "from LeaveLog "
            + "where employeeId = ? ";

    public int countTotalLeaveLog(String employeeId) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(COUNT_LEAVELOG);
            ptm.setString(1, employeeId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                count += 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    private static final String GET_NUMBER_STAFF = "select count(e.employeeID) AS[count] "
            + "from EmployeeInformation as e join UserLogin as u on e.employeeID = u.employeeId "
            + "where u.roleId = '1' AND e.isActive=1";

    private static final String GET_NUMBER_HRSTAFF = "select count(e.employeeID) AS[count]  "
            + "from EmployeeInformation as e join UserLogin as u on e.employeeID = u.employeeId "
            + "where u.roleId = '2'  AND e.isActive=1";

    private static final String GET_ATTENDANCE_STAFF = " select count(e.employeeID) AS[count]  "
            + "from EmployeeInformation as e join Attendance as a on e.employeeID = a.employeeId  "
            + "join UserLogin as u on e.employeeID = u.employeeId "
            + "where CONVERT(DATE, a.startHour) = ? And u.roleId = '1' ";

    private static final String GET_ATTENDANCE_HRSTAFF = " select count(e.employeeID) AS[count]  "
            + "from EmployeeInformation as e join Attendance as a on e.employeeID = a.employeeId  "
            + "join UserLogin as u on e.employeeID = u.employeeId "
            + "where CONVERT(DATE, a.startHour) = ? And u.roleId = '2' ";

    private static final String GET_TOTAL = " select count(e.employee_ID) AS[count]  "
            + "from Employee Information as e join UserLogin as u on e.employeeID = u.employeeId "
            + "where u.roleId not like '3' AND e.isActive=1";

    public int getNumberStaff() throws SQLException {
        int Staff = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_STAFF);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    Staff = rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return Staff;
    }

    public int getNumberHRStaff() throws SQLException {
        int HRStaff = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_HRSTAFF);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    HRStaff = rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return HRStaff;
    }

    public int getAttendanceStaff(LocalDate Date) throws SQLException {
        int aStaff = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ATTENDANCE_STAFF);
                java.sql.Date sqlDate = java.sql.Date.valueOf(Date);
                ptm.setDate(1, sqlDate);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    aStaff = rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return aStaff;
    }

    public int getAttendanceHRStaff(LocalDate Date) throws SQLException {
        int aHRStaff = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ATTENDANCE_HRSTAFF);
                java.sql.Date sqlDate = java.sql.Date.valueOf(Date);
                ptm.setDate(1, sqlDate);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    aHRStaff = rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return aHRStaff;
    }

    public int getTotal() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOTAL);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return total;
    }
}
