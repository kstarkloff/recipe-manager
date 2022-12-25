@echo off

set "SLEEPTIME=5"

docker-compose down
timeout %SLEEPTIME%
docker-compose rm -f
timeout %SLEEPTIME%
docker-compose build
timeout %SLEEPTIME%
docker-compose up -d
timeout %SLEEPTIME%