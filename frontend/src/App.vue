<template>
  <div id="app">
    <!-- 页面标题 -->
    <header class="app-header">
      <h1>🌍 GIS全栈开发 - Leaflet地图组件</h1>
      <p class="subtitle">中国地质大学 GIS 实验课程</p>
    </header>

    <!-- 地图组件 -->
    <main class="map-wrapper">
      <LeafletMap />
    </main>

    <!-- 页脚信息 -->
    <footer class="app-footer">
      <p>Vue 3 + Vite + Leaflet | GIS全栈开发实验</p>
    </footer>
  </div>
</template>

<script setup>
// 导入 Leaflet 地图组件
import LeafletMap from './components/LeafletMap.vue'
</script>

<style scoped>
.app-header {
  text-align: center;
  padding: 2rem 1rem 1rem;
}

.app-header h1 {
  font-size: 1.8rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.subtitle {
  color: #7f8c8d;
  font-size: 1rem;
}

.map-wrapper {
  max-width: 960px;
  margin: 1.5rem auto;
  padding: 0 1rem;
}

.app-footer {
  text-align: center;
  padding: 2rem 1rem;
  color: #95a5a6;
  font-size: 0.85rem;
}
</style>
