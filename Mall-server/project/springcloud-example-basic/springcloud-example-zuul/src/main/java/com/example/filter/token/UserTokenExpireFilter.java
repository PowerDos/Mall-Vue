package com.example.filter.token;/**
 * @title: UserTokenFilter
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/517:02
 */

import com.example.global.util.constants.Constants;
import com.example.global.util.tokenGenerate.TokenGenerate;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

@Component
public class UserTokenExpireFilter extends ZuulFilter {

    @Autowired
    private TokenGenerate tokenGenerate;

    // 对用户token进行延期
    public Object run() throws ZuulException {
        RequestContext context = RequestContext.getCurrentContext();
        HttpServletRequest request = context.getRequest();
        String userToken = request.getHeader("userToken");
        if (userToken != null) {
            String userId = tokenGenerate.getToken(userToken);
            if (userId != null) {
                tokenGenerate.expireToken(userToken, Constants.MEMBER_TOKEN_TIMEOUT);
            }
        }
//            context.setSendZuulResponse(false);
//            context.setResponseBody("userToken is null");
//            context.setResponseStatusCode(401);
        return null;
    }

    // 判断过滤器是否生效
    public boolean shouldFilter() {

        return true;
    }

    // 过滤器的执行顺序。当请求在一个阶段的时候存在多个多个过滤器时，需要根据该方法的返回值依次执行
    public int filterOrder() {

        return 5;
    }

    // 过滤器类型 pre 表示在 请求之前进行拦截
    public String filterType() {

        return  FilterConstants.PRE_TYPE;
    }

}
