cd custom_jenkins
#jetkins
docker build -t jenkins-dind .
docker run -d ^
  --name jenkins-dind ^
  --privileged ^
  -p 8080:8080 ^
  -p 50000:50000 ^
  -v /var/run/docker.sock:/var/run/docker.sock ^
  -v jenkins_home:/var/jenkins_home ^
  jenkins-dind
docker ps
docker logs jenkins-dind
docker exec jenkins-dind cat /var/jenkins_home/secrets/initialAdminPassword
#6. Install Python Inside Jenkins Container
docker exec -u root -it jenkins-dind bash
apt update -y
apt install -y python3
python3 --version
ln -s /usr/bin/python3 /usr/bin/python
python --version
apt install -y python3-pip
exit
#7. Restart Jenkins Container
docker restart jenkins-dind