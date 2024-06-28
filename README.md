# PushPanel

## What is PushPanel?

PushPanel is an overview for multiple PowerShell scripts. This overview serves as an admin tool to unite many scripts in one place so that everyone can use the same scripts. The tool can easily be extended with additional .ps1 (PowerShell) files. This gives you a small and minimalistic overview, and anyone can easily add their code and create a button using the Config.json file.
How do I add a new button?

To add a new button, simply go to Config.json and insert the following block:

json
```
{
    "Name": "Test2",
    "Pfad": "Folder\\Folder2",
    "Datei": "Test2.ps1"
}
```

The name of the button, the file path and the file to be executed can be added here.
Important

The buttons are separated by a comma (see example):

json
```
{
    "Name": "Test",
    "Pfad": "",
    "Datei": "Test.ps1"
}, <--
{
    "Name": "Test2",
    "Pfad": "Folder\\Folder2",
    "Datei": "Test2.ps1"
}
```

Make sure that there is a comma after each block, except after the last block.

# Lizenz
This project belongs to the developer Melone155 and should not be passed off as his own, even if it is extended or further developed by someone else.
