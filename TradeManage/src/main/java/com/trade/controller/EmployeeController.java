package com.trade.controller;


import com.trade.annotation.ArchivesLog;
import com.trade.model.Employee;
import com.trade.model.Page;
import com.trade.service.EmployeeService;
import com.trade.service.RecordService;
import com.trade.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private RecordService recordService;

    @RequestMapping("queryEmployeeBypage.do")
    public String queryEmployeeBypage(Employee employee, Page page, ModelMap model) {
        page.setMaxRows(5);
        List<Employee> list = employeeService.queryByEmployee(employee);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Employee> employeeList = employeeService.queryByList(page, employee);
        for (Employee e : employeeList) {
            e.setEmployeepass(null);
        }
        model.put("page", page);
        model.put("employeeList", employeeList);
        model.put("employee", employee);
        return "/empList";
    }

    @RequestMapping("queryEmployeeBypage1.do")
    public String queryEmployeeBypage1(Page page, ModelMap model) {
        Employee employee = new Employee();
        page.setMaxRows(5);
        List<Employee> list = employeeService.queryByEmployee(employee);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Employee> employeeList = employeeService.queryByList(page, employee);
        for (Employee e : employeeList) {
            e.setEmployeepass(null);
        }
        model.put("page", page);
        model.put("employeeList", employeeList);
        model.put("employee", employee);
        return "/empList";
    }

    @RequestMapping("addEmployee.do")
    @ArchivesLog(operteContent = "????????????")
    public String addEmployee(Employee employee, ModelMap model, HttpSession session) {
        if (StringUtils.isEmpty(employee.getEmployeename()) || StringUtils.isEmpty(employee.getEmployeepass())) {
            model.put("resultMessage", "???????????????????????????");
            return "forward:/queryEmployeeBypage1.do";
        }
        if (StringUtils.isEmpty(employee.getEmail())) {
            model.put("resultMessage", "??????????????????");
            return "forward:/queryEmployeeBypage1.do";
        }
        String newPass = DigestUtils.md5DigestAsHex(employee.getEmployeepass().getBytes());
        employee.setEmployeepass(newPass);
        employeeService.save(employee);

        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "???????????????" + employee.getEmployeename());
        return "redirect:/queryEmployeeBypage.do";
    }

    @RequestMapping("updateEmployee.do")
    @ArchivesLog(operteContent = "??????????????????")
    public String updateEmployee(Employee employee, HttpSession session) {
        if (!StringUtils.isEmpty(employee.getEmployeepass())) {
            employee.setEmployeepass(DigestUtils.md5DigestAsHex(employee.getEmployeepass().getBytes()));
        }
        employeeService.update(employee);

        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "???????????????" + employee.getEmployeename());
        return "redirect:/queryEmployeeBypage.do";
    }

    @RequestMapping("deleteEmployeeByid.do")
    @ArchivesLog(operteContent = "????????????")
    public String deleteEmployeeByid(Employee employee, ModelMap model, HttpSession session) {
        employee = employeeService.queryById(employee.getEmployeeid());
        if (employee.getEmployeerole().equals(1)) {
            model.put("resultMessage", "?????????????????????");
        } else {
            employeeService.deleteById(employee.getEmployeeid());
            model.put("resultMessage", "????????????");

            Employee emp = (Employee) session.getAttribute("emp");
            recordService.save(emp.getEmployeename(), "???????????????" + employee.getEmployeename());
        }
        return "forward:/queryEmployeeBypage1.do";
    }

    @RequestMapping("login.do")
    @ArchivesLog(operteContent = "????????????")
    public String login(Employee employee, HttpSession session, ModelMap model) {
        if (employee.getEmployeename().equals("") || employee.getEmployeepass().equals("")) {
            model.put("resultMessage", "??????????????????????????????");
            return "index";
        }
        employee.setEmployeepass(DigestUtils.md5DigestAsHex(employee.getEmployeepass().getBytes()));
        List<Employee> emplList = employeeService.queryByEmployee(employee);
        if (emplList.size() > 0) {
            employee = emplList.get(0);
            session.setAttribute("emp", employee);
            return "main";
        } else {
            model.put("resultMessage", "????????????????????????");
            return "index";
        }
    }

    @RequestMapping("toRegistry.do")
    public String toRegistry(HttpServletRequest request) {
        System.out.println(1);
        return "/registry";
    }

    @RequestMapping("registry.do")
    @ArchivesLog(operteContent = "????????????")
    public String registry(Employee employee, HttpSession session, ModelMap model) {
        if (employee.getEmployeename().equals("") || employee.getEmployeepass().equals("")) {
            model.put("resultMessage", "??????????????????????????????");
            return "registry";
        }

        if (!employee.getEmployeepass().equals(employee.getRemployeepass())) {
            model.put("resultMessage", "???????????????????????????");
            return "registry";
        }

        String newPass = DigestUtils.md5DigestAsHex(employee.getEmployeepass().getBytes());
        employee.setEmployeepass(newPass);
        employee.setEmployeerole(0);
        employeeService.save(employee);
        model.put("resultMessage", "????????????");
        return "index";
    }

    @RequestMapping("logout.do")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("emp");
        return "index";
    }
}
