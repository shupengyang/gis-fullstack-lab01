@echo off
chcp 65001 >nul
echo ============================================================
echo    GIS 全栈开发环境自检脚本
echo    检测 Node.js / Python / Java / Git / Docker 版本
echo ============================================================
echo.

echo [1/6] Node.js 版本:
where node >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    node -v
    echo     ✅ Node.js 已安装
) else (
    echo     ❌ Node.js 未安装
)
echo.

echo [2/6] pnpm 版本:
where pnpm >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    pnpm -v
    echo     ✅ pnpm 已安装
) else (
    echo     ❌ pnpm 未安装
)
echo.

echo [3/6] Python 版本:
where python >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    python --version
    echo     ✅ Python 已安装
) else (
    echo     ❌ Python 未安装
)
echo.

echo [4/6] Java 版本:
where java >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    java -version 2>&1
    echo     ✅ Java 已安装
) else (
    echo     ❌ Java 未安装或未配置 PATH
)
echo.

echo [5/6] Git 版本:
where git >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    git --version
    echo     ✅ Git 已安装
) else (
    echo     ❌ Git 未安装
)
echo.

echo [6/6] Docker 版本:
where docker >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    docker --version
    echo     ✅ Docker 已安装
) else (
    echo     ❌ Docker 未安装
)
echo.

echo ============================================================
echo    环境自检完成！
echo ============================================================
pause
