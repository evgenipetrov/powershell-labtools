function Join-LTDomainComputer
{
  <#
      .SYNOPSIS
      Short Description
      .DESCRIPTION
      Detailed Description
      .EXAMPLE
      Join-LTDomainComputer
      explains how to use the command
      can be multiple lines
      .EXAMPLE
      Join-LTDomainComputer
      another example
      can have as many examples as you like
  #>
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory=$true, Position=1)]
    [String]$DomainName,
 
    [Parameter(Mandatory=$true, Position=2)]
    [System.Management.Automation.PSCredential]
    $Credential
  )
 
  
  Add-Computer -DomainName $DomainName -Credential $Credential -Restart
}