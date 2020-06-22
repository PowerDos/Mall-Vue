package com.example.filter.log;

import com.alibaba.fastjson.JSONObject;
import com.example.filter.util.MultiPartFormDateToJson;
import com.example.global.util.constants.Constants;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.stereotype.Component;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;

import static com.sun.org.apache.bcel.internal.classfile.Utility.printArray;

@Component
public class LogCollectorFilter extends ZuulFilter {

    private Logger zuulLogger = LoggerFactory.getLogger("zuul");

    LogCollectorFilter() {
        System.out.println("LogCollectorFilter");
    }

    public Object run() throws ZuulException {
        try {
            StringBuilder visitInfoLog = new StringBuilder();
            visitInfoLog.append("进入日志记录过滤器");

            RequestContext ctx = RequestContext.getCurrentContext();
            HttpServletRequest request = ctx.getRequest();
            InputStream in = request.getInputStream();
            String reqBody = StreamUtils.copyToString(in, StandardCharsets.UTF_8);

            // 打印request
            String method = request.getMethod();
            String interfaceMethod = request.getServletPath();
            visitInfoLog.append("请求方法接口+ ").append(interfaceMethod).append(" 方法 ").append(method).append("\n").append("请求头:").append("\n");

            Enumeration<String> headerNames = request.getHeaderNames();
            while (headerNames.hasMoreElements()) {
                String headerName = headerNames.nextElement();
                String headerValue = request.getHeader("headerName");
                visitInfoLog.append("  ").append(headerName).append("\t").append(headerValue).append("\n");
            }
            if ("GET".equals(method.toUpperCase())) {
                Map<String, String[]> map = request.getParameterMap();
                // 打印请求url参数
                if (map != null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("{");
                    for (Map.Entry<String, String[]> entry : map.entrySet()) {
                        String key = entry.getKey();
                        String value = printArray(entry.getValue());
                        sb.append(key).append("\t").append(value);
                    }
                    sb.append("}");
                    visitInfoLog.append("请求体:").append("\n").append(reqBody);
                }
            } else if ("POST".equals(method.toUpperCase())) {
                //打印请求json参数
                if (!StringUtils.isEmpty(reqBody)) {
                    String conType = request.getHeader("content-type");
                    //post请求目前获取userFlag，user参数只支持multipart/form-data，application/json，对于其他方式不记录用户信息
                    if (conType.contains("multipart/form-data") || conType.contains("application/json")) {
                        if (conType.contains("multipart/form-data")) {
                            reqBody = MultiPartFormDateToJson.formDateToJson(reqBody);
                        }
                        visitInfoLog.append("请求体:").append("\n").append(reqBody);
                    }
                }
            }
//            zuulLogger.info(visitInfoLog.toString());

            // 打印response
            InputStream out = ctx.getResponseDataStream();
            String outBody = StreamUtils.copyToString(out, Charset.forName("UTF-8"));
            boolean result = false;
            if (!StringUtils.isEmpty(outBody)) {
                visitInfoLog.append("响应参数:\n").append(outBody);
            }
            zuulLogger.info(visitInfoLog.toString());
            //必须重新写入流//重要！！！
            ctx.setResponseBody(outBody);
        } catch (IOException e) {
            zuulLogger.error("visitInfoLog IO异常", e);
        }

        return null;
    }

    // 判断过滤器是否生效
    public boolean shouldFilter() {

        return true;
    }

    // 过滤器的执行顺序。当请求在一个阶段的时候存在多个多个过滤器时，需要根据该方法的返回值依次执行
    public int filterOrder() {

        return 0;
    }

    // 过滤器类型 pre 表示在 请求之前进行拦截
    public String filterType() {

        return FilterConstants.POST_TYPE;
    }
}
