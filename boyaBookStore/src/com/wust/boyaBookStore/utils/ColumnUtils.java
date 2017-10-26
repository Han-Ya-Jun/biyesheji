package com.wust.boyaBookStore.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
/**
 * @ClassName ColumnUtils
 * @Description TODO(工具类)
 * @author hanyajun
 * @Date 2017年3月28日 下午2:09:18
 * @version 1.0.0
 */
public class ColumnUtils {

    public static String generatorFk() {
        Random random = new Random();
        int key = random.nextInt(10000);
        if (key < 10000) {
            key += 1000;
        }
        String keylast = String.valueOf(key);
        String datastr = String.valueOf(new Date().getTime());
        return datastr + keylast;
    }

    public static String nowDateString() {
        SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String format = sdFormat.format(date);
        return format;
    }

}
