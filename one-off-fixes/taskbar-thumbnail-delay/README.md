# Adjust Taskbar Thumbnail Apperance Delay

This is a registry script which allows you to change the delay after which
Windows Explorer shows the thumbnail for the item you are hovering over on the
taskbar. The provided [install.reg](install.reg) script changes the delay to
100ms. You can modify the file to change the value.

**NOTE: The value in the `install.reg` script is to be given in hexadecimal.**

For example, for a delay of 100ms you will need to pass 64 while for a delay of
500ms you will need to pass 1F4.

This also has a [uninstall.reg](uninstall.reg) script that reverts your changes.
