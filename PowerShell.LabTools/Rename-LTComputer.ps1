function Rename-LTComputer
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
    $NewName
  )
  
  try
  {
    Rename-Computer -NewName $NewName -Restart -ErrorAction Stop
    Start-Sleep 30
  }
  catch
  {
    "Error was $_"
    $line = $_.InvocationInfo.ScriptLineNumber
    "Error was in Line $line"
  }
}