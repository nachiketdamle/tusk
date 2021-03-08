#!/bin/bash



Test_Path="Desktop"
##############################################
cloudProviderName="NULL"
return_path="NULL"

artifactFolder="Desktop/Automation"

source RunTest1.sh
source MultiCloudUtil.sh


if [ "$Test_Path" != "$artifactFolder" ];
LogWrite
	then
	echo "Path $artifactFolder doesnot exists"
	mkdir -p $artifactFolder
fi

while [ ! $VMID ]
	do
	echo "Waiting for VMID"
	sleep 1
	done
	
#Get-Daas-Url

Download-Aritfacts -url $daasurl -destinationFolder $daasdir
