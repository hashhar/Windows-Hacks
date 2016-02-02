# Windows Hacks For The Power User (and the lazy)

This repository contains registry scripts, batch files and some knowledge to help you make your Windows do awesome stuff (at least by my standards).

## NOTE for the people looking for stuff relating to wallpapers:

### Windows Spotlight Lockscreen Wallpapers:

#### PS1 Script:

1. Enable Windows Spotlight.
2. Download the repository and unzip it somewhere.
3. Open **`save-windows-spotlight-lockscreens`** folder.
4. There are two scripts. The `.ps1` script runs in PowerShell and copies the images into your `Pictures` folder and arranges them into a `Vertical` and a `Horizontal` folder.

#### Batch Script:

1. The `.bat` script is useful to schedule this task.
2. Open `Task Scheduler`.
3. Add a new Task.
4. Set a trigger. (Mine is set to 11:45 pm daily)
5. Set an action. The path of the program should be set to where you saved the script.
6. Add arguments. In the `Add Arguments` text box, enter the path of the folder where you would like to save the images.

### Bing Image of the Day:

1. Download the repository and unzip it somewhere.
2. Download and install the [Bing Desktop Toolbar.](https://www.microsoft.com/en-us/download/details.aspx?id=35844)
3. Open **`automate-bing-desktop-wallpaper`**.
4. Open the `.bat` file in Notepad and check if the path written in the file is the correct one and corresponds to where the Bing Desktop Toolbar is installed on your system.
5. Open `Task Scheduler`.
6. Add a new Task.
7. Set a trigger. (Mine is set to 11:45 pm daily)
8. Set an action. The path of the program should be set to where you saved the script.
9. Now open **`save-bing-wallpaper`**.
10. Open `Task Scheduler`.
11. Add a new Task.
12. Set a trigger. (Mine is set to 11:50 pm daily)
13. Set an action. The path of the program should be set to where you saved the script in the `save-bing-wallpaper` directory.
14. Add arguments. In the `Add Arguments` text box, enter the path of the folder where you would like to save the images.
