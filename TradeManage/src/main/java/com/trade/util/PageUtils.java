package com.trade.util;

import org.springframework.util.DigestUtils;

public class PageUtils {
    public static int getPage(int pageNumber, int totalPage, int totalNumber, int maxRows) {
        totalNumber = totalNumber / maxRows + (totalNumber % maxRows == 0 ? 0 : 1);
        totalPage = totalNumber;
        if (pageNumber > totalPage) pageNumber = totalNumber;
        if (totalPage == 0) {
            return 0;
        } else {
            return (pageNumber - 1) * maxRows;
        }
    }

    public static int getTotalPage(int pageNumber, int totalPage, int totalNumber, int maxRows) {
        return totalNumber / maxRows + (totalNumber % maxRows == 0 ? 0 : 1);
    }

    public static void main(String[] args) {
        String s = DigestUtils.md5DigestAsHex("123456".getBytes());
        System.out.println(s);
    }
}
