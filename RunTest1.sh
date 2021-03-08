#!/bin/bash

RunTest()
{
########## hard coded path,this will be get from masterScript ############
Test_Path="world"

echo "First arg: $1"
echo "Second arg: $2"



runTestScript=$1
echo "the value after storing : $runTestScript"

testFolder=$2
echo "the value after storing : $testFolder"


############### tried with command pwd for testing #################
command="pwd"
#runScript="$testFolder"/"$runTestScript";
echo "$command"
#echo "$runScript"


############### Comparing Test_Path with testFolder from masterScript ###################

if [ "$Test_Path" =  "$testFolder" ];
	then

	echo "Path $testFolder exists"

	#move to path $testFolder
	cd $testFolder
	
	echo "changed directory to $testFolder"

#	& $runScript
#	$runScript & (should execute this)

	echo "Printing the value of last executed command :$?"
	$command & #(this is for testing only)
	echo "Printing the value of last executed command :$?"
	
	
	if test "$?" -eq "0";
		#echo "Printing the value of last executed command inside if :$?"
		then
		echo "TestExecution successfull"
		
		return $true
	else
		echo "Printing the value of last executed command inside else :$?"
		
		echo "TestExecution Failed"
		return $false
	fi
			
else
	echo "Path $testFolder does not exits, unable to run UnitTest"

fi


}



############### Calling the method and passing hardcoded values here,this will be get from masterScript ###########
#RunTest hello world
