<#
.SYNOPSIS
    This script can be used to remove a local user
.DESCRIPTION
  
.PARAMETER <Parameter_Name>
    List all parameters here
    $name
    $errorlog
    $logfile
    $logfolder
.INPUTS
    List all inputs here
    $name (name of the user)
.OUTPUTS
    
.NOTES
  Version:        1.0
  Author:         Mark Quinn
  Creation Date:  9/30/2018
  Purpose/Change: Initial script development

.LINK
  Based on this article
  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/remove-localuser?view=powershell-5.1
  
.EXAMPLE
  .\remove local user.ps1 -name (enter name of local user) -errorlog (logfilename) -logfile (logfilename) -logfolder (path to the log files)
  Delete a user account
  Remove-LocalUser -Name "AdminContoso02"
#>

Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$name,
	
  [Parameter(Mandatory=$False)]
  [string]$errorlog,

  [Parameter(Mandatory=$False)]
  [string]$logfile,

  [Parameter(Mandatory=$False)]
  [string]$logfolder
)


Try {
  Remove-LocalUser -Name $name
 }
 
 Catch {
  if (!$logfolder -or $errorlog) {
    Write-Host "No logfile or log folder specified no logging will be created"
  } else {
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Add-Content $logfolder\$errorlog "The user has not been deleted and the error message is" $ErrorMessage
  } 
	Break
 }
 
 Finally {
  if (!$logfolder -or $logfolder) {
    Write-Host "No logfile or log folder specified no logging will be created"
  } else {
    Add-Content $logfolder\$logfile "The user has been deleted"
  } 
 }
