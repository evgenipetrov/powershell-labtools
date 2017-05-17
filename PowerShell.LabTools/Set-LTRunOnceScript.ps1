function Set-LTRunOnceScript
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
    $LiteralPath
  )
  
  $command = 'powershell.exe -file {0}' -f $LiteralPath
  Set-LTRunOnceCommand -Command $command
}