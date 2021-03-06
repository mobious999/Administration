#calculate csv sizes

## —-Load CSV and Variables—-
$getinfo = Import-Csv “d:\mq.csv”
$getinfo | % {
$hostname = $_.hostname
$Vmname = $_.vmname
$datastore = $_.datastore
$firstdisksize = $_.firstdisksize
$seconddisksize = $_.seconddisksize
$thirddisksize = $_.thirddisksize
$fourthdisksize = $_.fourthdisksize
$fifthdisksize = $_.fifthdisksize
$diskformat = $_.diskformat
$memory = $_.memory
$cpu = $_.cpu
$cores = $_.cores
$netname = $_.netname
$guestostype = $_.ostype
#$datastoreiso = $_.datastoreiso
}

#
get-datastore | select-object name, FreespaceGB, CapacityGB, @{Label=”Provisioned”;E={($_.CapacityGB – $_.FreespaceGB +($_.extensiondata.summary.uncommitted/1GB))}}|sort name

[int]$totaldisk = [int]$firstdisksize + [int]$seconddisksize + [int]$thirddisksize + [int]$fourthdisksize + [int]$fifthdisksize
#Write-Host $totaldisk
If ($totaldisk -ge 1) {	
	Write-Host "it's too big"
  }  Else {

  'This number is  not 1'

} 