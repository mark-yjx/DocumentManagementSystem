package com.trade.service;

import com.trade.mapper.RecordMapper;
import com.trade.model.Page;
import com.trade.model.Record;
import com.trade.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecordService {

    @Autowired
    private RecordMapper mapper;

    public Integer save(String uname, String recordStr) {
        Record record = new Record();
        record.setName(uname);
        record.setRecord(recordStr);
        record.setCreatetime(new Date());
        return mapper.save(record);
    }

    public void update(Record type) {
        mapper.update(type);
    }

    public void deleteById(Integer id) {
        mapper.deleteById(id);
    }

    public int queryByCount(Record log) {
        return mapper.queryByCount(log);
    }

    public List<Record> queryByList(Page page, Type log) {
        String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("id", log.getId());
        paramsMap.put("name", log.getName());
        paramsMap.put("pageQueryCondition", pageQueryCondition);
        return mapper.queryByList(paramsMap);
    }

    public List<Record> queryByLog(Type log) {
        return mapper.queryByLog(log);
    }

    public Record queryById(Integer id) {
        return mapper.queryById(id);
    }
}
