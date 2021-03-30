package com.example.goods.goodsbrowseapplication.config;

import com.example.mallcommon.lazyload.targetenhancer.TargetEnhancer;
import com.example.mallcommon.lazyload.interceptor.CglibGetterInvokeInterceptor;
import com.example.mallcommon.lazyload.targetenhancer.MybatisTargetEnhancer;
import com.example.mallcommon.lazyload.interceptor.GetterInvokeInterceptor;
import com.example.mallcommon.loadcontroller.LoadDataSelector;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

/**
 * <p>使用它来注入延迟传递加载类</p>
 *
 * @author WuHao
 * @since 2021/3/12 15:05
 */
@Configuration
public class LazyConvertAutoConfiguration {

    @Bean
    @Scope("prototype")
    public GetterInvokeInterceptor cglibGetterInvokeInterceptor() {
        return new CglibGetterInvokeInterceptor();
    }

    @Bean
    @Scope("prototype")
    public TargetEnhancer targetEnhancerContainer() {
        return new MybatisTargetEnhancer();
    }

    @Bean
    public LoadDataSelector loadDataSelector() {
        return new LoadDataSelector();
    }
}
