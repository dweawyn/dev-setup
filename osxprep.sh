#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."
# Install all available updates
sudo softwareupdate -ia --verbose
# Install only recommended available updates
#sudo softwareupdate -irv

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
if      pkgutil --pkg-info com.apple.pkg.CLTools_Executables >/dev/null 2>&1
then    printf '%s\n' "CHECKING INSTALLATION"
        count=0
        pkgutil --files com.apple.pkg.CLTools_Executables |
        while IFS= read file
        do
        test -e  "/${file}"         &&
        printf '%s\n' "/${file}…OK" ||
        { printf '%s\n' "/${file}…MISSING"; ((count++)); }
        done
        if      (( count > 0 ))
        then    printf '%s\n' "Command Line Tools are not installed properly"
                # Provide instructions to remove and the CommandLineTools directory
                # and the package receipt then install instructions
        else    printf '%s\n' "Command Line Tools are installed"
        fi
else   printf '%s\n' "Command Line Tools are not installed"
      xcode-select --install
fi
