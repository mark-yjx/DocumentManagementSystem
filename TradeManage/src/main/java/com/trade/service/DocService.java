package com.trade.service;

import com.trade.mapper.DocMapper;
import com.trade.model.Doc;
import com.trade.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DocService {

    @Autowired
    private DocMapper mapper;

    public Integer save(Doc type) {
        return mapper.save(type);
    }

    public void update(Doc type) {
        mapper.update(type);
    }

    public void deleteById(Integer id) {
        mapper.deleteById(id);
    }

    public int queryByCount(Doc log) {
        return mapper.queryByCount(log);
    }

    public List<Doc> queryByList(Page page, Doc log) {
        String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("id", log.getId());
        paramsMap.put("name", log.getName());
        paramsMap.put("pageQueryCondition", pageQueryCondition);
        return mapper.queryByList(paramsMap);
    }

    public List<Doc> queryByLog(Doc log) {
        return mapper.queryByLog(log);
    }
}
