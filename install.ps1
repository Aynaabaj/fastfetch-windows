# install.ps1 - Easy Install Script for Fastfetch Config
# Repository: https://github.com/Aynaabaj/fastfetch-windows

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "  Fastfetch Config Installer 🚀" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if Fastfetch is installed
Write-Host "[1/5] Checking for Fastfetch..." -ForegroundColor Yellow
try {
    $fastfetchVersion = fastfetch --version 2>$null
    if ($fastfetchVersion) {
        Write-Host "✅ Fastfetch is already installed!" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠️  Fastfetch not found. Installing..." -ForegroundColor Yellow
    try {
        winget install Fastfetch. Fastfetch --silent
        Write-Host "✅ Fastfetch installed successfully!" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to install Fastfetch.  Please install manually:" -ForegroundColor Red
        Write-Host "   winget install Fastfetch.Fastfetch" -ForegroundColor White
        exit 1
    }
}

# Create config directory
Write-Host "[2/5] Creating config directory..." -ForegroundColor Yellow
$configPath = "$env:USERPROFILE\. config\fastfetch"
if (!(Test-Path $configPath)) {
    New-Item -ItemType Directory -Path $configPath -Force | Out-Null
    Write-Host "✅ Created:  $configPath" -ForegroundColor Green
} else {
    Write-Host "✅ Directory already exists:  $configPath" -ForegroundColor Green
}

# Backup existing config if it exists
if (Test-Path "$configPath\config.jsonc") {
    Write-Host "[3/5] Backing up existing config..." -ForegroundColor Yellow
    $backupName = "config.jsonc.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item "$configPath\config.jsonc" "$configPath\$backupName"
    Write-Host "✅ Backup created: $backupName" -ForegroundColor Green
} else {
    Write-Host "[3/5] No existing config to backup" -ForegroundColor Yellow
}

# Download config. jsonc
Write-Host "[4/5] Downloading config.jsonc..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Aynaabaj/fastfetch-windows/main/config.jsonc" -OutFile "$configPath\config.jsonc"
    Write-Host "✅ Downloaded config.jsonc" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to download config.jsonc" -ForegroundColor Red
    Write-Host "   Error: $_" -ForegroundColor Red
    exit 1
}

# Download rocket.txt
Write-Host "[5/5] Downloading rocket.txt logo..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Aynaabaj/fastfetch-windows/main/rocket.txt" -OutFile "$configPath\rocket.txt"
    Write-Host "✅ Downloaded rocket.txt" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to download rocket.txt" -ForegroundColor Red
    Write-Host "   Error:  $_" -ForegroundColor Red
    exit 1
}

# Success message
Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "  ✅ Installation Complete! 🎉" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""
Write-Host "📂 Config installed to: $configPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 Run this command to test:" -ForegroundColor Yellow
Write-Host "   fastfetch" -ForegroundColor White
Write-Host ""
Write-Host "💡 To auto-run on PowerShell startup:" -ForegroundColor Yellow
Write-Host "   1. Run: notepad `$PROFILE" -ForegroundColor White
Write-Host "   2. Add this line:  fastfetch" -ForegroundColor White
Write-Host "   3. Save and restart PowerShell" -ForegroundColor White
Write-Host ""
Write-Host "⭐ If you like this config, star the repo!" -ForegroundColor Magenta
Write-Host "   https://github.com/Aynaabaj/fastfetch-windows" -ForegroundColor Cyan
Write-Host ""

# Optional: Offer to install Nerd Font
Write-Host "💬 Do you want to install JetBrainsMono Nerd Font?  (Recommended)" -ForegroundColor Yellow
Write-Host "   This enables proper icon display.  [Y/N]" -ForegroundColor Yellow
$response = Read-Host "   "
if ($response -eq 'Y' -or $response -eq 'y') {
    Write-Host "📥 Installing JetBrainsMono Nerd Font..." -ForegroundColor Cyan
    try {
        winget install JetBrains.JetBrainsMono.NerdFont --silent
        Write-Host "✅ Font installed!  Please set it in Windows Terminal settings." -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Font installation failed. Install manually if needed." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Thanks for using this config! 🚀✨" -ForegroundColor Cyan
Write-Host ""
