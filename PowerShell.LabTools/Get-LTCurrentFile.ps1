function Get-LTCurrentFile{
    $literalPath = $MyInvocation.PSCommandPath
    $file = Get-ChildItem -LiteralPath $literalPath
    Write-Output $file
}