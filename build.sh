printf "Start Build Nginx\n";
printf "=======================\n";
docker-compose stop nginx
sed -i '' '$ d' .env
printf "DOCKER_HOST_IP=" >> .env && ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' >> .env 
docker-compose build nginx
docker-compose up -d nginx
printf "=======================\n";
printf "End Build Nginx\n";