#!/usr/bin/bash

version="1.0.1"
appName="hotelapp"
userName="vinod2357"

function tagAndPush() {

    imageName=$1

    echo "====== building image for booking ${imageName} success ====== "
    echo ""
    echo "====== tagging and pushing it to repo ====="
    echo ""

    sudo docker tag "${appName}/${imageName}:${version}" "${userName}/${imageName}:${version}"

    sudo docker push "${userName}/${imageName}:${version}"

    if [ $? -eq 0 ]; then
        echo "====== pushed ${userName}/${imageName}:${version} ======="
    else
        echo "XXX failed to push ${userName}/${imageName}:${version} to repo XXX"
        exit 1
    fi

}


## booking service
echo "======================= BUILDING booking service ======================="

cd /home/ubuntu/LAB/upgrad-sweet-home-docker-deployment/bookingservice/

sudo docker build -t "${appName}/bookingservice:${version}" .

if [ $? -eq 0 ]; then
    tagAndPush "bookingservice"
else
    echo "XXXX failed to build image for bookingservice XXXX"
    exit 1
fi


## eureka service
echo "======================= BUILDING eureka service ======================="
cd /home/ubuntu/LAB/upgrad-sweet-home-docker-deployment/eurekaserver

sudo docker build -t "${appName}/eurekaserver:${version}" .

if [ $? -eq 0 ]; then
    tagAndPush "eurekaserver"
else
    echo "XXXX failed to build image for eurekaserver XXXX"
    exit 1
fi


## notification service
echo "======================= BUILDING notification service ======================="
cd /home/ubuntu/LAB/upgrad-sweet-home-docker-deployment/notificationservice

sudo docker build -t "${appName}/notificationservice:${version}" .

if [ $? -eq 0 ]; then
    tagAndPush "notificationservice"
else
    echo "XXXX failed to build image for notificationservice XXXX"
    exit 1
fi

## payment service
echo "======================= BUILDING payment service ======================="
cd /home/ubuntu/LAB/upgrad-sweet-home-docker-deployment/paymentservice

sudo docker build -t "${appName}/paymentservice:${version}" .

if [ $? -eq 0 ]; then
    tagAndPush "paymentservice"
else
    echo "XXXX failed to build image for paymentservice XXXX"
    exit 1
fi