Param (
  [Parameter(Mandatory=$True,Position=0)]
  [string]$username
)

$logfolder = "c:\buildlog"
$logfile = "addusertogroup.log"
$errorlog = "error.log"

If(Test-Path $logfolder)
  	{
	    #write-host "path exists"
	}
else 
	{
		#Write-Host "path doesn't exist"
		#if the path doesn't exist create it
		New-Item -ItemType Directory -Path $logfolder
	}

Try {
    $user = "username"
    $Manager=(Get-AdUser (Get-aduser $User -properties manager).manager -properties samaccountname).samaccountname
    $group = Get-ADPrincipalGroupMembership -Identity $manager |  select Name | Where-Object {$_.name -like 'groupname*'} |  Select-Object -Expand Name
    Add-ADGroupMember -Identity $group -members $user
}

Catch {

	$ErrorMessage = $_.Exception.Message
	$FailedItem = $_.Exception.ItemName
	Add-Content $logfolder\$errorlog "The deployment failed the error message is" $ErrorMessage
	Add-Content $logfolder\$errorlog "The deployment failed the item that failed is" $FailedItem		
    Break
}

Finally {
 	Add-Content $logfolder\$logfile "The user has been added to the group succesfully" 
   	Add-Content $logfolder\$logfile "The user name is:" $user
   	Add-Content $logfolder\$logfile "The group the user was added to is:" $ise
}