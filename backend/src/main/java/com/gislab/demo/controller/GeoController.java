package com.gislab.demo.controller;

import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * 空间数据 REST API 控制器
 * 提供 GeoJSON 格式的空间数据查询接口
 */
@RestController
@RequestMapping("/api/geo")
@CrossOrigin(origins = "*")
public class GeoController {

    /**
     * 获取示例城市 GeoJSON 数据
     */
    @GetMapping("/cities")
    public Map<String, Object> getCities() {
        Map<String, Object> geojson = new HashMap<>();
        geojson.put("type", "FeatureCollection");

        List<Map<String, Object>> features = new ArrayList<>();

        // 添加示例城市数据
        features.add(createCityFeature("北京", 116.4074, 39.9042, 2189));
        features.add(createCityFeature("上海", 121.4737, 31.2304, 2487));
        features.add(createCityFeature("广州", 113.2644, 23.1291, 1868));
        features.add(createCityFeature("深圳", 114.0579, 22.5431, 1756));
        features.add(createCityFeature("成都", 104.0668, 30.5728, 2094));

        geojson.put("features", features);
        return geojson;
    }

    /**
     * 健康检查接口
     */
    @GetMapping("/health")
    public Map<String, String> health() {
        Map<String, String> status = new HashMap<>();
        status.put("status", "UP");
        status.put("service", "GIS Backend");
        status.put("version", "1.0.0");
        return status;
    }

    private Map<String, Object> createCityFeature(String name, double lng, double lat, int population) {
        Map<String, Object> feature = new HashMap<>();
        feature.put("type", "Feature");

        Map<String, Object> geometry = new HashMap<>();
        geometry.put("type", "Point");
        geometry.put("coordinates", new double[]{lng, lat});
        feature.put("geometry", geometry);

        Map<String, Object> properties = new HashMap<>();
        properties.put("name", name);
        properties.put("population", population);
        feature.put("properties", properties);

        return feature;
    }
}
