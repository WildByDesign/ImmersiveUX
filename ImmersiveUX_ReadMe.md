# **Immersive UX**





## **Requirements:**



Due to the API Requirements (bottom of this ReadMe), Immersive UX requires Windows 11 Build 22621+.





## **How to Use:**



* Extract all files from the zip archive to a location that you want to run Immersive UX from.
* Run ImmersiveUX.exe (running as Admin will allow coloring of elevated apps).
* Click on the Immersive UI system tray icon anytime you need to bring up the GUI.
* Once you make a change to a rule, clicking the Save button will automatically apply the new changes.





## **Start with Windows:**



If you intend to continue using Immersive UX and want it to start every time Windows boots, there is an easy method to install it as a scheduled task.



* If Immersive UX is already running unelevated and you want to install the task unelevated, you can just go to the Startup Task menu in the status bar and select Install Task.


* If Immersive UX is already running unelevated but you want to install the task with highest privileges to allow coloring of elevated apps, just close Immersive UX by right-clicking on its system tray icon and selecting Exit. Now run ImmersiveUX.exe as Admin and the Startup Tasks menu will now have the option to Install Task (Admin).


* Immersive UX will now start every time Windows boots. The GUI will be hidden on startup but the processing engine will be running in the background. The GUI can always be accessed via the Immersive UX system tray icon.





## **Special Handling:**



Most Win32 apps accept the effects of these DWM settings quite well. However, certain apps such as Electron apps (eg. Visual Studio Code) and modern UWP/WinUI3 apps (eg. Windows Terminal) need some extra help to make all layers transparent. This is only really needed if you are intending to use DwmExtendFrameIntoClientArea or DwmEnableBlurBehindWindow with these specific apps.





**Windows Terminal:**



* Windows Terminal requires special handling to be applied which makes the background, tab row and tabs transparent.



* From the Immersive UX GUI, you can apply this special handling by selecting Patch Terminal in the Special Handling menu.



* These special handling changes happen immediately without the need to restart Windows Terminal.





**Visual Studio Code \& VSCodium:**



* Special handling is required to make the Electon layers transparent in order to be able to apply background materials and blur.



* From the Immersive UX GUI, you can apply this special handling by selecting Patch VSCode in the Special Handling menu. This will patch the Electron files required to allow transparency. This patching gets undone with each update of Visual Studio Code or VSCodium. Therefore you will need to patch it after each update.



* These special handling changes require closing and restarting VSCode/VSCodium if they were running at the time of patching.





**Visual Studio 2022:**



* It works with the default Dark theme that comes with Visual Studio. However, for best results install Vanta Black (https://marketplace.visualstudio.com/items?itemName=BrijeshRathod.PitchBlackV1) Visual Studio theme.





## **Global Exclusions:**



If you run into any problems with any specific apps, you can exclude them by process name or by class name. These settings are not exposed to the GUI at this time and therefore you would have to edit the configuration file (ImmersiveUX.ini) manually.





**Global exclusions by process name example:**



\[ProcessExclusion]

ExcludeFromAllProc=SearchHost.exe, StartMenuExperienceHost.exe





**Global exclusions by class name example:**



\[ClassExclusion]

ExcludeFromAllClass=Progman, Xaml\_WindowedPopupClass





## **API Requirements:**



* ChangeTitleBarBackdrop (DWMWA\_SYSTEMBACKDROP\_TYPE) requires Windows 11 Build 22621+
* DarkModeEnabled (DWMWA\_USE\_IMMERSIVE\_DARK\_MODE) requires Windows 11 Build 22000+
* ChangeTitleBarColor (DWMWA\_CAPTION\_COLOR) requires Windows 11 Build 22000+
* ChangeTitleBarTextColor (DWMWA\_TEXT\_COLOR) requires Windows 11 Build 22000+
* ChangeBorderColor (DWMWA\_BORDER\_COLOR) requires Windows 11 Build 22000+
* ChangeCornerPreference (DWMWA\_WINDOW\_CORNER\_PREFERENCE) requires Windows 11 Build 22000+
* EnableBlurBehind (DwmEnableBlurBehindWindow) works on Windows Vista+

  * EnableBlurBehind works best with a dark theme like *Rectify11 Black Mica*
  * or generally a GUI with dark background

* ExtendFrameIntoClientArea (DwmExtendFrameIntoClientArea) requires *Windows Vista+*

  * EnableBlurBehind works best with a dark theme like *Rectify11 Black Mica*
  * or generally a GUI with dark background


