package com.example.global.util.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class Config {
    @Autowired
    private Environment environment;
    private static List<String> supportPlatforms;

    public List<String> getSupportPlatforms() {
        if (supportPlatforms == null) {
            String supportPlatformsStr = environment.getProperty("loginType.supportPlatforms");
            if (supportPlatformsStr == null) {
                supportPlatformsStr = "";
            }
            String[] supportPlatformsArr = supportPlatformsStr.split(",");
            supportPlatforms = Arrays.asList(supportPlatformsArr);
        }
        return supportPlatforms;

    }

}
