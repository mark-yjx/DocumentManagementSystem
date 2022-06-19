package com.trade.mapper;

import com.trade.model.Doc;

import java.util.List;
import java.util.Map;

public interface DocMapper {

    Integer save(Doc model);

    Integer update(Doc model);

    List<Doc> queryByList(Map paramsMap);

    int queryByCount(Doc model);

    void deleteById(Integer id);

    List<Doc> queryByLog(Doc model);

}
