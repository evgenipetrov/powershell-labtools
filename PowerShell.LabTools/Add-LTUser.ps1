function Add-LBUser
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
  
  try
  {
    # Content
  }
  catch
  {
    "Error was $_"
    $line = $_.InvocationInfo.ScriptLineNumber
    "Error was in Line $line"
  }
  
  if ((Get-ADUser -Filter {
        UserPrincipalName -eq "$Upn"
  }) -ne $null)
  {
    $secPassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    New-ADUser -Name $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $Upn -AccountPassword $secPassword -PasswordNeverExpires -Enabled
  }
}
