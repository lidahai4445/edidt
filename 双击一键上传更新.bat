@echo off
chcp 65001 >nul
title 一键同步更新到 GitHub 与 Cloudflare Pages
echo ========================================================
echo   正在将本地修改同步上传至 GitHub (lidahai4445/edidt)...
echo ========================================================
echo.

cd /d "%~dp0"

git add -A
git commit -m "update: 本地修改更新 (%date% %time%)"
if %errorlevel% neq 0 (
    echo [提示] 当前没有检测到新的文件改动，或已完成提交。
)

echo.
echo 正在推送到远程仓库 (git push)...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo   [成功] 上传完成！
    echo   Cloudflare Pages 将在约 20~30 秒后自动完成网页更新！
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo   [失败] 推送遇到网络问题，请检查代理或网络后重试。
    echo ========================================================
)

echo.
pause
