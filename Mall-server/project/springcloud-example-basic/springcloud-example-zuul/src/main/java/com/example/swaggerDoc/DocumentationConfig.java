package com.example.swaggerDoc;/**
 * @title: DocumentationConfig
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/611:30
 */

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/06
 */
@Component
@Primary
class DocumentationConfig implements SwaggerResourcesProvider {
    @Override
    public List<SwaggerResource> get() {
        List resources = new ArrayList<>();
        resources.add(swaggerResource("api-member", "/api-member/v2/api-docs", "1.0"));
        resources.add(swaggerResource("api-order", "/api-order/v2/api-docs", "1.0"));
        resources.add(swaggerResource("api-goods", "/api-goods/v2/api-docs", "1.0"));
        resources.add(swaggerResource("api-remarks", "/api-remarks/v2/api-docs", "1.0"));
        resources.add(swaggerResource("api-seckill", "/api-seckill/v2/api-docs", "1.0"));
        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }
}

