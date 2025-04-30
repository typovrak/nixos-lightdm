# 🔐 NixOS LightDM

> NixOS module to configure LightDM-GTK greeter with a custom user icon, wallpaper, theme accents and JetBrains Mono Nerd Font.

## 📦 Features

- 🎨 **Custom greeter background :** Deploys ```lightdm.png``` as LightDM wallpaper.

- 👤 **User icon :** Installs ```typovrak.png``` into AccountsService for user avatar.

- ⚙️ **Greeter config :** Applies your ```lightdm-gtk-greeter.conf``` via NixOS’s ```etc.``` overlay.

- 🖋️ **Themed GTK :** Includes Catppuccin-GTK mocha green and Papirus icon theme.

- 🔤 **Nerd font :** Installs JetBrainsMono Nerd Font for consistent glyph support.

- 🔄 **Idempotent :** Safe to run on every rebuild, preserves existing credentials.

- 💾 **Backups :** No backup needed for this module.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
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

## 🎬 Usage

Logout of your system to see your new Catppuccin Display Manager
```bash
sudo systemctl stop display-manager
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
