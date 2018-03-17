# set user & groups
NET USER testAnsibleUser "!9?XSEeg" /ADD
NET LOCALGROUP "Administrators" "testAnsibleUser" /add
#
## set execution policy
#powershell.exe -executionpolicy unrestricted -command c:\vagrant\psscripts\Set-ExecutionPolicy.ps1

# set ansible environemnt
c:\vagrant\files\powershell\configure-remoting-ansible.ps1 -CertValidityDays 3600 -ForceNewSSLCert
