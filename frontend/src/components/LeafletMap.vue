<template>
  <!-- Leaflet 地图容器 -->
  <div id="map" ref="mapContainer"></div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

// 修复 Leaflet 默认图标路径问题
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'

delete L.Icon.Default.prototype._getIconUrl
L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})

// 地图容器引用
const mapContainer = ref(null)
// 地图实例
let map = null

// 北京坐标
const BEIJING_CENTER = [39.9042, 116.4074]
const DEFAULT_ZOOM = 12

onMounted(() => {
  // 初始化地图，以北京为中心
  map = L.map(mapContainer.value).setView(BEIJING_CENTER, DEFAULT_ZOOM)

  // 添加 OpenStreetMap 瓦片图层
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    maxZoom: 19,
  }).addTo(map)

  // 在北京位置添加标记和弹出窗口
  L.marker(BEIJING_CENTER)
    .addTo(map)
    .bindPopup('<b>北京</b><br>GIS全栈开发实验')
    .openPopup()
})

onUnmounted(() => {
  // 销毁地图实例，释放资源
  if (map) {
    map.remove()
    map = null
  }
})
</script>

<style scoped>
/* 地图容器样式 */
#map {
  width: 100%;
  height: 500px;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
  z-index: 0;
}
</style>
