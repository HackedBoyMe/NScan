Clear-Host
 ''
 '                            Welcome 2           NScan      !!!                         '
 ''
 '********** |\         |     --------        -------   |\           |\         | **********'
 '********** | \        |   /               /           | \          | \        | **********'
 '********** |  \       |   |              /            |  \         |  \       | **********'
 '********** |   \      |    \            |             |   \        |   \      | **********'
 '********** |    \     |     -------     |             |--- \       |    \     | **********'
 '********** |     \    |             \   |             |     \      |     \    | **********'
 '********** |      \   |             |   |             |      \     |      \   | **********'
 '********** |       \  |             /    \            |       \    |       \  | **********'
 '********** |        \ |            /      \           |        \   |        \ | **********'
 '********** |         \|    --------         -------   |         \  |         \| **********'
 ''
 ''
 ''

[string]$ip = Read-Host 'IP addresss(es) '
[string]$port = Read-Host 'Ports(s)'

'Protocols :'
'           [1] TCP'
'           [2] UDP'
[int32]$protocol = Read-host 'Protocol '
function ScanTCP
{
    param(
        [string[]]$ip
        [string[]]$port
    )
    $net = new-Object system.Net.Sockets.TcpClient
    $connection = $net.ConnectAsync($ip , $port)
    $opath = Get-Location
    for($i=0; $i -lt 10; $i++) {
      if ($connection.isCompleted) { break; }
      Start-Sleep -milliseconds 100 
    }
    $net.Close()
    if ($connection.isFaulted -and $connection.Exception -match "actively refused") {$response = "Closed"}
    elseif ($connection.Status -eq "RanToCompletion") {$response = "Open"}
    set-location $($opath.replace('Response','CodeBase') )
    $output = '{0}:{1} is {2} at {3}' -f $ip, $port , $response ,  $((Get-Date).AddDays(6))
    add-content -Path TCP.txt -Value $output 
    write-host $output
    set-locaton $opath
}
if ($null-ne $ip  -or  $null -ne $protocol -or $null -ne $port  ){
    switch ($protocol) {
        1 {ScanTCP($ip , $port)}
        2 {ScanUDP($ip , $port)}
        default{write-host @('Couldnot find the inputed option : {0}' -f $protocol)}
    }
}
function ScanUDP {

}
read-host
