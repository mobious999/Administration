<#
.SYNOPSIS
  This script is the first of 3 parts that build a standard domain conroller for windows
.DESCRIPTION
  Computer Name will be changed to dc01
.PARAMETER <Parameter_Name>
    Required filds
	ip address informatin
	Computer name
.INPUTS
    Not really required but tailor them to your environment
.OUTPUTS
   
.NOTES
  Version:        1.0
  Author:         Mark Quinn
  Creation Date:  7/29/2018
  Purpose/Change: Initial script development
  
.EXAMPLE
  Copy the file to the host and begin the configuraton
#>
Param(
  [Parameter(Mandatory=$False,Position=1)]
  [string]$csvfile,

  [Parameter(Mandatory=$False)]
  [string]$errorlog,

  [Parameter(Mandatory=$False)]
  [string]$logfile,

  [Parameter(Mandatory=$False)]
  [string]$logfolder
)

Import-Csv "d:\mq.csv" | ForEach-Object{
  If($_.Psobject.Properties.Value -contains ""){
     # There is a null here somewhere
     Throw "Null encountered. Stopping"
  } else {
    # process as normal
  }
}