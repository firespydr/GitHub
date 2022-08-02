# Created by Chris Osborn
# Created 7/23/22

# Created to set the timezone for 

$currenttimezone = Get-TimeZone
$choice

# Time Zone Variables
$Eastern = "Eastern Standard Time"
$Central = "Central Standard Time"
$Mountain = "Mountain Standard Time"
$Pacific = "Pacific Standard Time"

Set-TimeZone -Id "Eastern Standard Time" -PassThru
Set-TimeZone -Id "Central Standard Time" -PassThru
Set-TimeZone -Id "Mountain Standard Time" -PassThru
Set-TimeZone -Id "Pacific Standard Time" -PassThru
