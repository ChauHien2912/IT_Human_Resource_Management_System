/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package payroll;

import java.sql.Date;

/**
 *
 * @author Hào Cute
 */
public class Payroll_DTO {
    private int payID;
    private String fullName;
    private String employeeID;
    private Date paidDate; 
    private int month;
    private float officeHours;
    private float otHours;
    private float ot_income;
    private float stand_income;
    private float BHXH;
    private float BHTN;
    private float TNCN;
    private float allowance;
    private float total;
    private float salary;
    private float totalHours;
    
    public Payroll_DTO() {
    }

    public Payroll_DTO(int payID, String fullName, String employeeID, Date paidDate, int month, float officeHours, float otHours, float ot_income, float stand_income, float BHXH, float BHTN, float TNCN, float allowance, float total, float salary, float totalHours) {
        this.payID = payID;
        this.fullName = fullName;
        this.employeeID = employeeID;
        this.paidDate = paidDate;
        this.month = month;
        this.officeHours = officeHours;
        this.otHours = otHours;
        this.ot_income = ot_income;
        this.stand_income = stand_income;
        this.BHXH = BHXH;
        this.BHTN = BHTN;
        this.TNCN = TNCN;
        this.allowance = allowance;
        this.total = total;
        this.salary = salary;
        this.totalHours = totalHours;
    }

    public int getPayID() {
        return payID;
    }

    public void setPayID(int payID) {
        this.payID = payID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public float getOfficeHours() {
        return officeHours;
    }

    public void setOfficeHours(float officeHours) {
        this.officeHours = officeHours;
    }

    public float getOtHours() {
        return otHours;
    }

    public void setOtHours(float otHours) {
        this.otHours = otHours;
    }

    public float getOt_income() {
        return ot_income;
    }

    public void setOt_income(float ot_income) {
        this.ot_income = ot_income;
    }

    public float getStand_income() {
        return stand_income;
    }

    public void setStand_income(float stand_income) {
        this.stand_income = stand_income;
    }

    public float getBHXH() {
        return BHXH;
    }

    public void setBHXH(float BHXH) {
        this.BHXH = BHXH;
    }

    public float getBHTN() {
        return BHTN;
    }

    public void setBHTN(float BHTN) {
        this.BHTN = BHTN;
    }

    public float getTNCN() {
        return TNCN;
    }

    public void setTNCN(float TNCN) {
        this.TNCN = TNCN;
    }

    public float getAllowance() {
        return allowance;
    }

    public void setAllowance(float allowance) {
        this.allowance = allowance;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public float getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(float totalHours) {
        this.totalHours = totalHours;
    }
}
