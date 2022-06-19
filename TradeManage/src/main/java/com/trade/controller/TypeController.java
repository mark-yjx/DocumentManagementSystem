package com.trade.controller;

import com.trade.annotation.ArchivesLog;
import com.trade.model.Employee;
import com.trade.model.Page;
import com.trade.model.Type;
import com.trade.service.RecordService;
import com.trade.service.TypeService;
import com.trade.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TypeController {

    @Autowired
    private TypeService typeService;
    @Autowired
    private RecordService recordService;

    @RequestMapping("queryTypeBypage.do")
    public String queryTypeBypage(Type log, Page page, ModelMap model) {
        page.setMaxRows(20);
        List<Type> list = typeService.queryByLog(log);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Type> logList = typeService.queryByList(page, log);
        model.put("page", page);
        model.put("logList", logList);
        model.put("log", log);
        return "/typeList";
    }

    @RequestMapping("queryLogBypage1.do")
    public String queryEmployeeBypage(Page page, ModelMap model) {
        Type log = new Type();
        page.setMaxRows(5);
        List<Type> list = typeService.queryByLog(log);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Type> logList = typeService.queryByList(page, log);
        model.put("page", page);
        model.put("logList", logList);
        model.put("log", log);
        return "/typeList";
    }

    @RequestMapping("addType.do")
    @ArchivesLog(operteContent = "添加分类")
    public String addType(Type type, HttpServletRequest request, HttpSession session) {
        typeService.save(type);
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "添加分类：" + type.getName());
        return "redirect:/queryTypeBypage.do";
    }

    @RequestMapping("updateType.do")
    @ArchivesLog(operteContent = "更新分类信息")
    public String updateCustom(Type type, HttpServletRequest request, HttpSession session) {
        typeService.update(type);
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "编辑分类：" + type.getName());
        return "redirect:/queryTypeBypage.do";
    }

    @RequestMapping("deleteLogByid.do")
    @ArchivesLog(operteContent = "删除分类")
    public String deleteLogByid(Type type, ModelMap model, HttpSession session) {
        Type type1 = typeService.queryById(type.getId());
        typeService.deleteById(type.getId());
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "删除分类：" + type1.getName());
        model.put("resultMessage", "删除成功");
        return "forward:/queryLogBypage1.do";
    }
}
