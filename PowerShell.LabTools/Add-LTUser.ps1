function Add-LTUser
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
    $SamAccountName,
  
    [String]
    [Parameter(Mandatory)]
    $DisplayName,
    
    [String]
    [Parameter(Mandatory)]
    $Upn,
    
    [String]
    [Parameter(Mandatory)]
    $Password
  )
  
  if ((Get-ADUser -Filter {
        UserPrincipalName -eq "$Upn"
  }) -eq $null)
  {
    $secPassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    New-ADUser -Name $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $Upn -AccountPassword $secPassword -PasswordNeverExpires $true -Enabled $true
  }
}
