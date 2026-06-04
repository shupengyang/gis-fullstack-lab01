# GIS 全栈开发实验项目

> 智慧城市学院 - 《GIS工程与开发》课程上机实验一

## 📋 项目简介

本项目是 GIS 全栈开发环境搭建与 AI 辅助编程的综合实验项目，包含前端地图展示、Python 空间数据处理、Java 后端服务三层架构。

## 🏗️ 项目结构

```
gis-fullstack-lab01/
├── frontend/                  # 🌐 前端层 - Vue3 + Vite + Leaflet
│   ├── src/
│   │   ├── components/
│   │   │   └── LeafletMap.vue # Leaflet 地图组件
│   │   ├── App.vue            # 主应用组件
│   │   └── main.js            # 入口文件
│   ├── package.json
│   └── vite.config.js
│
├── data-processing/           # 🐍 数据处理层 - Python + GeoPandas
│   ├── scripts/
│   │   └── spatial_analysis.py # 空间分析脚本
│   └── requirements.txt       # Python 依赖
│
├── backend/                   # ☕ 后端层 - Java Spring Boot
│   ├── src/main/java/com/gislab/demo/
│   │   ├── GisBackendApplication.java  # 启动类
│   │   └── controller/
│   │       └── GeoController.java      # GeoJSON API
│   ├── src/main/resources/
│   │   └── application.yml    # 配置文件
│   └── pom.xml                # Maven 配置
│
├── docker/                    # 🐳 容器化配置
│   └── docker-compose.yml     # PostGIS + pgAdmin
│
├── scripts/                   # 🔧 工具脚本
│   ├── env-check.bat          # 环境自检 (CMD)
│   └── env-check.ps1          # 环境自检 (PowerShell)
│
├── .gitignore                 # Git 忽略规则
└── README.md                  # 项目说明（本文件）
```

## 🔧 各层职责说明

### 前端层 (frontend/)
- **技术栈**：Vue 3 + Vite + Leaflet
- **职责**：地图可视化展示、用户交互界面、空间数据前端渲染
- **GIS 角色**：WebGIS 客户端，负责地图瓦片加载、矢量图层渲染、空间查询交互

### 数据处理层 (data-processing/)
- **技术栈**：Python 3 + GeoPandas + Shapely
- **职责**：空间数据 ETL（抽取-转换-加载）、地理编码、空间分析与统计
- **GIS 角色**：空间数据中间件，处理 Shapefile/GeoJSON 格式转换、坐标系转换、缓冲区分析等

### 后端层 (backend/)
- **技术栈**：Java 21 + Spring Boot + GeoTools
- **职责**：REST API 服务、空间数据持久化、业务逻辑处理
- **GIS 角色**：GIS 服务端，提供 OGC 标准接口、空间数据库操作、地图服务发布

## 🚀 快速开始

### 前端启动
```bash
cd frontend
pnpm install
pnpm run dev
```

### Python 环境
```bash
cd data-processing
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python scripts/spatial_analysis.py
```

### Java 后端
```bash
cd backend
mvn spring-boot:run
```

### Docker 服务
```bash
cd docker
docker compose up -d
# PostGIS: localhost:5432
# pgAdmin: localhost:5050 (admin@gislab.com / admin123)
```

## 🔍 环境自检
```bash
# Windows CMD
scripts\env-check.bat

# PowerShell
powershell -ExecutionPolicy Bypass -File scripts\env-check.ps1
```

## 📝 技术要求

| 工具 | 版本 | 用途 |
|------|------|------|
| Node.js | ≥ 22.x | 前端运行时，支持 ES Module |
| pnpm | ≥ 10.x | 前端包管理器，高效磁盘利用 |
| Python | ≥ 3.12 | 空间数据处理与分析 |
| JDK | 21 | 后端 Java 运行时 |
| Maven | ≥ 3.9 | Java 项目构建工具 |
| Git | ≥ 2.40 | 版本控制 |
| Docker | ≥ 24.x | 容器化部署 |

## 📄 License

MIT License - 仅用于教学实验目的
