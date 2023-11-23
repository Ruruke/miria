; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!


[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8E588CF9-9D7A-450D-974F-31D5F75363CA}
AppName=Miria
AppVersion=VersionNumber
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher=Sorairo
AppPublisherURL=https://shiosyakeyakini.info/miria_web
AppSupportURL=https://shiosyakeyakini.info/miria_web
AppUpdatesURL=https://shiosyakeyakini.info/miria_web
DefaultDirName=C:\Program Files\Miria
DisableProgramGroupPage=yes
LicenseFile=D:\a\miria\miria\LICENSE
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=D:\a\miria\miria
OutputBaseFilename=miria-installer
SetupIconFile=D:\a\miria\miria\windows\runner\resources\app_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\a\miria\miria\build\windows\x64\runner\Release\miria.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\a\miria\miria\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\Miria"; Filename: "{app}\miria.exe"
Name: "{autodesktop}\Miria"; Filename: "{app}\miria.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\miria.exe"; Description: "{cm:LaunchProgram,Miria}"; Flags: nowait postinstall skipifsilent
