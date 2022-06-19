package com.trade.service;

import com.trade.mapper.EmployeeMapper;
import com.trade.model.Employee;
import com.trade.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper mapper;

    public Integer save(Employee employee) {
        return mapper.save(employee);
    }

    public void update(Employee employee) {
        mapper.update(employee);
    }

    public void deleteById(Integer id) {
        mapper.deleteById(id);
    }

    public int queryByCount(Employee employee) {
        return mapper.queryByCount(employee);
    }

    public List<Employee> queryByList(Page page, Employee employee) {
        String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("employeeid", employee.getEmployeeid());
        paramsMap.put("employeename", employee.getEmployeename());
        paramsMap.put("employeepass", employee.getEmployeepass());
        paramsMap.put("employeerole", employee.getEmployeerole());
        paramsMap.put("pageQueryCondition", pageQueryCondition);
        return mapper.queryByList(paramsMap);
    }

    public List<Employee> queryByEmployee(Employee employee) {
        return mapper.queryByEmployee(employee);
    }

    public Employee queryById(Integer id) {
        return mapper.queryById(id);
    }
}
