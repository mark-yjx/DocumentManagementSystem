package com.trade.mapper;

import com.trade.model.Record;
import com.trade.model.Type;

import java.util.List;
import java.util.Map;

public interface RecordMapper {

    Integer save(Record model);

    Integer update(Record model);

    List<Record> queryByList(Map paramsMap);

    int queryByCount(Record model);

    void deleteById(Integer id);

    List<Record> queryByLog(Type model);

    Record queryById(Integer id);
}
