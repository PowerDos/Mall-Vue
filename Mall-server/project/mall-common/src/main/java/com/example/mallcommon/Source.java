package com.example.mallcommon;

import java.util.List;

public class Source {
    public Integer getA() {
        System.out.println("invoke source method getA");
        return a;
    }

    public void setA(Integer a) {
        this.a = a;
    }

    private Integer a;
    private Integer b;
    private List<String> list;

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    public Integer getB() {
        System.out.println("invoke source method getB");
        return b;
    }

    public void setB(Integer b) {
        this.b = b;
    }


}