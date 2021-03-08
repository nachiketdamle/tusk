#!/bin/bash -f 

####### To get the parameters ########
Run_Test()
{

############# hard coded values ###########
runTestScript="world"
testFolder="hello"

Test="hello"

############################################

#echo $runTestScript
#echo $testFolder
#echo "$runTestScript"
#echo "$testFolder"

 if [ "$#" -eq  "0" ]
   then
     echo "No arguments supplied indeeeeed"
 else
     echo "Hello world"
 fi


echo "First arg: $1"
echo "Second arg: $2"



echo ${PWD}


runScript="$testFolder"/"$runTestScript";
echo "The path is "$runScript;


echo "$testFolder and $b created folders"


#compare the $Test and $testFolder
if [ "$Test" =  "$testFolder" ];
	then

	echo "Path $testFolder exists"

	#move to path $testFolder
	cd $testFolder
	
	echo  ${PWD}
	echo "changed directory to $testFolder"

	echo "Script executed from: ${PWD}"

#	& $runScript
	$runScript &
	
	if [$?];
		then
		echo "TestExecution  successfull"
		
		return $true
	else
		echo "The last path is this one "$runScript
		echo "TestExecution  Failed"
		return $false
	fi
			
else
	echo "Path $testFolder does not exits, unable to run UnitTest"

fi

}

Run_Test




