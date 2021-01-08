package com.example.global.util.cache;

import lombok.extern.slf4j.Slf4j;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description: ehcache一级缓存
 * @author: WuHao
 * @time: 2020/6/18 15:30
 */
@Service
@Slf4j
public class FirstCache implements ICache, BeanPostProcessor, InitializingBean {
    private final ExecutorService threadPool = new ThreadPoolExecutor(2, 30,
            30L, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(20), new ThreadPoolExecutor.DiscardPolicy());


    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private ApplicationContext context;

    private String cacheManagerName;

    @Override
    public void saveCache(String key, String value) {
        threadPool.execute(() -> saveCacheToEHCache(key, value, cacheManagerName));
    }

    @Override
    public String loadCache(String key) {
        return loadCacheFromEHCache(key, cacheManagerName);
    }


    public void saveCacheToEHCache(String key, String value, String cacheManagerName) {
        Cache cache = cacheManager.getCache(cacheManagerName);
        Element element = new Element(key, value);
        log.info("--------缓存至ehcache:{}", value);
        cache.put(element);
    }

    public String loadCacheFromEHCache(String key, String cacheManagerName) {
        String jsonValue = null;
        Cache cache = cacheManager.getCache(cacheManagerName);
        if (cache.get(key) != null) {
            jsonValue = cache.get(key).getObjectValue().toString();
        }
        if (jsonValue != null) {
            log.info("--------从ehcache读取缓存:{}", jsonValue);
            // 消除json字符串的转义
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(jsonValue);
            jsonValue = m.replaceAll("");
            if (jsonValue.startsWith("\"\"")) {
                jsonValue = jsonValue.substring(1, jsonValue.length() - 1);
            }
        }
        return jsonValue;
    }


    @Override
    public void afterPropertiesSet() throws Exception {
      ClassPathResource resource = new ClassPathResource("ehcache.xml");
//        Resource resource = context.getResource("ehcache.xml");
        try {
          InputStream inputStream = resource.getInputStream();
//          File ehcacheFile = new File("ehcache.xml");
//          FileOutputStream fileOutputStream = new FileOutputStream(ehcacheFile);
//          fileOutputStream.write(inputStream.read(new byte[1024],0,inputStream.available()));
            // 解析ehcache.xml文件流
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            try {
                Document d = factory.newDocumentBuilder().parse(inputStream);
                NodeList Nodes = d.getElementsByTagName("ehcache");
                for (int i = 0; i < Nodes.getLength(); i++) {
                    String nodeName = Nodes.item(i).getNodeName();
                    if (nodeName.equals("ehcache")) {
                        NodeList ehcacheNodes = Nodes.item(i).getChildNodes();
                        for (int index = 0; index < ehcacheNodes.getLength(); index++) {
                            Node val = ehcacheNodes.item(index);
                            String nodeName1 = val.getNodeName();
                            if (nodeName1.equals("cache")) {
                                NamedNodeMap attributes = val.getAttributes();
                                Node name = attributes.getNamedItem("name");
                                this.cacheManagerName = name.getNodeValue();
                                break;
                            }
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println("解析ehcache.xml文件异常\n" + e);
                e.printStackTrace();
            }
        } catch (IOException e) {
            System.out.println("找不到文件ehcache.xml\n" + e);
            e.printStackTrace();
        }
    }
}
