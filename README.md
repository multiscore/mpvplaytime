# MPV playtime plugin for MuseScore
## Mark the current playtime of the matching score performance from MPV player in MuseScore

### Installation
1. (Only in Linux and macOS) Install `socat` if it is not already installed: `sudo apt install socat` in Debian based distros or `brew install socat` in macOS Homebrew
2. (Only in Linux and macOS) Install `mpv` media player: `sudo apt install mpv` in Debian based distros or `brew install --cask mpv` in macOS Homebrew.
3. (Only in Windows) Install latest PowerShell here: https://github.com/PowerShell/PowerShell#get-powershell
4. Download the latest repo release from [here](https://github.com/multiscore/mpvplaytime/archive/refs/heads/main.zip) and unzip it (you can also perform `git clone` if you have git installed)
5. Copy the `mpvplaytime` folder to your MuseScore plugins folder (see [here](https://musescore.org/en/handbook/plugins#installing-and-removing-plugins) for more info)
6. Restart MuseScore 3 (only MuseScore 3 is supported until MuseScore 4 is compatible with QProcess calls in plugins API)
7. Set a shortcut, as `Ctrl+Shift+M` (or `Cmd+Shift+M` in macOS) for the mpvplaytime plugin in `Plugins -> Manage Plugins` menu.
8. (Only in Linux and macOS) Run `unix-mpv-setup.sh` script to setup the `mpv` player (see the script for more info).

### Usage
1. Open a score in MuseScore 3
2. Open an audio performance in MPV player. For Windows users, use the already bundled `mpv.exe` in the `mpvplaytime/mpv-*-x86_64` folder. For Linux and macOS users, use the `mpv` command in the terminal or in the apps dashboard.
3. Follow along the score in MuseScore while listening the real performance and tag the time you want to mark with `Alt+D` (or `Cmd+D` in macOS)

### Notes
- For some reason, Linux is not able to create the text in the score using the `cursor` class. A workaround is being researched.
- The plugin is not able to detect if the performance is being played in MPV or not. So, if you press the shortcut while the performance is not being played, the plugin will still create an empty text in the score. A workaround is being researched.

### License
This plugin is licensed under the MIT license. See the LICENSE file for more info. The included `mpv` media player build for Windows is licensed under the GPLv2 license. See the `mpvplaytime/mpv-*-x86_64/doc/manual.pdf` file for more info.

### Author
- [Leopoldo Pla](lpla.github.io)

This code has been developed under the [Multiscore project](https://sites.google.com/view/multiscore-project/home), I+D+i PID2020-118447RA-I00, funded by MCIN/AEI/10.13039/501100011033. Some of the computing resources used in this project are provided by Valencian Government and FEDER through IDIFEDER/2020/003.
