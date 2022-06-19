package com.trade.util;

public class Result {
    final public static String OK = "0";
    /*
     * 1xxx - failed, client should try again
     */

    /*
     * 2xxx - failed, parameter error
     */
    final public static String PARAM_MISSED = "2001";
    final public static String PARAM_INVLD_JSON = "2002";
    final public static String PARAM_INVLD_OBJECT = "2003";

    /*
     * 3xxx - failed, system error
     */
    final public static String SYS_IO_ERROR = "3001";
    final public static String SYS_MISS_ALGORITHM = "3002";
    final public static String SYS_HBASE = "3003";
    final public static String SYS_OTHER = "3999";

    private String code;
    private String message;
    private Object data;

    public Result() {
        this.code = OK;
        this.message = "";
        this.data = null;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
