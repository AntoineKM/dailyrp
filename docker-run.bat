echo off
SET mypath=%~dp0

echo Removing old container...
docker ps -a | findstr FiveM && docker rm -f FiveM

echo Please enter your license key (https://keymaster.fivem.net/): 
set /p LICENSE_KEY=

echo Starting FiveM container...
docker run -d --name FiveM --restart=on-failure -e LICENSE_KEY=%LICENSE_KEY% -e NO_DEFAULT_CONFIG=true -p 30120:30120 -p 30120:30120/udp -p 40120:40120 -v %mypath:~0,-1%\config:/config -v %mypath:~0,-1%\txData:/txData -ti dailyrp/fivem