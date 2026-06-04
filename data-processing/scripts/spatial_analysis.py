"""
空间数据处理示例脚本
功能：读取 GeoJSON 数据，进行缓冲区分析，输出结果
"""
import geopandas as gpd
from shapely.geometry import Point
import matplotlib.pyplot as plt


def create_sample_geodata():
    """创建示例地理数据 - 中国主要城市"""
    cities = {
        "城市": ["北京", "上海", "广州", "深圳", "成都", "武汉"],
        "经度": [116.4074, 121.4737, 113.2644, 114.0579, 104.0668, 114.3055],
        "纬度": [39.9042, 31.2304, 23.1291, 22.5431, 30.5728, 30.5928],
        "人口(万)": [2189, 2487, 1868, 1756, 2094, 1121],
    }

    geometry = [Point(lon, lat) for lon, lat in zip(cities["经度"], cities["纬度"])]
    gdf = gpd.GeoDataFrame(cities, geometry=geometry, crs="EPSG:4326")
    return gdf


def buffer_analysis(gdf, distance_deg=1.0):
    """对城市点进行缓冲区分析"""
    gdf_buffer = gdf.copy()
    gdf_buffer["geometry"] = gdf_buffer.geometry.buffer(distance_deg)
    return gdf_buffer


def main():
    print("=" * 50)
    print("GIS 空间数据处理示例")
    print("=" * 50)

    # 1. 创建示例数据
    gdf = create_sample_geodata()
    print("\n📍 城市数据：")
    print(gdf[["城市", "经度", "纬度", "人口(万)"]])

    # 2. 基本空间统计
    print(f"\n📊 数据集 CRS: {gdf.crs}")
    print(f"📊 数据范围: {gdf.total_bounds}")
    print(f"📊 城市数量: {len(gdf)}")

    # 3. 缓冲区分析
    gdf_buffer = buffer_analysis(gdf, distance_deg=0.5)
    print(f"\n🔵 缓冲区分析完成，缓冲半径: 0.5°")

    # 4. 保存为 GeoJSON
    output_path = "output_cities.geojson"
    gdf.to_file(output_path, driver="GeoJSON")
    print(f"\n💾 数据已保存至: {output_path}")

    print("\n✅ 空间数据处理完成！")


if __name__ == "__main__":
    main()
