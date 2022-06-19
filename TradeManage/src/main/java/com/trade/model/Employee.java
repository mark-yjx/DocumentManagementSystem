package com.trade.model;

public class Employee {
    private Integer employeeid;
    private String employeename;
    private String employeepass;
    private String remployeepass;
    private String email;
    private Integer employeerole;

    public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getEmployeepass() {
        return employeepass;
    }

    public void setEmployeepass(String employeepass) {
        this.employeepass = employeepass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getEmployeerole() {
        return employeerole;
    }

    public void setEmployeerole(Integer employeerole) {
        this.employeerole = employeerole;
    }

    public String getRemployeepass() {
        return remployeepass;
    }

    public void setRemployeepass(String remployeepass) {
        this.remployeepass = remployeepass;
    }
}
