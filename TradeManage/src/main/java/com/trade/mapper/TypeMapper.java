package com.trade.mapper;

import com.trade.model.Type;

import java.util.List;
import java.util.Map;

public interface TypeMapper {

    Integer save(Type model);

    Integer update(Type model);

    List<Type> queryByList(Map paramsMap);

    int queryByCount(Type model);

    void deleteById(Integer id);

    List<Type> queryByLog(Type model);

    Type queryById(Integer id);
}
