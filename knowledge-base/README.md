# Knowledge Base

- [Knowledge Base](#knowledge-base)
  - [Windows Start Menu Entries](#windows-start-menu-entries)
  - [Customize "Send To" Context Menu Entries](#customize-send-to-context-menu-entries)
  - [Customize Context Menu (Right Click Menu)](#customize-context-menu-right-click-menu)

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
