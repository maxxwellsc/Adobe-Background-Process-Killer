# Adobe Background Process Killer
A lightweight batch script for Windows 10/11 designed to terminate Adobe background processes, disable persistent services, and stop scheduled tasks that cause CPU spikes and "bloatware" behavior.

## 🚀 Why use this?
Adobe Creative Cloud and Acrobat often run dozens of background processes (like `CCXProcess` or `AGSService`) even when the apps aren't open. This script:
- Reclaims CPU and RAM usage.
- Stops "Adobe Genuine Service" pop-ups.
- Prevents Adobe from auto-starting at boot.

## 🛠️ Usage
1. Download `AdobeCleanup.bat`.
2. **Right-click** the file and select **Run as Administrator** (required to modify system services).
3. The script will automatically stop processes and disable startup entries.

## 🔧 Troubleshooting
- **"Access Denied" Errors:** Ensure you are running the script as an Administrator.
- **Acrobat won't open:** Some older versions of Acrobat require `acrotray.exe` to function. If Acrobat fails to launch, restart your PC or manually run the Acrobat executable.
- **Processes reappear after an update:** Adobe updates often "reset" these services. Simply run the script again after any Adobe software update.
- **Creative Cloud App Desktop:** If you need to sync files to the cloud, you will need to manually launch the Creative Cloud desktop app, which will restart the necessary services temporarily.

## ⚠️ Disclaimer
This script is provided as-is. It modifies system services and scheduled tasks. While it does not delete any files, use it at your own risk.
