param($network_pre, $server)
$network_pre=Read-Host "Please enter a network prefix"
$server=Read-Host "Please enter a DNS server"
for($i = 10; $i -lt 50; $i++){
    $network = $network_pre + "." + $i
    Write-Host($network)
    Write-Output(Resolve-DnsName -DnsOnly $network -Server $server -ErrorAction Ignore)
}
