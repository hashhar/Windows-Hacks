# Knowledge Base

- [Knowledge Base](#knowledge-base)
  - [Windows Start Menu Entries](#windows-start-menu-entries)
  - [Customize "Send To" Context Menu Entries](#customize-send-to-context-menu-entries)
  - [Customize Context Menu (Right Click Menu)](#customize-context-menu-right-click-menu)
    - [Adding an "Open PowerShell Here" Context Menu Entry](#adding-an-open-powershell-here-context-menu-entry)

## Windows Start Menu Entries

The Windows Start Menu entries live at two places which normally resolve to:

1. "C:\\Users\\User\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu"
2. "C:\\ProgramData\\Microsoft\\Windows\\Start Menu"

The first one is a user-specific location, meaning that the entries there only
affects the Start Menu of that particular user while the second one is a
system-wide Start Menu.

A more general way to refer to these locations is to use the PowerShell cmdlet
`GetFolderPath` which works even if you have moved your Windows profile to
another location (like on OneDrive or DropBox).

```PowerShell
[Environment]::GetFolderPath('StartMenu')
[Environment]::GetFolderPath('CommonStartMenu')
```

Or if you don't have access to PowerShell you can approxximate it in command
prompt using:

```bat
"%AppData%\Microsoft\Windows\Start Menu"
"%ProgramData%\Microsoft\Windows\Start Menu"
```

## Customize "Send To" Context Menu Entries

The "Send To" targets can be simple shortcuts to the destinations you want.
Their location can be found out by:

```PowerShell
[Environment]::GetFolderPath('SendTo')
```

```bat
%AppData%\Microsoft\Windows\SendTo
```

## Customize Context Menu (Right Click Menu)

The context menu entries live mostly in the following registry keys:

```ini
[HKEY_CLASSES_ROOT\AllFileSystemObjects\shell]
[HKEY_CLASSES_ROOT\AllFileSystemObjects\shellex]

[HKEY_CLASSES_ROOT\*\shell]
[HKEY_CLASSES_ROOT\*\shellex]

[HKEY_CLASSES_ROOT\DesktopBackground\Shell]
[HKEY_CLASSES_ROOT\DesktopBackground\shellex]

[HKEY_CLASSES_ROOT\Directory\Background\shell]
[HKEY_CLASSES_ROOT\Directory\Background\shellex]

[HKEY_CLASSES_ROOT\Directory\shell]
[HKEY_CLASSES_ROOT\Directory\shellex]
```

### Adding an "Open PowerShell Here" Context Menu Entry

You don't need such a context menu entry if you have Windows 8 or later becuase
you can simply hit the key combos `Alt + F + R` or `Alt + F + P` to open either
PowerShell or Command Prompt in the current directory.

But if you want, you can add a context menu entry to open PowerShell at the
current location by using the following registry script. Simply paste the
following into notepad and save it with the extension `.reg` and double click it
to install it. Be sure to take a backup of your registry using `regedit` before
proceeding to make sure you can undo the changes (or if you are experienced you
can modify the below script to uninstall).

```ini
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CLASSES_ROOT\*\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""

[HKEY_CLASSES_ROOT\Directory\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CLASSES_ROOT\Directory\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""

[HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""

[HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""

[HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\powershell]
@="Open PowerShell here"
"Icon"="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

[HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\powershell\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" \"%V\""
```
