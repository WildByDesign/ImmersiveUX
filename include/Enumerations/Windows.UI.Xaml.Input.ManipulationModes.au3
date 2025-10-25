# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.UI.Xaml.Input.ManipulationModes
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"

Global $mManipulationModes[]
$mManipulationModes["None"] = 0x00000000
$mManipulationModes["TranslateX"] = 0x00000001
$mManipulationModes["TranslateY"] = 0x00000002
$mManipulationModes["TranslateRailsX"] = 0x00000004
$mManipulationModes["TranslateRailsY"] = 0x00000008
$mManipulationModes["Rotate"] = 0x00000010
$mManipulationModes["Scale"] = 0x00000020
$mManipulationModes["TranslateInertia"] = 0x00000040
$mManipulationModes["RotateInertia"] = 0x00000080
$mManipulationModes["ScaleInertia"] = 0x00000100
$mManipulationModes["All"] = 0x0000FFFF
$mManipulationModes["System"] = 0x00010000

__WinRT_AddReverseMappings($mManipulationModes)
