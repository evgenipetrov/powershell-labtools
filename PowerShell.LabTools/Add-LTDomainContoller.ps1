function Add-LTDomainContoller
{
  param(
    [string]$DomainName,
    [string]$DomainNetbiosName = $DomainName.Split('.')[0],
    [string]$SafeModeAdministratorPassword
  )
    
  if($env:COMPUTERNAME -eq $env:USERDOMAIN){
      #install binaries
      $feature = Get-WindowsFeature -Name AD-Domain-Services
      if(-Not $feature.Installed)
      {
        Add-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Restart
      }

      $secureString = ConvertTo-SecureString -String $SafeModeAdministratorPassword -AsPlainText -Force
        Import-Module -Name ADDSDeployment
        Install-ADDSForest `
        -CreateDnsDelegation:$false `
        -DatabasePath 'C:\Windows\NTDS' `
        -DomainMode 'Win2012R2' `
        -DomainName $DomainName `
        -DomainNetbiosName $DomainNetbiosName `
        -ForestMode 'Win2012R2' `
        -InstallDns:$true `
        -LogPath 'C:\Windows\NTDS' `
        -NoRebootOnCompletion:$true `
        -SysvolPath 'C:\Windows\SYSVOL' `
        -Force:$true `
        -SafeModeAdministratorPassword $secureString
        Restart-Computer
  }  
}
