package com.example.goods.util;

import java.util.ArrayList;
import java.util.List;

public class Util {
    public static <T> List<List<T>> groupList(List<T> list, int groupSize){
        int length = list.size();
        // 计算可以分成多少组
        int num = ( length + groupSize - 1 )/groupSize ; // TODO
        List<List<T>> newList = new ArrayList<>(num);
        for (int i = 0; i < num; i++) {
            // 开始位置
            int fromIndex = i * groupSize;
            // 结束位置
            int toIndex = Math.min((i + 1) * groupSize, length);
            newList.add(list.subList(fromIndex,toIndex)) ;
        }
        return  newList ;
    }
}
