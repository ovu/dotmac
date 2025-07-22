# dotmac
Dot files for mac

## Requirements
Install brew package manager:


```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install git:

```bash
brew install git
```

Install python3:

```bash
brew install python3
```

Install ansible:

```bash
brew install ansible
```

Enable ssh on mac:

1. In Finder, click the Apple logo, and then click System Preferences.

2. Click Sharing.

3. Select the check box next to Remote Login to enable it. Ensure the button beside Only these users is selected. ...

4. Click the + under the box. ...

5. You should now see Administrator listed in the box.

Run ansile playbook:
```bash
 ansible-playbook playbook.yml -K

```

Configure the Mac for better user experience:

1. Open Several Desktops (~7) on Your Machine
2. Go To Keyboard Settings > Shortcuts > Mission Control
3. Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with “Ctrl + # Of Space”
4. Go to System Settings > Accessibility > Display
5. Turn On Reduce Motion
6. Go To System Settings > Desktop & Dock > Mission Control
7. Turn off “Automatically Rearrange Spaces Based On Most Recent Use”
8. Keep “Displays Have Separate Spaces” turned on here

Configure key repeating for vim in VsCode/Cursor:

```bash
# For VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# For VSCode Insiders
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# For VSCodium
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false

# To enable global key-repeat
# this is helpful if you're using Vim in a PWA like code-server
defaults write -g ApplePressAndHoldEnabled -bool false

```

Configure Keyboard in Mac for better key repeating experience:

1. Open System Settings
2. Select Keyboard
3. Set Key repeat rate: Fast
4. Set Delay until repeat: Short
