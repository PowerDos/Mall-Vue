package com.example.baisc.mallgateway.base.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger.web.*;
 
import java.util.List;

/**
 * @description: swagger访问页面
 * @author: WuHao
 * @date: 2021/2/25 13:00
 */
@RestController
@RequestMapping("/swagger-resources")
public class SwaggerResourceController {
    private GwSwaggerResourceProvider swaggerResourceProvider;
 
    @Autowired
    public SwaggerResourceController(GwSwaggerResourceProvider swaggerResourceProvider) {
        this.swaggerResourceProvider = swaggerResourceProvider;
    }
 
    @RequestMapping(value = "/configuration/security")
    public ResponseEntity<SecurityConfiguration> securityConfiguration() {
        return new ResponseEntity<>(SecurityConfigurationBuilder.builder().build(), HttpStatus.OK);
    }
 
    @RequestMapping(value = "/configuration/ui")
    public ResponseEntity<UiConfiguration> uiConfiguration() {
        return new ResponseEntity<>(UiConfigurationBuilder.builder().build(), HttpStatus.OK);
    }
 
    @RequestMapping
    public ResponseEntity<List<SwaggerResource>> swaggerResources() {
        return new ResponseEntity<>(swaggerResourceProvider.get(), HttpStatus.OK);
    }
}