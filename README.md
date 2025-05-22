[![NixOS 24.11+](https://img.shields.io/badge/NixOS-24.11%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-☕-fab387?labelColor=45475a)](https://typovrak.tv/coffee)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 🔐 NixOS LightDM

> NixOS module to configure LightDM-GTK greeter with a custom user icon, wallpaper, theme accents and JetBrains Mono Nerd Font.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🎨 **Custom greeter background :** Deploys ```lightdm.png``` as LightDM wallpaper.
- 👤 **User icon :** Installs ```typovrak.png``` into AccountsService for user avatar.
- ⚙️ **Greeter config :** Applies your ```lightdm-gtk-greeter.conf``` via NixOS’s ```etc.``` overlay.
- 🖋️ **Themed GTK :** Includes Catppuccin-GTK mocha green and Papirus icon theme.
- 🔤 **Nerd font :** Installs JetBrainsMono Nerd Font for consistent glyph support.
- 🔄 **Idempotent :** Safe to run on every rebuild, preserves existing credentials.
- 💾 **Backups :** No backup needed for this module.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix        # module configuration
├── LICENSE.md               # MIT license
├── lightdm-gtk-greeter.conf # GTK greeter configuration
├── lightdm.png              # login screen wallpaper
├── README.md                # this documentation
├── typovrak                 # default user data for login
└── typovrak.png             # avatar displayed in the login screen

1 directory, 7 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-lightdm = fetchGit {
    url = "https://github.com/typovrak/nixos-lightdm.git";
    ref = "main";
    rev = "6bcb0df8ac13c7ce259f9352034d0eab3aee5d6f"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-lightdm}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-lightdm = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-lightdm.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-lightdm}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-lightdm.git &&
cd nixos-lightdm &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Logout of your system to see your new Catppuccin Display Manager
```bash
sudo systemctl restart display-manager
```

## 📚 Learn more

- 📘 [LightDM Arch wiki](https://wiki.archlinux.org/title/LightDM) : Overview, greeters, configuration and troubleshooting.
- 🖥️ [AccountsService specification](https://www.freedesktop.org/wiki/Software/AccountsService/) : Manage user avatars and session metadata.
- 🧩 [GTK Greeter manual](https://github.com/Xubuntu/lightdm-gtk-greeter) : All options supported by the GTK-based LightDM greeter.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://typovrak.tv/coffee)

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
