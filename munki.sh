#!/bin/bash

sudo defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL "https://servername/repo"

sudo defaults write /Library/Preferences/ManagedInstalls ClientIdentifier "ClientID"

sudo defaults write /Library/Preferences/ManagedInstalls InstallAppleSoftwareUpdates -bool TRUE

sudo defaults write com.apple.loginwindow EnableMCXLoginScripts -bool TRUE

sudo defaults write com.apple.loginwindow MCXScriptTrust -string Authenticated

sudo /bin/bash -c "$(curl -s https://servername/index.php?/install)"

sudo crontab <<EOF
00,30 * * * * /usr/local/munki/managedsoftwareupdate && /usr/local/munki/managedsoftwareupdate --installonly
EOF
