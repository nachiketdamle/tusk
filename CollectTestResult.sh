Get-Test-Result(){




Test_Path="hello"



echo "First arg: $1"

testrunpath=$1
echo "the value after storing : $testrunpath"

xpath="/"
echo "$xpath"

vmid= env $VMID
echo "$vmid"

if [ "$Test_Path" =  "$testrunpath" ];
	then
	{
		echo "file  $testrunpath exists"
		
		xml="$(echo "cat $testrunpath")"
		
		
		echo $host
	}||{
	
	echo "file $testrunpath doesnot exists"
	}
	fi

}
Get-Test-Result hello
