$path = get-location | select-string \\
set-location Response
clear-content 'Data.txt'
Add-content -Path 'Data.txt' $('Path : {0}'-f $path)
Add-content -Path 'Data.txt' $('Ip : {0}' -f $((get-WmiObject Win32_NetworkAdapterConfiguration| Where-Object {$_.Ipaddress.length -gt 1}).IPAddress | Select-object -index 0))
Add-content -Path 'Data.txt' $('MAC : {0}' -f $((Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object {$_.ipenabled -EQ $true}).Macaddress | select-object -first 1))
Set-Location ..