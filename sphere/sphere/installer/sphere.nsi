; Generated NSIS script file (generated by makensitemplate.phtml 0.21)
; by 64.113.75.203 on Jan 21 03 @ 23:23

; NOTE: this .NSI script is designed for NSIS v1.8+
; URL: http://nsis.sourceforge.net/

;--------------------------------

Name "Sphere 1.6"
Caption "Sphere 1.6 Installation"
Icon          "install.ico"
UninstallIcon "uninstall.ico"
OutFile "InstallSphere1.6.exe"

!define SphereStartMenuDir "Sphere 1.6"

SetDateSave on
SetDatablockOptimize on
CRCCheck on
SilentInstall normal
BGGradient 000000 800000 FFFFFF
InstallColors 000000 FFFFFF
XPStyle on

InstallDir       "$PROGRAMFILES\Sphere"
InstallDirRegKey HKLM "SOFTWARE\Sphere" "Install_Dir"

CheckBitmap "checks.bmp"

RequestExecutionLevel admin


;--------------------------------

; Pages

PageEx license
    LicenseText "You must agree to this license before installing."
	LicenseData "docs\gpl.txt"
    LicenseForceSelection checkbox
PageExEnd

PageEx directory
	DirText "Select the directory in which Sphere should be installed:"
PageExEnd

Page instfiles

UninstPage uninstConfirm
UninstPage components
UninstPage instfiles


;--------------------------------

AutoCloseWindow   false
ShowInstDetails   show
ShowUninstDetails show


;--------------------------------

Section ""
		
    ; Set output path to the installation directory.
	SetOutPath "$INSTDIR"

	; add files which need to be installed here
	File /r *.dll
	File /r *.exe
	File /r *.ini
	File /r uninstall.ico
	File /r docs
	File /r startup
	File /r system
	File /r locale
	File /r games

    ; Write the installation path into the registry
    WriteRegStr HKLM SOFTWARE\Sphere "Install_Dir" "$INSTDIR"

	; set up start menu
	CreateDirectory "$SMPROGRAMS\${SphereStartMenuDir}"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Sphere.lnk"           "$INSTDIR\engine.exe"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Configuration.lnk"    "$INSTDIR\config.exe"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Editor.lnk"           "$INSTDIR\editor.exe"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Sphere Directory.lnk" "$INSTDIR"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Uninstall.lnk"        "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico"
	CreateDirectory "$SMPROGRAMS\${SphereStartMenuDir}\Documentation"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Documentation\Spheriki.lnk"             "http://www.spheredev.org/wiki/Main_Page"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Documentation\Spherical Community.lnk"  "http://www.spheredev.org/smforums/"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Documentation\AegisKnight's Site.lnk"   "http://aegisknight.org/sphere"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Documentation\Flik's Tutorial Site.lnk" "http://sphere.sourceforge.net/flik/docs"
	CreateShortCut  "$SMPROGRAMS\${SphereStartMenuDir}\Documentation\Local Documentation.lnk"  "$INSTDIR\docs"

	; register file types
	WriteRegStr HKCR ".rfn" "" "SphereFont"
	WriteRegStr HKCR ".rmp" "" "SphereMap"
	WriteRegStr HKCR ".rss" "" "SphereSpriteset"
	WriteRegStr HKCR ".rws" "" "SphereWindowStyle"
	WriteRegStr HKCR ".sgm" "" "SphereGame"
	WriteRegStr HKCR ".spk" "" "SpherePackage"

	WriteRegStr HKCR "SphereFont" "" "Sphere Font File"
	WriteRegStr HKCR "SphereFont\\DefaultIcon" "" "$INSTDIR\editor.exe,13"
	WriteRegStr HKCR "SphereFont\\shell" "" "open"
	WriteRegStr HKCR "SphereFont\\shell\\open\\command" "" '"$INSTDIR\editor.exe" "%1"'

	WriteRegStr HKCR "SphereMap" "" "Sphere Map File"
	WriteRegStr HKCR "SphereMap\\DefaultIcon" "" "$INSTDIR\editor.exe,3"
	WriteRegStr HKCR "SphereMap\\shell" "" "open"
	WriteRegStr HKCR "SphereMap\\shell\\open\\command" "" '"$INSTDIR\editor.exe" "%1"'

	WriteRegStr HKCR "SphereSpriteset" "" "Sphere Spriteset File"
	WriteRegStr HKCR "SphereSpriteset\\DefaultIcon" "" "$INSTDIR\editor.exe,5"
	WriteRegStr HKCR "SphereSpriteset\\shell" "" "open"
	WriteRegStr HKCR "SphereSpriteset\\shell\\open\\command" "" '"$INSTDIR\editor.exe" "%1"'

	WriteRegStr HKCR "SphereWindowStyle" "" "Sphere Window Style File"
	WriteRegStr HKCR "SphereWindowStyle\\DefaultIcon" "" "$INSTDIR\editor.exe,12"
	WriteRegStr HKCR "SphereWindowStyle\\shell" "" "open"
	WriteRegStr HKCR "SphereWindowStyle\\shell\\open\\command" "" '"$INSTDIR\editor.exe" "%1"'

	WriteRegStr HKCR "SphereGame" "" "Sphere Project File"
	WriteRegStr HKCR "SphereGame\\DefaultIcon" "" "$INSTDIR\editor.exe,1"
	WriteRegStr HKCR "SphereGame\\shell" "" "open"
	WriteRegStr HKCR "SphereGame\\shell\\open\\command" "" '"$INSTDIR\editor.exe" "%1"'

	WriteRegStr HKCR "SpherePackage" "" "Sphere Package File"
	WriteRegStr HKCR "SpherePackage\\DefaultIcon" "" "$INSTDIR\editor.exe,8"
	WriteRegStr HKCR "SpherePackage\\shell" "" "open"
	WriteRegStr HKCR "SpherePackage\\shell\\open\\command" "" '"$INSTDIR\engine.exe" -package "%1"'

    ; Write the uninstall keys for Windows
	WriteRegStr   HKLM "SOFTWARE\Sphere" "Install_Dir" "$INSTDIR"
	WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Sphere" "DisplayName"      "Sphere (remove only)"
	WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Sphere" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Sphere" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Sphere" "NoRepair" 1
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd


;--------------------------------

; begin uninstall settings/section
UninstallText "This will uninstall Sphere from your system"

Section "un.Uninstall Sphere"
	
	SectionIn RO
	
	; Remove registry keys
	DeleteRegKey HKLM "SOFTWARE\Sphere"
	DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sphere"

	DeleteRegKey HKCR ".rfn"
	DeleteRegKey HKCR ".rmp"
	DeleteRegKey HKCR ".rss"
	DeleteRegKey HKCR ".rws"
	DeleteRegKey HKCR ".sgm"
	DeleteRegKey HKCR ".spk"

	DeleteRegKey HKCR "SphereFont"
	DeleteRegKey HKCR "SphereMap"
	DeleteRegKey HKCR "SphereSpriteset"
	DeleteRegKey HKCR "SphereWindowStyle"
	DeleteRegKey HKCR "SphereGame"
	DeleteRegKey HKCR "SpherePackage"

	; Remove all files
	Delete "$INSTDIR\*.*"

	; Remove shortcuts, if any
	Delete "$SMPROGRAMS\${SphereStartMenuDir}\*.*"

	; Remove directories used
	RMDir /r "$INSTDIR\docs"
	RMDir /r "$INSTDIR\startup"
	RMDir /r "$INSTDIR\system"
	RMDir /r "$INSTDIR\locale"
	RMDir /r "$SMPROGRAMS\${SphereStartMenuDir}"

SectionEnd

Section "un.Uninstall Games"
	
	; Remove games
	RMDir /r "$INSTDIR\games"

	MessageBox MB_YESNO|MB_ICONQUESTION "Would you like to remove the directory $INSTDIR?" IDNO NoDelete
		RMDir "$INSTDIR"
	NoDelete:

SectionEnd

; eof
