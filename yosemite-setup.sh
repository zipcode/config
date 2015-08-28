#!/bin/bash
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Auto-hide dock
defaults write com.apple.dock autohide -bool true

# Remove default stuff from dock
seq $[$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | wc -l)-1] 0 | xargs -I {} /usr/libexec/PlistBuddy -c "Delete persistent-apps:{}" ~/Library/Preferences/com.apple.dock.plist
killall Dock

# Get developer tools
if [ ! -e /Library/Developer ]; then
  xcode-select --install
  sleep 4
  while pgrep "Install Command" >/dev/null; do echo -n .; sleep 5; done
  echo -ne \n
fi
if [ ! -e /Library/Developer ]; then
  echo "Something went wrong installing developer tools"
  exit 1
fi

# Get ye olde brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux git

brew install caskroom/cask/brew-cask


brew cask install iterm2 atom
brew cask install google-chrome
brew cask install dropbox 1password slack
brew cask install vagrant virtualbox virtualbox-extension-pack

# Turn off annoying swipe behaviour
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

git clone https://github.com/zipcode/config
[ -e ./config/setup.sh ] && ./config/setup.sh
