package com.example.goods.goodsbrowseapplication.base.webconfig;

import com.example.mallcommon.lazyload.listener.CglibInvokeListener;
import com.example.mallcommon.lazyload.TargetEnhancerContainer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Scope;

/**
 * <p></p>
 *
 * @author WuHao
 * @since 2021/3/12 15:05
 */
@Configuration
public class LazyConvertConfig {

    @Bean
    @Scope("prototype")
    public CglibInvokeListener cglibInvokeListener() {
        return new CglibInvokeListener();
    }

    @Bean
    @Scope("prototype")
    public TargetEnhancerContainer<?> targetEnhancerContainer() {
        return new TargetEnhancerContainer<>();
    }
}
