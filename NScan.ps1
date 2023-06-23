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
class strg {
   [string]$ip
   [string]$port
   [int16]$protocol
   [bool]$loopmain

   [void]End_MaimLoop (){
       $this.loopmain ='false'
       write-host @('Couldnot find the inputed option : {0}' -f $this.protocol)
   }
}
$strg= [strg]::new()
$strg.ip = Read-Host 'IP addresss(es) '
$strg.port = Read-Host 'Ports(s)'

'Protocols :'
'           [1] TCP'
'           [2] UDP'
$strg.protocol = Read-host 'Protocol selection '
$strg.loopmain = $false
if ($protocol -eq '1'){
    $strg.loopmain =  $true
}
elseif ( $protocol -eq '2') {
    $strg.loopmain =  $true}
$strg.loopmain
while ($strg.loopmain -eq $true) {
    write-host 'running'
    $strg.loopmain = $false
}

Read-Host 'The program ended'
