function Set-LTRunOnceCommand{
    param(
        [string]$Command,
        [bool]$Enabled=$true
    )
    $registryKey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
    if($Enabled -eq $true){

        $keyExists = Test-Path $registryKey

        if(-Not $keyExists){
            New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\" -Name "RunOnce"
        }
        
        Set-ItemProperty -Path $registryKey -Name "NextRun" -Value $Command
    
    } else {
        Remove-Item -Path $registryKey
    }
}