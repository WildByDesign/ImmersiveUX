# ImmersiveUX
Immersive UX is for Windows 11 (build 22621+) only and allows enabling DWM features on Win32 apps. It features a single portable binary for the processing engine and a single portable binary for the GUI. The GUI features an easy way to install the processing engine as a scheduled task. If the GUI is run as Admin, you can upgrade the task to run with highest privileges to allow Immersive UX to apply features to elevated apps as well. 

## Features:

- Dark titlebars
- Border colors
- Titlebar colors
- Titlebar text colors
- Corner preference
- Extend frame into client area
- Backdrop materials: Mica, Acrylic, Mica Alt (Tabbed)
- Blur Behind with optional color tint blend and intensity level


All features can be applied globally to all apps or on a per-app / per-class basis. So each app can have its own set of colors and options. The custom per-app / per-class rules take priority over the global rules. If you have a custom rule that has some options left blank (or selected Global), those options will fall back to global options if the relevant global option is set.

Additionally, there is special handling available for **File Explorer** (both modern and classic), **Visual Studio Code**, **VSCodium**, **Visual Studio 2022** and **Windows Terminal**. These can have all of the features applied as well but some of these specially handled apps require additional settings as noted in the docs (ImmersiveUX.txt).

## Screenshots:

* adding screenshots and more details later
