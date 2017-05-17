function Rename-LBComputer
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
    Rename-Computer -NewName $NewName -ErrorAction Stop
    Restart-Computer -Force
  }
  catch
  {
    "Error was $_"
    $line = $_.InvocationInfo.ScriptLineNumber
    "Error was in Line $line"
  }
}