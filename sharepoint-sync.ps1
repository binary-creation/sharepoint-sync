Write-host '[CODING101 Solution]'
Write-host 'SharePoint uploading script (v0.1.1)'
Write-host 'Please make sure edit this script with Notepad and change the URL and paths before executing this script.'
Write-host 'Upload local files to sharepoint site...'

function Upload-Item(
  [Parameter(Mandatory = $True)][string] $localPath,
  [Parameter(Mandatory = $True)][string] $onlinePath,
  [Parameter(Mandatory = $True)][string] $siteUrl) {
    $items = Get-ChildItem -Path $localPath
    foreach ($item in $items) {
        if ((Get-Item $item.FullName) -is [System.IO.DirectoryInfo]) {
          Write-host "Creating folder $item..."
          $folderCreated = m365 spo folder add --webUrl $siteUrl --parentFolderUrl $onlinePath --name $item.Name
          Upload-Item -localPath $item.FullName -onlinePath "$onlinePath/$item" -siteUrl $siteUrl
        }
        else {
          Write-host "Uploading file $item..."
          m365 spo file add --webUrl $siteUrl --folder $onlinePath --path $item.FullName
        }
    }
}

Write-host 'Checking Microsoft 365 login status...'
$m365Status = m365 status
if ($m365Status -match "Logged Out") {
    m365 login
}

$localPath = '.\local-path'
$onlinePath = '/online-path'
$siteUrl = 'https://demo-school.sharepoint.com/sites/SiteName'
Upload-Item -localPath $localPath -onlinePath $onlinePath -siteUrl $siteUrl

Write-host 'Script ended.'
Read-Host -Prompt "Press Enter to exit"