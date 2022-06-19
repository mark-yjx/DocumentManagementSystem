package com.trade.controller;

import com.trade.annotation.ArchivesLog;
import com.trade.model.Page;
import com.trade.model.Record;
import com.trade.model.Type;
import com.trade.service.RecordService;
import com.trade.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class RecordController {

    @Autowired
    private RecordService recordService;

    @RequestMapping("queryRecordBypage.do")
    public String queryRecordBypage(Type log, Page page, ModelMap model) {
        page.setMaxRows(20);
        List<Record> list = recordService.queryByLog(log);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Record> logList = recordService.queryByList(page, log);
        model.put("page", page);
        model.put("logList", logList);
        model.put("log", log);
        return "/recordList";
    }

    @RequestMapping("queryRecordBypage1.do")
    public String queryEmployeeBypage(Page page, ModelMap model) {
        Type log = new Type();
        page.setMaxRows(5);
        List<Record> list = recordService.queryByLog(log);
        page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        List<Record> logList = recordService.queryByList(page, log);
        model.put("page", page);
        model.put("logList", logList);
        model.put("log", log);
        return "/recordList";
    }

    @RequestMapping("deleteRecordByid.do")
    @ArchivesLog(operteContent = "删除操作记录")
    public String deleteRecordByid(Type log, ModelMap model) {
        recordService.deleteById(log.getId());
        model.put("resultMessage", "删除成功");
        return "forward:/queryRecordBypage1.do";
    }
}
