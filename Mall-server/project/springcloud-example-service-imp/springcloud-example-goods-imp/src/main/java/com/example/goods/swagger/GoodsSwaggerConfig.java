package com.example.goods.swagger;/**
 * @title: SwaggerConfig
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2521:42
 */

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@Configuration
@EnableSwagger2
public class GoodsSwaggerConfig {

    /**
     * 通过 createRestApi函数来构建一个DocketBean
     * 函数名,可以随意命名,喜欢什么命名就什么命名
     */
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())//调用apiInfo方法,创建一个ApiInfo实例,里面是展示在文档页面信息内容
                .select()
                //控制暴露出去的路径下的实例
                //如果某个接口不想暴露,可以使用以下注解
                //@ApiIgnore 这样,该接口就不会暴露在 swagger2 的页面下
//                .apis(RequestHandlerSelectors.basePackage("com.example"))
                .paths(Predicates.not(PathSelectors.regex("/error.*")))// 错误路径不监控
                .paths(PathSelectors.any())
                .build();
    }

    //构建 api文档的详细信息函数
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                //页面标题
                .title("Spring Cloud Goods API")
                //条款地址
                .termsOfServiceUrl("https://github.com/seethefruture")
                .version("1.0")
                //描述
                .description("商品接口API,提供商品信息相关接口")
                .build();

    }
}
