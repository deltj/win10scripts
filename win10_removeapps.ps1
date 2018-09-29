function SetRegKey {
	Param (
		[Parameter(Mandatory=$True)]
		[string]$path,
		
		[Parameter(Mandatory=$True)]
		[string]$name,
		
		[Parameter(Mandatory=$True)]
		[string]$value
	)
	
	Process {
		# See if the specified path exists
		IF(!(Test-Path $path)) {
			# Create it
			Write-Output "Creating $path"
			New-Item -Path $path -Force | Out-Null
		}
		
		# Create the key
		Write-Output "Setting $path\$name to $value"
		New-ItemProperty -Path $path -Name $name -Value $val -PropertyType DWORD -Force | Out-Null
	}	
}


# remove some bloatware apps
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *3dviewer* | Remove-AppxPackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *appconnector* | Remove-AppxPackage
Get-AppxPackage *appinstaller* | Remove-AppxPackage
Get-AppxPackage *communicationsapps* | Remove-AppxPackage
Get-AppxPackage *camera* | Remove-AppxPackage
Get-AppxPackage *feedback* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *king* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *onenote* | Remove-AppxPackage
Get-AppxPackage *oneconnect* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *messag* | Remove-AppxPackage
Get-AppxPackage *mspaint* | Remove-AppxPackage
Get-AppxPackage *phone* | Remove-AppxPackage
Get-AppxPackage *sway* | Remove-AppxPackage
Get-AppxPackage *people_* | Remove-AppxPackage
Get-AppxPackage *sticky* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *xboxgameoverlay* | Remove-AppxPackage
Get-AppxPackage *xboxspeechtotextoverlay* | Remove-AppxPackage
Get-AppxPackage *xboxidentity* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-AppxPackage *Minecraft* | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage *Sketchbook* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *Keeper* | Remove-AppxPackage

# remove more bloat apps
Get-AppxPackage *xboxgamingoverlay* | Remove-AppxPackage
Get-AppxPackage *BingWeather* | Remove-AppxPackage
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage *HiddenCityMysteryofShadows* | Remove-AppxPackage
Get-AppxPackage *DolbyAccess* | Remove-AppxPackage

# disable content delivery manager
SetRegKey "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" SilentInstalledAppsEnabled 0

# disable suggested apps on start menu
SetRegKey "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" SubscribedContent-338388Enabled 0





write-host "Press any key to continue..."
[void][System.Console]::ReadKey($true)
