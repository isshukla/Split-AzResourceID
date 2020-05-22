<#
 .Synopsis
  Takes the ResourceID, and gives output with values mapped to the respective type. This can be directly used as input if required.

 .Description
  Takes the ResourceID, and gives output with values mapped to the respective type. This can be directly used as input if required.

 .Parameter ResourceID
  Complete ResourceID of a Resource

 .Example
 #Takes the ResourceID, and gives output with values mapped to the respective type.
  Split-AzResourceID -ResourceID /subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/resourceGroupname/providers/Microsoft.providername/ResourceType/ResourceName
  
#>


#------------------------------------------------------------------------------   
#     
# THIS MODULE AND ANY ASSOCIATED INFORMATION ARE PROVIDED 'AS IS' WITHOUT   
# WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT   
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS   
# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK OF USE, INABILITY TO USE, OR    
# RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.   
#   
#------------------------------------------------------------------------------  



$ResourceID = Read-Host 'Enter ResourceID'

#Regex to match correct ResourceID format
$regex = "^/[subscriptions]/*.*/[resourceGroups]/*.*/[providers]/*.*/*.*/*.*"

#ResourceID Check
if($ResourceID -inotmatch $regex){write-host "Enter the complete ResourceID" -ForegroundColor Red}
Else{


$rawdata = $ResourceID | ForEach-Object {$_ -split '/',''}

$data = New-Object PSObject -Property @{
                        
                        subscription  = $rawdata[2]
                        resourceGroup = $rawdata[4]
                        resourcename  = $rawdata[8]
                        Provider      = $rawdata[6]
                        Type          = $rawdata[7]
                                        }

#Output
$data

}

