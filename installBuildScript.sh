#!/bin/sh

buildurl="https://sachinvd.blob.core.windows.net/builds-teamcity/rdm_yyyy/linux/rdm_linux_52.zip"
vmid="0"

#######changed .zip to just name 

buildname="rdm_widows_52"
containername=""
blobname=""
workdir="c:\buildsWorkDir"
destinationpath="C:\RedisDesktopManager1.0\""

accountname="daastool"
cloudmetadata="{'vmid': $vmid }"
queuename="installqueuestat"
successflag="Failed"
storageaccount="sachinvd"
username="<AZURE_USERNAME>"
password="<AZURE_PASSWORD>"




