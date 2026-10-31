@echo off
setlocal EnableDelayedExpansion
title Buffer and Watch

rem Paste a video page URL, mpv buffers the whole thing to a temp disk cache,
rem and the cache is deleted when mpv closes.

set /p "url=Paste video URL and press Enter: "
if "!url!"=="" exit /b

mpv --cache=yes --cache-on-disk=yes --demuxer-max-bytes=6GiB --demuxer-max-back-bytes=1GiB ^
    --demuxer-readahead-secs=36000 --pause ^
    --ytdl-format="bv*[height<=1080]+ba/b[height<=1080]" ^
    --ytdl-raw-options=cookies-from-browser=firefox ^
    "!url!"

if errorlevel 1 pause
