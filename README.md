# SharePoint uploading script
By CODING101 Solution
With CLI for Microsoft 365

## Instruction

### Prerequisite
1. Make sure PowerShell is available on the host (x64 or x86 version, stick with ONLY ONE version for ALL of the following steps)
2. All local files are accessible with sufficient permission from this host
3. Microsoft 365 account credential with sufficient permission to write files to the SharePoint site
4. Stable Internet connection (Ethernet connection is preferred instead of Wi-Fi network)
5. Power policy of the host is set to prevent sleeping during the uploading process

### Update PowerShell Policy
1. Open the PowerShell terminal with local Administrator
2. Execute `Set-ExecutionPolicy Unrestricted -Scope CurrentUser` instead

### Install CLI for Microsoft 365
1. Install nvm-windows: https://github.com/coreybutler/nvm-windows/releases
2. Open the PowerShell terminal
3. Execute `nvm install lts`
4. Execute `nvm use lts`
5. Execute `npm install -g @pnp/cli-microsoft365`

### Execute Script
1. Open sharepoint-sync.ps1 with Notepad
2. Edit localPath (relative pathing or absolute pathing with drive letter), onlinePath and siteUrl
3. Save the file
4. Open the PowerShell terminal
5. Drag sharepoint-sync.ps1 into the PowerShell terminal, press Enter
6. Follow the instructions

### Revert PowerShell Policy (Optional)
1. After uploading all files to SharePoint site
2. Open the PowerShell terminal with local Administrator
3. Execute `Set-ExecutionPolicy Restricted`
