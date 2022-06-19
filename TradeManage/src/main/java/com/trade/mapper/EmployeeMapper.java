package com.trade.mapper;

import com.trade.model.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeMapper {
    public Integer save(Employee model);

    public void update(Employee model);

    public void deleteById(Integer id);

    public int queryByCount(Employee model);

    public List<Employee> queryByList(Map paramsMap);

    public List<Employee> queryByEmployee(Employee model);

    public Employee queryById(Integer id);
}