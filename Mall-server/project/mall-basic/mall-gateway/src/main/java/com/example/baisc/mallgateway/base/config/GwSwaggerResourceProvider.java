package com.example.baisc.mallgateway.base.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.*;

/**
 * @description: swagger右上角获取所有可选微服务specs配置类
 * @author  WuHao
 * @since  2021/2/25 13:00
 */
@Component
public class GwSwaggerResourceProvider implements SwaggerResourcesProvider {


    /**
     * swagger2默认的url后缀
     */
    private static final String SWAGGER2URL = "/v2/api-docs";

    @Autowired
    private Environment environment;

    @Override
    public List<SwaggerResource> get() {
        Set<String> servicesList = getAvailableServices();

        List<SwaggerResource> resources = new ArrayList<>();
        servicesList.forEach(service -> {
            SwaggerResource swaggerResource = new SwaggerResource();
            swaggerResource.setUrl("/" + service + SWAGGER2URL);
            swaggerResource.setName(service);
            resources.add(swaggerResource);
        });
        return resources;
    }

    /**
     * 从gateway的配置文件中读取swagger右上角规格的内容，
     * 要求gateway必须使用负载均衡方式配置
     *
     * @return Set<String> 所有被配置的服务名
     */
    private Set<String> getAvailableServices() {
        Set<String> availableServices = new HashSet<>();

        for (int i = 0; ; i++) {
            String propertyKey = "spring.cloud.gateway.routes[" + i + "].uri";
            String serviceUri = environment.getProperty(propertyKey);
            if (serviceUri == null) {
                break;
            }
            String serviceName = serviceUri.replace("lb://", "");
            availableServices.add(serviceName);
        }

        // 按服务名升序排序
        Set<String> sortedAvailableServices = new TreeSet<>(String::compareTo);
        sortedAvailableServices.addAll(availableServices);

        return sortedAvailableServices;
    }
}