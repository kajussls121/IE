Write-Output "Loading IE"

# Create a temporary VBScript file
$tmpVbs = [System.IO.Path]::Combine($env:TEMP, "IE.VBS")

# Add VBScript content to the temporary file
Add-Content -Path $tmpVbs -Value 'Set ie = CreateObject("InternetExplorer.Application")'
Add-Content -Path $tmpVbs -Value 'ie.Navigate "https://google.com"'
Add-Content -Path $tmpVbs -Value 'ie.Visible = 1'

# Run the VBScript file
cscript //nologo $tmpVbs

# Check the exit code
$yes = $LASTEXITCODE
Write-Output $yes
Write-Output "IE loaded."

if ($yes -ne 0) {
    Pause
}

# Delete the temporary VBScript file
Remove-Item -Path $tmpVbs -Force

exit
