function Enable-LTRunEverythingAsAdministrator
{
  <#
    .SYNOPSIS
    Short Description
    .DESCRIPTION
    Detailed Description
    .EXAMPLE
    Enable-LTRunEverythingAsAdministrator
    explains how to use the command
    can be multiple lines
    .EXAMPLE
    Enable-LTRunEverythingAsAdministrator
    another example
    can have as many examples as you like
  #>
  # run everything as administrator
  Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"
}