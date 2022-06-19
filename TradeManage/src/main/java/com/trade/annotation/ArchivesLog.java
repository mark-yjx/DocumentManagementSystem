package com.trade.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface ArchivesLog {

    /**
     * 操作说明
     */
    String operteContent() default "";

}
