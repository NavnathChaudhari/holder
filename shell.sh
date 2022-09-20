#! /bin/bash
cd /var/lib/jenkins/workspace/mine-project/
su jenkins
#docker logout   master.mine.com
sudo docker login -u admin --password-stdin admin@123 master.mine.com
 docker image build -t  $JOB_NAME:v1.$BUILD_ID .
 docker image tag $JOB_NAME:v1.$BUILD_ID master.mine.com/holder/$JOB_NAME:v1.$BUILD_ID
 docker image tag $JOB_NAME:v1.$BUILD_ID master.mine.com/holder/$JOB_NAME:latest
 docker image push master.mine.com/holder/$JOB_NAME:v1.$BUILD_ID
 docker  push master.mine.com/holder/$JOB_NAME:latest
 docker image rmi $JOB_NAME:v1.$BUILD_ID  master.mine.com/holder/$JOB_NAME:v1.$BUILD_ID   master.mine.com/holder/$JOB_NAME:latest 
