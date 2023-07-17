/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package attendance;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Hào Cute
 */
public class ViewAttendance_DTO {

    public int attendanceId;
    public Timestamp startHour;
    public Timestamp endHour;
    public float officeHours;
    public float totalHours;
    public String employeeId;

    public ViewAttendance_DTO() {
    }

    public ViewAttendance_DTO(int attendanceId, Timestamp startHour, Timestamp endHour, float officeHours, float totalHours, String employeeId) {
        this.attendanceId = attendanceId;
        this.startHour = startHour;
        this.endHour = endHour;
        this.officeHours = officeHours;
        this.totalHours = totalHours;
        this.employeeId = employeeId;
    }

    public int getAttendanceId() {
        return attendanceId;
    }

    public Timestamp getStartHour() {
        return startHour;
    }

    public Timestamp getEndHour() {
        return endHour;
    }

    public float getOfficeHours() {
        return officeHours;
    }

    public float getTotalHours() {
        return totalHours;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public void setStartHour(Timestamp startHour) {
        this.startHour = startHour;
    }

    public void setEndHour(Timestamp endHour) {
        this.endHour = endHour;
    }

    public void setOfficeHours(float officeHours) {
        this.officeHours = officeHours;
    }

    public void setTotalHours(float totalHours) {
        this.totalHours = totalHours;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    
    
}
