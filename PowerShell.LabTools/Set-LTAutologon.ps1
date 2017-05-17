function Set-LTAutologon{
    param(
        [string]$Username,
        [string]$Password
    )

    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoAdminLogon -Value 1
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultUsername -Value $Username
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultPassword -Value $Password
}