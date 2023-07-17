/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package attendance;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import leavelog.LeaveLog_DTO;
import utils.DBUtils;

/**
 *
 * @author Hào Cute
 */
public class ViewAttendance_DAO {

    private static String VIEW_ATTENDANCE_OF_EMPLOYEE = "select attendanceId, startHour, endHour, officeHours, total, o.employeeID "
            + "from Attendance o, EmployeeInformation e "
            + "where o.employeeId = e.employeeID AND o.employeeId like ? AND e.manageBy like ? "
            + "order by startHour desc ";

    private static String VIEW_ATTENDANCE_OF_EMPLOYEE_BY_DATE = "select attendanceId, startHour, endHour, officeHours, total, o.employeeID "
            + "from Attendance o, EmployeeInformation e "
            + "where o.employeeId = e.employeeID AND o.employeeId like ? AND e.manageBy like ? "
            + "And DAY(startHour) = ? AND Month(startHour) = ? AND YEAR(startHour) = ? "
            + "order by startHour desc";

    List<ViewAttendance_DTO> listAttendanceOfEmployees(String employeeId, String employeeIdOfManager) throws SQLException {
        List<ViewAttendance_DTO> listAttendanceOfEmployee = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(VIEW_ATTENDANCE_OF_EMPLOYEE);
            ptm.setString(1, "%" + employeeId + "%");
            ptm.setString(2, employeeIdOfManager);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int attendanceId = rs.getInt("attendanceId");
                Timestamp startHour = rs.getTimestamp("startHour");
                Timestamp endHour = rs.getTimestamp("endHour");
                float officeHours = rs.getFloat("officeHours");
                float totalHours = rs.getFloat("total");
                String tempEmployeeId = rs.getString("employeeID");
                listAttendanceOfEmployee.add(new ViewAttendance_DTO(attendanceId, startHour, endHour, officeHours, totalHours, tempEmployeeId));
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
        return listAttendanceOfEmployee;
    }

    List<ViewAttendance_DTO> listAttendanceOfEmployees(String employeeId, int dayOfMonth, int monthValue, int dayOfYear, String employeeIdOfManager) throws SQLException {
        List<ViewAttendance_DTO> listAttendanceOfEmployee = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(VIEW_ATTENDANCE_OF_EMPLOYEE_BY_DATE);
            ptm.setString(1, "%" + employeeId + "%");
            ptm.setString(2, employeeIdOfManager);
            ptm.setInt(3, dayOfMonth);
            ptm.setInt(4, monthValue);
            ptm.setInt(5, dayOfYear);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int attendanceId = rs.getInt("attendanceId");
                Timestamp startHour = rs.getTimestamp("startHour");
                Timestamp endHour = rs.getTimestamp("endHour");
                float officeHours = rs.getFloat("officeHours");
                float totalHours = rs.getFloat("total");
                String tempEmployeeId = rs.getString("employeeID");
                listAttendanceOfEmployee.add(new ViewAttendance_DTO(attendanceId, startHour, endHour, officeHours, totalHours, tempEmployeeId));
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
        return listAttendanceOfEmployee;
    }

}
