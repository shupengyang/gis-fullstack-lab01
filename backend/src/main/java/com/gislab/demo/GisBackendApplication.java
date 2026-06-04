package com.gislab.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * GIS后端服务启动类
 * 提供空间数据API、地图瓦片代理等功能
 */
@SpringBootApplication
public class GisBackendApplication {
    public static void main(String[] args) {
        SpringApplication.run(GisBackendApplication.class, args);
    }
}
