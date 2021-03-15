package com.example.goods.goodsbrowseapplication.base.webconfig;

import com.example.mallcommon.lazyload.listener.CglibInvokeListener;
import com.example.mallcommon.lazyload.container.MybatisTargetEnhancer;
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
    public CglibInvokeListener cglibInvokeListener() {
        return new CglibInvokeListener();
    }

    @Bean
    @Scope("prototype")
    public MybatisTargetEnhancer<?> targetEnhancerContainer() {
        return new MybatisTargetEnhancer<>();
    }
}
