package com.trade.controller;

import com.trade.annotation.ArchivesLog;
import com.trade.model.Doc;
import com.trade.model.Employee;
import com.trade.model.Page;
import com.trade.model.Type;
import com.trade.service.DocService;
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
public class DocController {

    @Autowired
    private DocService docService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private RecordService recordService;

    @RequestMapping("queryDocBypage.do")
    public String queryDocBypage(Doc doc, Page page, ModelMap model) {
        page.setMaxRows(20);
        List<Doc> list = docService.queryByLog(doc);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Doc> docList = docService.queryByList(page, doc);
        for (Doc obj : docList) {
            Type type = typeService.queryById(obj.getTid());
            obj.setType(type);
        }
        List<Type> typeList = typeService.queryByLog(new Type());
        model.put("typeList", typeList);
        model.put("page", page);
        model.put("docList", docList);
        model.put("log", doc);
        return "/docList";
    }

    @RequestMapping("queryDocBypage1.do")
    public String queryDocBypage1(Page page, ModelMap model) {
        Doc doc = new Doc();
        page.setMaxRows(5);
        List<Doc> list = docService.queryByLog(doc);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Doc> docList = docService.queryByList(page, doc);
        for (Doc obj : docList) {
            Type type = typeService.queryById(obj.getTid());
            obj.setType(type);
        }
        List<Type> typeList = typeService.queryByLog(new Type());
        model.put("typeList", typeList);
        model.put("page", page);
        model.put("docList", docList);
        model.put("log", doc);
        return "/docList";
    }

    @RequestMapping("addDoc.do")
    @ArchivesLog(operteContent = "????????????")
    public String addDoc(Doc doc, HttpSession session, HttpServletRequest request) {
        docService.save(doc);
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "???????????????" + doc.getName());
        return "redirect:/queryDocBypage.do";
    }

    @RequestMapping("updateDoc.do")
    @ArchivesLog(operteContent = "??????????????????")
    public String updateCustom(Doc doc, HttpServletRequest request, HttpSession session) {
        docService.update(doc);
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "???????????????" + doc.getName());
        return "redirect:/queryDocBypage.do";
    }

    @RequestMapping("deleteDocByid.do")
    @ArchivesLog(operteContent = "????????????")
    public String deleteDocByid(Doc doc, ModelMap model, HttpSession session) {
        List<Doc> docs = docService.queryByLog(doc);
        docService.deleteById(doc.getId());
        Employee emp = (Employee) session.getAttribute("emp");
        recordService.save(emp.getEmployeename(), "???????????????" + docs.get(0).getName());
        model.put("resultMessage", "????????????");
        return "forward:/queryDocBypage1.do";
    }
}
