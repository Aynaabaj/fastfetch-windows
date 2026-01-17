# My Fastfetch Config 🚀

Custom Fastfetch configuration for Windows with an awesome rocket ASCII art logo!

## Preview

![Fastfetch Screenshot](screenshot.png)

## Features

- 🚀 Custom rocket ASCII art logo
- 🎨 Color-coded system information
- 📊 Displays:  OS, CPU, GPU, RAM, Network, Battery, and more
- 🎯 Clean text labels (no icon dependency)
- ⚡ Optimized for Windows Terminal

## Installation

### Prerequisites

```powershell
# Install Fastfetch
winget install Fastfetch. Fastfetch

# Install JetBrainsMono Nerd Font (for icons)
winget install JetBrains.JetBrainsMono.NerdFont
```

### Setup

1. **Download the config files:**
   ```powershell
   # Create config directory
   mkdir ~\.config\fastfetch
   
   # Download config
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YOUR_USERNAME/fastfetch-config/main/config.jsonc" -OutFile ~\.config\fastfetch\config.jsonc
   
   # Download rocket logo
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YOUR_USERNAME/fastfetch-config/main/rocket.txt" -OutFile ~\.config\fastfetch\rocket.txt
   ```

2. **Test it:**
   ```powershell
   fastfetch
   ```

3. **Auto-run on PowerShell startup (optional):**
   ```powershell
   # Edit PowerShell profile
   notepad $PROFILE
   
   # Add this line: 
   fastfetch
   ```

## Customization

### Change Logo
Edit `rocket.txt` or create your own ASCII art logo! 

### Modify Modules
Edit `config.jsonc` and customize the modules you want to display.

### Color Schemes
Available colors:  `yellow`, `blue`, `green`, `cyan`, `magenta`, `red`, `white`

## System Info

- **OS:** Windows 11
- **Terminal:** Windows Terminal
- **Font:** JetBrainsMono Nerd Font

## Credits

- ASCII Rocket from [ASCII Art Archive](https://www.asciiart.eu/)
- Powered by [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

## License

Feel free to use and modify!  🎉

---

⭐ If you like this config, give it a star! 
