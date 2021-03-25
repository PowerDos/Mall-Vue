package com.example.mallcommon.loadcontroller;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

/**
 * 数据加载方式选择器
 *
 * <p>数据加载方式选择器</p>
 *
 * @author WuHao
 * @since 2021/3/24 11:02
 */
public class LoadDataSelector {

    @Autowired
    private LoadDataTimeCache loadDataTimeCache;

    public <E> E loadData(AvailableChoices<E> availableChoices, SelectorPolicy policy) throws Exception {
        switch (policy) {
            case LOWEST_TIME_SPENT:
                String key1 = availableChoices.loadKey1();
                String key2 = availableChoices.loadKey2();
                Long loadDataTime1 = loadDataTimeCache.getLoadDataTime(key1);
                Long loadDataTime2 = loadDataTimeCache.getLoadDataTime(key2);

                if (loadDataTime1 == null) {
                    return doLoadData1(key1, availableChoices);
                }
                if (loadDataTime2 == null) {
                    return doLoadData2(key2, availableChoices);
                }
                double randomChoose = Math.random() * (loadDataTime1 + loadDataTime2);
                if (randomChoose < loadDataTime1) {
                    System.out.println("using load  " + key1 + " (" + key1 + ":" + loadDataTime1 + "," + key2 + ":" + loadDataTime2 + ")");
                    return doLoadData1(key1, availableChoices);
                } else {
                    System.out.println("using load  " + key2 + " (" + key1 + ":" + loadDataTime1 + "," + key2 + ":" + loadDataTime2 + ")");
                    return doLoadData2(key2, availableChoices);
                }
            default:
                throw new Exception("Illegal SelectorPolicy!");
        }
    }

    private <E> E doLoadData1(String key, AvailableChoices<E> availableChoices) throws Exception {
        long formerTime = System.currentTimeMillis();
        E e = availableChoices.load1();
        long nowTime = System.currentTimeMillis();
        long loadDataTime = nowTime - formerTime;
        loadDataTimeCache.setLoadDataTime(key, loadDataTime);
        return e;
    }

    private <E> E doLoadData2(String key, AvailableChoices<E> availableChoices) throws Exception {
        long formerTime = System.currentTimeMillis();
        E e = availableChoices.load2();
        long nowTime = System.currentTimeMillis();
        long loadDataTime = nowTime - formerTime;
        loadDataTimeCache.setLoadDataTime(key, loadDataTime);
        return e;
    }


}
