# powershell script

# set parameter
param([string]$interfaceip,
      [string]$gatewayip)

# echo gateway
echo "interface = $interfaceip"
echo "gateway   = $gatewayip"

# get interfaceindex
$NETINTERFACE = Get-NetIpAddress | where { $_.IPAddress -EQ $interfaceip }

# set gateway
New-NetRoute -interfaceindex $NETINTERFACE.ifIndex -NextHop $gatewayip -destinationprefix "0.0.0.0/0"
New-NetRoute -interfaceindex $NETINTERFACE.ifIndex -NextHop $gatewayip -destinationprefix "192.168.0.0/16"

# disable firewall for private net
netsh advfirewall set allprofiles state off
