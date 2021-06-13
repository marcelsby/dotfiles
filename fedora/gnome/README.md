# Instructions

To dump your GNOME settings do:

`dconf dump / > configs.ini`

To load:

`dconf load -f / < configs.ini`

To reset:

`dconf reset -f /`

Reference:

[Backup And Restore Linux Desktop System Settings With Dconf](https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/)