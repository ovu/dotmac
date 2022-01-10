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

Update pip3:

```bash
/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
```

Try first without the version. The version was used to avoid an issue related to the Rust compiler.
```bash
pip3 install ansible==2.10.7
```

Enable ssh on mac:

1. In Finder, click the Apple logo, and then click System Preferences.

2. Click Sharing.

3. Select the check box next to Remote Login to enable it. Ensure the button beside Only these users is selected. ...

4. Click the + under the box. ...

5. You should now see Administrator listed in the box.
