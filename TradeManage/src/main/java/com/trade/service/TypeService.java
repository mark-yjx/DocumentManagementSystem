package com.trade.service;

import com.trade.mapper.TypeMapper;
import com.trade.model.Page;
import com.trade.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TypeService {

    @Autowired
    private TypeMapper mapper;

    public Integer save(Type type) {
        return mapper.save(type);
    }

    public void update(Type type) {
        mapper.update(type);
    }

    public void deleteById(Integer id) {
        mapper.deleteById(id);
    }

    public int queryByCount(Type log) {
        return mapper.queryByCount(log);
    }

    public List<Type> queryByList(Page page, Type log) {
        String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("id", log.getId());
        paramsMap.put("name", log.getName());
        paramsMap.put("pageQueryCondition", pageQueryCondition);
        return mapper.queryByList(paramsMap);
    }

    public List<Type> queryByLog(Type log) {
        return mapper.queryByLog(log);
    }

    public Type queryById(Integer id) {
        return mapper.queryById(id);
    }
}
