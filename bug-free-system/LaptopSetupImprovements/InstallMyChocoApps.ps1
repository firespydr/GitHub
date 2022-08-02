# Written By Chris Osborn
# Adopted on 5/26/22

# The goal was to easily install common apps with chocolatey. Seperate Script to install chocolatey with there command is already ran

#Install Main Apps
choco install chocolatey chocolatey-core.extension chocolatey-windowsupdate.extension DotNet4.5.2 dotnetcore3-desktop-runtime Everything GoogleChrome mRemoteNG putty vcredist140 wireshark vscode sharex -y

#Install Optional Apps
choco install discord Firefox spotify sublimetext4 virtualbox steam-client signal slack notepadplusplus powertoys zoom -y
