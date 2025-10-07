# ImmersiveUX
Immersive UX is for Windows 11 (build 22621+) only and allows enabling DWM features on Win32 apps. It features a single portable binary for the processing engine and a single portable binary for the GUI. The GUI features an easy way to install the processing engine as a scheduled task. If the GUI is run as Admin, you can upgrade the task to run with highest privileges to allow Immersive UX to apply features to elevated apps as well. 

<img width="859" height="633" alt="image" src="https://github.com/user-attachments/assets/31573c81-c3a9-45f8-b284-560f58335c51" />


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

Additionally, there is special handling available for **File Explorer** (both modern and classic), **Visual Studio Code**, **VSCodium**, **Visual Studio 2022**, **Task Manager** and **Windows Terminal**. These can have all of the features applied as well but some of these specially handled apps require additional settings as noted in the docs (ImmersiveUX.txt).

## Screenshots:

<details>
  <summary>Windows Terminal with Blur Behind and no border</summary>
<img width="1049" height="711" alt="ux-terminal-blur" src="https://github.com/user-attachments/assets/8c1c8455-1a6f-4edc-bfeb-04ad9e76a069" />
</details>

<details>
  <summary>Visual Studio Code with Mica Alt (Tabbed)</summary>
<img width="1277" height="723" alt="image" src="https://github.com/user-attachments/assets/fe99b4f0-08f1-4d7a-87dc-1284f7842516" />
</details>

<details>
  <summary>Task Manager with Blur Behind</summary>
<img width="1148" height="733" alt="image" src="https://github.com/user-attachments/assets/49998798-0580-4b22-9c67-3c10e4d5f78c" />
</details>

<details>
  <summary>Visual Studio 2022 with Mica Alt (Tabbed) (1)</summary>
<img width="1252" height="842" alt="image" src="https://github.com/user-attachments/assets/1bb3ac8e-75fa-4253-abad-042ef2edae64" />
</details>

<details>
  <summary>File Explorer (modern) with Acrylic (2)</summary>
<img width="961" height="667" alt="image" src="https://github.com/user-attachments/assets/10b0d146-6a1f-4fcc-b84a-741f151ebff2" />
</details>

<details>
  <summary>File Explorer (classic) with Acrylic (2)</summary>
<img width="961" height="667" alt="image" src="https://github.com/user-attachments/assets/58e5819a-e320-4d26-a602-82a9522abc29" />
</details>

(1) Using Visual Studio color theme [Vanta Black](https://marketplace.visualstudio.com/items?itemName=BrijeshRathod.PitchBlackV1) for best results <br>
(2) Using Rectify11 Black Mica theme for best results

## How to Use:

Please see [ImmersiveUX ReadMe](https://github.com/WildByDesign/ImmersiveUX/blob/main/ImmersiveUX_ReadMe.md) for more details.

## Rule Processing Flowchart:

```
                               ┌────────────────┐                           
                               │                │                           
                               │  Global Rules  │                           
                               │                │                           
                               └─────┬────┬─────┘                           
                         ┌─────┐     │    │     ┌─────────┐                 
                         │ Set │◄────┘    └────►│ Not Set │                 
                         └──┬──┘                └────┬────┘                 
        ┌────────────────┐  │                        │    ┌────────────────┐
        │                │  │                        │    │                │
        │  Custom Rules  │◄─┘                        └───►│  Custom Rules  │
        │                │                                │                │
        └─────┬────┬─────┘                                └─────┬────┬─────┘
  ┌─────┐     │    │     ┌─────────┐                ┌─────┐     │    │     ┌─────────┐
  │ Set │◄────┘    └────►│ Not Set │                │ Set │◄────┘    └────►│ Not Set │
  └──┬──┘                └────┬────┘                └──┬──┘                └────┬────┘
     │                        │                        │                        │
     ▼                        ▼                        ▼                        ▼
┌────────┐                ┌────────┐              ┌────────┐               ┌─────────┐
│ Custom │                │ Global │              │ Custom │               │ Not Set │
└────────┘                └────────┘              └────────┘               └─────────┘
```

## False Positives:

False Positives seem to be a *"cat & mouse game"* with Microsoft Defender Antivirus, specifically when downloaded from Microsoft Edge. They seem to come and go with each release.

When I submit them to Microsoft, they always state that Defender is not flagging it. Their submission portal also shows proof that they are not detecting it. Indeed, you can scan the binaries (ImmersiveEngine.exe and ImmersiveUX.exe) with Defender individually in a custom scan or a full scan of the entire system and they never trigger a false positive.

Yet, if you download the release archives (ImmersiveUX-x64-*.zip) with Microsoft Edge, it will trigger the false positive.

From my understanding, the archive download triggers some sort of tagging by Edge which makes some sort of *"in-the-cloud-only machine-learning-baloney"* scan which is where the zip archive gets tagged.

Needless to say, the binaries do not do anything malicious and the source code is always available to review.

## Acknowledgements:

[Vibrancy Continued](https://github.com/illixion/vscode-vibrancy-continued) : Methods and code used to apply backdrop materials for Visual Studio Code.
