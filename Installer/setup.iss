; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "HTTP Request Generator"
#define MyAppVersion "0.15"
#define MyAppPublisher "Andrew Lambert"
#define MyAppURL "http://www.boredomsoft.org/http-request-generator.bs"
#define MyAppExeName "httpreq.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0C9B5327-83F6-4ADB-9F50-982615395E9A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Boredom Software\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=.\license.txt
InfoBeforeFile=.\Readme.txt
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: ..\Builds - HTTP Request Generator.rbvcp\Windows\httpreq\httpreq.exe; DestDir: {app}; Flags: ignoreversion
Source: ..\Builds - HTTP Request Generator.rbvcp\Windows\httpreq\httpreq Libs\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs
Source: zlib1.dll; DestDir: {app}; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}; Flags: nowait postinstall skipifsilent

[InstallDelete]
Name: {app}\bsgzip.dll; Type: files; Tasks: ; Languages: 
