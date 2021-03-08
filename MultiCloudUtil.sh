#!/bin/bash


#Start of Download-Artifacts() method

Download-Artifacts(){


Test_Path="Desktop"
##############################################
cloudProviderName="NULL"
return_path="NULL"

echo "First arg: $1"
echo "Second arg: $2"

url=$1
echo "the value of URL : $url"

destinationFolder=$2
echo "the value of DestinationFolder : $destinationFolder"

#### Calling the Function Get-CloudProvider #########
Get-CloudProvider
LogWrite
echo "$Stamp :CloudProvider :$cloudProviderName"


#checking the path, if not exists creating path
if [ "$Test_Path" == "$destinationFolder" ];
	then
	echo "$Stamp : Path $destinationFolder exists"
	
else
	echo "$Stamp :Path $destinationFolder does not exists, creating $destinationFolder"
	mkdir $destinationFolder
fi


##Checking the cloudproviders
if [ "$cloudProviderName" == "AWS" ];
	then
	
	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#aws s3 cp $url $destinationFolder --recursive (this needs to be uncommented during for working)
		env "$Stamp : The cloud ProviderID is:$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Download Object from $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Download Object $url from $cloudProviderName storage failed";
			return $false
		fi
	} || {
		######## missing how to check error data,this is pending
		echo "$Stamp :Download Object from $cloudProviderName storage $url Failed";
		return $false
	}
elif [ "$cloudProviderName" == "GCP" ];
	then
   	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#gsutil cp -r $url $destinationFolder 
		env "$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Download Object from $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Download Object $url from $cloudProviderName storage failed";
			return $false
		fi
	} || {
		
		echo "$Stamp :Download Object from $cloudProviderName storage $url Failed";
		return $false
	}

elif [ "$cloudProviderName" == "AZURE" ];
	then
   	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#az storage copy -s $url -d $destinationFolder --recursive 
		env "$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Download Object from $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Download Object $url from $cloudProviderName storage failed";
			return $false
		fi
	} || {
		
		echo "$Stamp :Download Object from $cloudProviderName storage $url Failed";
		return $false
	}
else {

		echo "$Stamp :We currently don't provide services for this cloudprovider $cloudProvider"
	}
	
fi
} #Download-Artifacts function ends here







#Start of Upload-Artifact() method
Upload-Artifact(){


echo "First arg: $1"
echo "Second arg: $2"

UplaodUrl=$1
echo "the value of UploadURL : $UplaodUrl"

Path=$2
echo "the value of Path : $Path"


#### Calling the Function Get-CloudProvider #########
Get-CloudProvider
LogWrite

echo "$Stamp :CloudProvider Name is:$cloudProviderName"


if [ "$cloudProviderName" == "AWS" ];
	then
	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#aws s3 cp  $Path $UplaodUrl --recursive 
		env "$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Upload Object To $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Upload Object $url to $cloudProviderName storage failed";
			return $false
		fi
	} || {
		
		echo "$Stamp :Upload Object to $cloudProviderName storage $url Failed ";
		return $false
	}
	
elif [ "$cloudProviderName" == "GCP" ];
	then
   	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#gsutil cp -r  $Path $UplaodUrl 
		env "$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Upload Object To $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Upload Object $url To $cloudProviderName storage failed";
			return $false
		fi
	} || {
		
		echo "$Stamp :Upload Object to $cloudProviderName storage $url Failed ";
		return $false
	}

elif [ "$cloudProviderName" == "AZURE" ];
	then
   	{
		echo "$Stamp :<================ found $cloudProviderName Cloud Provider================>"; 
		#az storage copy -s $url -d $destinationFolder --recursive (check how to upload and download artifacts for azure)
		env "$CLOUDPROVIDERID"
		
		if [ "$?" -eq "0" ];
			then
			echo "$Stamp :Upload Object to $cloudProviderName storage $url successfull";
			return $true
		else
			echo "$Stamp :Upload Object $url To $cloudProviderName storage failed";
			return $false
		fi
	} || {
		
		echo "$Stamp :Upload Object To $cloudProviderName storage $url Failed";
		return $false
	}
else {

		echo "$Stamp :We currently don't provide services for this cloudprovider $cloudProvider"
	}
	
fi
} #Upload-Artifact Function ends here







#Function for Getting CloudProvider
Get-CloudProvider(){
echo "inside the method Get-CloudProvider"
echo "$Stamp :The cloudProvider id is :$CLOUDPROVIDERID"

	case $CLOUDPROVIDERID in 
	"1" ) 
	cloudProviderName="AZURE";
	;;
	"2" ) 
	cloudProviderName="GCP";
	;;
	"3" ) 
	cloudProviderName="AWS";
	;;
	#default echo "Other"
	*)
	echo "other"
	;;
	esac
	return $cloudProviderName
}



Install-Tool(){

echo "First arg: $1"
echo "Second arg: $2"
echo "Third arg: $3"

toolName=$1
echo "the value of toolName : $toolName"

toolFolder=$2
echo "the value of toolFolder : $toolFolder"

installScript=$2
echo "the value of installScript : $installScript"

$scriptFolder=$toolFolder+"/"+$toolName
$runScript=$toolFolder+"/"+$toolName+"/"+$installScript


if [ "$Test_Path" =  "$scriptFolder" ];
	then

	echo "$Stamp :Path $testFolder exists"
	
	#move to path $testFolder
	cd $testFolder
	
	#& $runScript
	
	if test "$?" -eq "0";
		then
		echo "$Stamp :$toolName install successfull"
		return $true
	else
		echo "$Stamp :$toolName install Failed"
		return $false
	fi
else 
		echo "$Stamp :Path $scriptFolder does not exits, unable to install $toolName"
	
fi

} #End of Install-Tool function

#### Publish-Message Function is pending ######

####### Function Logwrite starts ########

LogWrite(){

#echo "First arg: $1"

#logstring=$1
#echo "the value of logString : $logstring"

Logfile="/home/nachiket/Desktop/devOps-Ubuntu-code/" #hardcoded path (use /var/log)
Stamp=`date "+%Y-%m-%d %H:%M:%S"`  
exec >> $Logfile/masterScript.log 2>&1


}
####### Function Logwrite Ends ########

####### Function Get-Artifact-Url starts ########

Get-Artifact-Url(){
LogWrite
echo "$Stamp :$CLOUDPROVIDERID"
echo "$Stamp :$VMID"



while [ ! $VMID ]
	do
	echo "$Stamp :Waiting for VMID"
	sleep 1
	done
	
case $CLOUDPROVIDERID in 
	"1" ) 
	return_path="daasconfigs/$VMID/artifacts";
	;;
	"2" ) 
	return_path="gs://tc_mdaas_bucket/DaaSconfigs/$VMID/";
	;;
	"3" ) 
	return_path="AWS";
	;;
	#default echo "Other"
	*)
	echo "Other"
	return_path="Other";
	;;
	esac
	return $return_path

}

####### Function Get-Artifact-Url Ends ########

####### Function Get-Daas-Url starts ########

Get-Daas-Url(){

LogWrite
echo "$Stamp : $CLOUDPROVIDERID"
echo "$Stamp: $VMID"

while [ ! $VMID ]
	do
	echo "$Stamp :Waiting for VMID"
	sleep 1
	done
	
case $CLOUDPROVIDERID in 
	"1" ) 
	return_path="https://sachinvd.blob.core.windows.net/daasconfigs/$VMID/json/daas.json";
	;;
	"2" ) 
	return_path="gs://tc_mdaas_bucket/DaaSconfigs/$VMID/json/daas.json";
	;;
	"3" ) 
	return_path="AWS";
	;;
	#default echo "Other"
	*)
	echo "Other"
	return_path="Other";
	;;
	esac
	return $return_path

}


#Get-Daas-Url www.google.com Desktop

