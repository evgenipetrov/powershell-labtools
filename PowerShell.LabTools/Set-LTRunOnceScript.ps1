function Set-LBRunOnceScript
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
    $LiteralPath
  )
  
  $command = 'powershell.exe -file {0}' -f $LiteralPath
  Set-LBRunOnceCommand -Command $command
}