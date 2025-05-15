@echo off
:: BatchGotAdmin
::-------------------------------------
::  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID /d IoTEnterpriseS /f
Goto End

:End
@exit

:: --> README.md
:: # W10-IoT-UP
:: Pour passer de Windows 10 22H2 à Windows 10 Enterprise IoT LTSC 2021 (21H2)
:: Télécharger Windows 10 Enterprise LTSC : 
:: Francais Canada --> https://drive.massgrave.dev/fr-ca_windows_10_enterprise_ltsc_2021_x64_dvd_2770e649.iso     
:: Anglais --> https://drive.massgrave.dev/en-us_windows_10_enterprise_ltsc_2021_x64_dvd_d289cf96.iso
:: Pendant le temps de téléchargement...
:: Ouvrir une fenetre Admin de Powershell et tapez la commande suivante: 
:: irm https://get.activated.win | iex
:: Appuyer sur "7" --> "4" --> "0"
:: Ouvrir le ISO dans Explorateur Windows
:: Exécuter le script Upgrade-LTSC.bat
:: Rapidement exécuter le fichier setup.exe dans le DVD de Windows 10 et suivre les étapes 
:: (Normalement l'option "Garder les fichiers et les applications" devrais etre là) 
:: et faire "Installer"
:: Réouvrir une fenetre Admin de Powershell et tapez la commande suivante: 
:: irm https://get.activated.win | iex
:: Appuyer sur "7" --> faire "1" --> "une touche" --> "1" --> "une touche" --> "0"
:: Redémarrez le PC 
:: ENJOY LES MISE À JOURS JUSQU'AU 13 JANVIER 2032