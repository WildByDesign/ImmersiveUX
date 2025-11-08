#Tidy_Parameters = /sf

#include <APIErrorsConstants.au3>
#include <WinAPI.au3>

Global $__g_hDLLComBase, $__g_hDLLOle32, $__g_hDLLRoMetaData, $__g_hDLLWinTypes
Global $__g_aDelegates[1][4], $__g_hQueryInterface, $__g_hAddRef, $__g_hRelease
Global $__g_pMetaDataLocator, $__g_tMetaDataLocator, $__g_tMetaDataLocator_VTab
Global $__g_hIRoMetaDataLocator_Locate

Global Const $S_False = 1

Global Const $sGUID_NULL = "{00000000-0000-0000-0000-000000000000}"
Global Const $sCLSID_CorMetaDataDispenser = "{E5CB7A31-7512-11D2-89CE-0080C792E5D8}"

Global Const $sIID_IActivationFactory = "{00000035-0000-0000-C000-000000000046}"
Global Const $sIID_IAgileObject = "{94EA2B94-E9CC-49E0-C0FF-EE64CA8F5B90}"
Global Const $sIID_IInspectable = "{AF86E2E0-B12D-4C6A-9C5A-D7AA65101E90}"
Global Const $sIID_IMetaDataDispenser = "{809C652E-7396-11D2-9771-00A0C9B4D50C}"
Global Const $sIID_IMetaDataImport = "{7DAC8207-D3AE-4C75-9B67-92801A497D44}"
Global Const $sIID_IMetaDataImport2 = "{FCE5EFA0-8BBA-4F8E-A036-8F2022B08466}"
Global Const $sIID_ISupportErrorInfo = "{DF0B3D60-548F-101B-8E65-08002B2BD119}"
Global Const $sIID_IUnknown = "{00000000-0000-0000-C000-000000000046}"
Global Const $sIID_IWeakReferenceSource = "{00000038-0000-0000-C000-000000000046}"
Global Const $sIID_IAsyncAction = "{5A648006-843A-4DA9-865B-9D26E5DFAD7B}"
Global Const $sIID_IAsyncInfo = "{00000036-0000-0000-c000-000000000046}"
Global Const $sIID_IClosable = "{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}"
Global Const $sIID_IAudioInputNode = "{D148005C-8428-4784-B7FD-A99D468C5D20}"
Global Const $sIID_IAudioInputNode2 = "{905156B7-CA68-4C6D-A8BC-E3EE17FE3FD2}"
Global Const $sIID_IAudioNode = "{15389D7F-DBD8-4819-BF03-668E9357CD6D}"
Global Const $sIID_ICreateMediaSourceAudioInputNodeResult = "{46A658A3-53C0-4D59-9E51-CC1D1044A4C4}"
Global Const $sIID_ICreateMediaSourceAudioInputNodeResult2 = "{63514CE8-6A1A-49E3-97EC-28FD5BE114E5}"
Global Const $sIID_IMediaSourceAudioInputNode = "{99D8983B-A88A-4041-8E4F-DDBAC0C91FD3}"
Global Const $sIID_IMediaSource = "{E7BFB599-A09D-4C21-BCDF-20AF4F86B3D9}"
Global Const $sIID_IMediaSource2 = "{2EB61048-655F-4C37-B813-B4E45DFA0ABE}"
Global Const $sIID_IMediaSource3 = "{B59F0D9B-4B6E-41ED-BBB4-7C7509A994AD}"
Global Const $sIID_IMediaSource4 = "{BDAFAD57-8EFF-4C63-85A6-84DE0AE3E4F2}"
Global Const $sIID_IMediaSource5 = "{331A22AE-ED2E-4A22-94C8-B743A92B3022}"
Global Const $sIID_IMediaSourceAppServiceConnection = "{61E1EA97-1916-4810-B7F4-B642BE829596}"
Global Const $sIID_IMediaSourceAppServiceConnectionFactory = "{65B912EB-80B9-44F9-9C1E-E120F6D92838}"
Global Const $sIID_IMediaSourceError = "{5C0A8965-37C5-4E9D-8D21-1CDEE90CECC6}"
Global Const $sIID_IMediaSourceOpenOperationCompletedEventArgs = "{FC682CEB-E281-477C-A8E0-1ACD654114C8}"
Global Const $sIID_IMediaSourceStateChangedEventArgs = "{0A30AF82-9071-4BAC-BC39-CA2A93B717A9}"
Global Const $sIID_IMediaSourceStatics = "{F77D6FA4-4652-410E-B1D8-E9A5E245A45C}"
Global Const $sIID_IMediaSourceStatics2 = "{EEE161A4-7F13-4896-B8CB-DF0DE5BCB9F1}"
Global Const $sIID_IMediaSourceStatics3 = "{453A30D6-2BEA-4122-9F73-EACE04526E35}"
Global Const $sIID_IMediaSourceStatics4 = "{281B3BFC-E50A-4428-A500-9C4ED918D3F0}"
Global Const $sIID_IMiracastReceiverMediaSourceCreatedEventArgs = "{17CF519E-1246-531D-945A-6B158E39C3AA}"
Global Const $sIID_IBackgroundMediaPlayerStatics = "{856DDBC1-55F7-471F-A0F2-68AC4C904592}"
Global Const $sIID_IMediaPlaybackSession = "{C32B683D-0407-41BA-8946-8B345A5A5435}"
Global Const $sIID_IMediaPlaybackSession2 = "{F8BA7C79-1FC8-4097-AD70-C0FA18CC0050}"
Global Const $sIID_IMediaPlaybackSession3 = "{7BA2B41A-A3E2-405F-B77B-A4812C238B66}"
Global Const $sIID_IMediaPlaybackSource = "{EF9DC2BC-9317-4696-B051-2BAD643177B5}"
Global Const $sIID_IMediaPlayer = "{381A83CB-6FFF-499B-8D64-2885DFC1249E}"
Global Const $sIID_IMediaPlayer2 = "{3C841218-2123-4FC5-9082-2F883F77BDF5}"
Global Const $sIID_IMediaPlayer3 = "{EE0660DA-031B-4FEB-BD9B-92E0A0A8D299}"
Global Const $sIID_IMediaPlayer4 = "{80035DB0-7448-4770-AFCF-2A57450914C5}"
Global Const $sIID_IMediaPlayer5 = "{CFE537FD-F86A-4446-BF4D-C8E792B7B4B3}"
Global Const $sIID_IMediaPlayer6 = "{E0CAA086-AE65-414C-B010-8BC55F00E692}"
Global Const $sIID_IMediaPlayer7 = "{5D1DC478-4500-4531-B3F4-777A71491F7F}"
Global Const $sIID_IMediaPlayerDataReceivedEventArgs = "{C75A9405-C801-412A-835B-83FC0E622A8E}"
Global Const $sIID_IMediaPlayerEffects = "{85A1DEDA-CAB6-4CC0-8BE3-6035F4DE2591}"
Global Const $sIID_IMediaPlayerEffects2 = "{FA419A79-1BBE-46C5-AE1F-8EE69FB3C2C7}"
Global Const $sIID_IMediaPlayerFailedEventArgs = "{2744E9B9-A7E3-4F16-BAC4-7914EBC08301}"
Global Const $sIID_IMediaPlayerRateChangedEventArgs = "{40600D58-3B61-4BB2-989F-FC65608B6CAB}"
Global Const $sIID_IMediaPlayerSource = "{BD4F8897-1423-4C3E-82C5-0FB1AF94F715}"
Global Const $sIID_IMediaPlayerSource2 = "{82449B9F-7322-4C0B-B03B-3E69A48260C5}"
Global Const $sIID_IMediaPlayerSurface = "{0ED653BC-B736-49C3-830B-764A3845313A}"
Global Const $sIID_IAdaptiveMediaSource = "{4C7332EF-D39F-4396-B4D9-043957A7C964}"
Global Const $sIID_IAdaptiveMediaSource2 = "{17890342-6760-4BB9-A58A-F7AA98B08C0E}"
Global Const $sIID_IAdaptiveMediaSource3 = "{BA7023FD-C334-461B-A36E-C99F54F7174A}"
Global Const $sIID_IAdaptiveMediaSourceAdvancedSettings = "{55DB1680-1AEB-47DC-AA08-9A11610BA45A}"
Global Const $sIID_IAdaptiveMediaSourceCorrelatedTimes = "{05108787-E032-48E1-AB8D-002B0B3051DF}"
Global Const $sIID_IAdaptiveMediaSourceCreationResult = "{4686B6B2-800F-4E31-9093-76D4782013E7}"
Global Const $sIID_IAdaptiveMediaSourceCreationResult2 = "{1C3243BF-1C44-404B-A201-DF45AC7898E8}"
Global Const $sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = "{3AF64F06-6D9C-494A-B7A9-B3A5DEE6AD68}"
Global Const $sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = "{8C6DD857-16A5-4D9F-810E-00BD901B3EF9}"
Global Const $sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs3 = "{C3650CD5-DAEB-4103-84DA-68769AD513FF}"
Global Const $sIID_IAdaptiveMediaSourceDiagnostics = "{9B24EE68-962E-448C-AEBF-B29B56098E23}"
Global Const $sIID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = "{670C0A44-E04E-4EFF-816A-17399F78F4BA}"
Global Const $sIID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 = "{F3F1F444-96AE-4DE0-B540-2B3246E6968C}"
Global Const $sIID_IAdaptiveMediaSourceDownloadCompletedEventArgs = "{19240DC3-5B37-4A1A-8970-D621CB6CA83B}"
Global Const $sIID_IAdaptiveMediaSourceDownloadCompletedEventArgs2 = "{704744C4-964A-40E4-AF95-9177DD6DFA00}"
Global Const $sIID_IAdaptiveMediaSourceDownloadCompletedEventArgs3 = "{0F8A8BD1-93B2-47C6-BADC-8BE2C8F7F6E8}"
Global Const $sIID_IAdaptiveMediaSourceDownloadFailedEventArgs = "{37739048-F4AB-40A4-B135-C6DFD8BD7FF1}"
Global Const $sIID_IAdaptiveMediaSourceDownloadFailedEventArgs2 = "{70919568-967C-4986-90C5-C6FC4B31E2D8}"
Global Const $sIID_IAdaptiveMediaSourceDownloadFailedEventArgs3 = "{D0354549-1132-4A10-915A-C2211B5B9409}"
Global Const $sIID_IAdaptiveMediaSourceDownloadRequestedDeferral = "{05C68F64-FA20-4DBD-9821-4BF4C9BF77AB}"
Global Const $sIID_IAdaptiveMediaSourceDownloadRequestedEventArgs = "{C83FDFFD-44A9-47A2-BF96-03398B4BFAAF}"
Global Const $sIID_IAdaptiveMediaSourceDownloadRequestedEventArgs2 = "{B37D8BFE-AA44-4D82-825B-611DE3BCFECB}"
Global Const $sIID_IAdaptiveMediaSourceDownloadRequestedEventArgs3 = "{333C50FD-4F62-4481-AB44-1E47B0574225}"
Global Const $sIID_IAdaptiveMediaSourceDownloadResult = "{F4AFDC73-BCEE-4A6A-9F0A-FEC41E2339B0}"
Global Const $sIID_IAdaptiveMediaSourceDownloadResult2 = "{15552CB7-7B80-4AC4-8660-A4B97F7C70F0}"
Global Const $sIID_IAdaptiveMediaSourceDownloadStatistics = "{A306CEFB-E96A-4DFF-A9B8-1AE08C01AE98}"
Global Const $sIID_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = "{23A29F6D-7DDA-4A51-87A9-6FA8C5B292BE}"
Global Const $sIID_IAdaptiveMediaSourceStatics = "{50A6BD5D-66EF-4CD3-9579-9E660507DC3F}"
Global Const $sIID_IDesktopWindowXamlSourceNative = "{3CBCF1BF-2F76-4E9C-96AB-E84B37972554}"
Global Const $sIID_IDesktopWindowXamlSourceNative2 = "{e3dcd8c7-3057-4692-99c3-7b7720afda31}"
Global Const $sIID_IStorageFile = "{FA3F6186-4214-428C-A64C-14C9AC7315EA}"
Global Const $sIID_IStorageFile2 = "{954E4BCF-0A77-42FB-B777-C2ED58A52E44}"
Global Const $sIID_IStorageFilePropertiesWithAvailability = "{AFCBBE9B-582B-4133-9648-E44CA46EE491}"
Global Const $sIID_IStorageFileStatics = "{5984C710-DAF2-43C8-8BB4-A4D3EACFD03F}"
Global Const $sIID_IStorageFileStatics2 = "{5C76A781-212E-4AF9-8F04-740CAE108974}"
Global Const $sIID_IStorageItem = "{4207A996-CA2F-42F7-BDE8-8B10457A7F30}"
Global Const $sIID_IStorageItem2 = "{53F926D2-083C-4283-B45B-81C007237E44}"
Global Const $sIID_IStorageItemProperties = "{86664478-8029-46FE-A789-1C2F3E2FFB5C}"
Global Const $sIID_IStorageItemProperties2 = "{8E86A951-04B9-4BD2-929D-FEF3F71621D0}"
Global Const $sIID_IStorageItemPropertiesWithProvider = "{861BF39B-6368-4DEE-B40E-74684A5CE714}"
Global Const $sIID_IInputStreamReference = "{43929D18-5EC9-4B5A-919C-4205B0C804B6}"
Global Const $sIID_IRandomAccessStreamReference = "{33EE3134-1DD6-4E3A-8067-D1C162E8642B}"
Global Const $sIID_IAnimationObject = "{E7141E0A-04B8-4FC5-A4DC-195392E57807}"
Global Const $sIID_ICompositionSupportsSystemBackdrop = "{397DAFE4-B6C2-5BB9-951D-F5707DE8B7BC}"
Global Const $sIID_IVisualElement = "{01E64612-1D82-42F4-8E3F-A722DED33FC7}"
Global Const $sIID_IControl = "{A8912263-2951-4F58-A9C5-5A134EAA7F07}"
Global Const $sIID_IControl2 = "{43E0FE10-14EC-427E-8C57-DEE60DF60AA8}"
Global Const $sIID_IControl3 = "{077B29E4-DADE-4F55-9B96-09E21B28EB1C}"
Global Const $sIID_IControl4 = "{0E18AEEE-5F2E-44EA-8513-D3875C0A7513}"
Global Const $sIID_IControl5 = "{5EBB51D5-9E58-49B7-BC2D-0155FF118664}"
Global Const $sIID_IControl7 = "{3550DBE1-E561-5934-A3EF-7DB8BF6E3B45}"
Global Const $sIID_IControlFactory = "{B12B1D5A-6419-4E16-B212-A45336B75778}"
Global Const $sIID_IControlOverrides = "{A09691DF-9824-41FE-B530-B0D8990E64C1}"
Global Const $sIID_IControlOverrides6 = "{E194C96A-D8CC-4339-A0E1-2E9C420879EC}"
Global Const $sIID_IControlProtected = "{1791587A-2A7C-4981-A2D8-AB99FFFC65B9}"
Global Const $sIID_IControlStatics = "{473B305B-877D-4C35-8FCA-46A05F96607A}"
Global Const $sIID_IControlStatics2 = "{32233E36-AB74-4A25-A556-45293135B2C5}"
Global Const $sIID_IControlStatics3 = "{AAD15E61-E4B9-4D72-B653-934149AA5003}"
Global Const $sIID_IControlStatics4 = "{59FDA728-C05A-4EC2-8A4B-06AD69B66E15}"
Global Const $sIID_IControlStatics5 = "{F635B5A3-EF8E-404F-877B-5580473710A6}"
Global Const $sIID_IControlStatics7 = "{AEE1CA45-C910-5DAB-A266-FDF50C0BEDD2}"
Global Const $sIID_IMediaElement = "{A38ED2CF-13DE-4299-ADE2-AE18F74ED353}"
Global Const $sIID_IMediaElement2 = "{FD53DA65-B186-4654-BFDB-180ED26CAD07}"
Global Const $sIID_IMediaElement3 = "{479F6F13-0FDB-4ED8-928A-4D39169C3CD2}"
Global Const $sIID_IMediaElementStatics = "{DCCD2CB9-7568-4682-A72A-8DDF2A2665CA}"
Global Const $sIID_IMediaElementStatics2 = "{9EE7F826-F154-4DC6-8014-A6EBA987F847}"
Global Const $sIID_IMediaPlayerElement = "{3B4CA526-2E25-4598-BC71-D491F8E8DE39}"
Global Const $sIID_IMediaPlayerElementFactory = "{77E525C3-EB17-4B8D-889D-1EA8ABDBD4EF}"
Global Const $sIID_IMediaPlayerElementStatics = "{1E7C4020-AC57-42DD-AD1C-3EBC2D7F08BA}"
Global Const $sIID_IMediaPlayerPresenter = "{77A92326-0C5B-41FC-BF49-15F6C3524B6B}"
Global Const $sIID_IMediaPlayerPresenterFactory = "{E6766FB7-D96F-4B95-B33C-59E81CB1E9BA}"
Global Const $sIID_IMediaPlayerPresenterStatics = "{84D774FE-EAD4-4957-B42B-223158CA0DE7}"
Global Const $sIID_IMediaTransportControls = "{D6F69E7D-0825-49A9-9FCE-5586D8694F0C}"
Global Const $sIID_IMediaTransportControls2 = "{2B89EFEC-1BEA-451E-8BCD-CFE2D9423262}"
Global Const $sIID_IMediaTransportControls3 = "{5086430E-0940-11E7-93AE-92361F002671}"
Global Const $sIID_IMediaTransportControls4 = "{0FB17C58-9F23-11E7-ABC4-CEC278B6B50A}"
Global Const $sIID_IMediaTransportControlsFactory = "{1DA2015A-A8E4-4C1B-88C9-0B183ECC62E3}"
Global Const $sIID_IMediaTransportControlsHelper = "{3D41D509-FF44-4420-807E-8F7A2E2C4251}"
Global Const $sIID_IMediaTransportControlsHelperStatics = "{5A772047-A9A1-4625-9270-7F49875D4394}"
Global Const $sIID_IMediaTransportControlsStatics = "{590EA907-D2EF-4C1A-9429-B4B15D64FD56}"
Global Const $sIID_IMediaTransportControlsStatics2 = "{1728CFDC-561F-4386-A7F8-090D95F68D96}"
Global Const $sIID_IMediaTransportControlsStatics3 = "{5FE05542-0940-11E7-93AE-92361F002671}"
Global Const $sIID_IMediaTransportControlsStatics4 = "{0FB18144-9F23-11E7-ABC4-CEC278B6B50A}"
Global Const $sIID_IDesktopWindowXamlSource = "{D585BFE1-00FF-51BE-BA1D-A1329956EA0A}"
Global Const $sIID_IDesktopWindowXamlSourceFactory = "{5CD61DC0-2561-56E1-8E75-6E44173805E3}"
Global Const $sIID_IDesktopWindowXamlSourceGotFocusEventArgs = "{39BE4849-D9CC-5B70-8F05-1AD9A4AAA342}"
Global Const $sIID_IDesktopWindowXamlSourceTakeFocusRequestedEventArgs = "{FE61E4B9-A7AF-52B3-BDB9-C3305C0B8DF2}"
Global Const $sIID_IWindowsXamlManager = "{56096C31-1AA0-5288-8818-6E74A2DCAFF5}"
Global Const $sIID_IWindowsXamlManagerStatics = "{28258A12-7D82-505B-B210-712B04A58882}"
Global Const $sIID_IDependencyObject = "{5C526665-F60E-4912-AF59-5FE0680F089D}"
Global Const $sIID_IDependencyObject2 = "{29FED85D-3D22-43A1-ADD0-17027C08B212}"
Global Const $sIID_IDependencyObjectCollectionFactory = "{051E79FF-B3A8-49EE-B5AF-AC8F68B649E4}"
Global Const $sIID_IDependencyObjectFactory = "{9A03AF92-7D8A-4937-884F-ECF34FE02ACB}"
Global Const $sIID_IFrameworkElement = "{A391D09B-4A99-4B7C-9D8D-6FA5D01F6FBF}"
Global Const $sIID_IFrameworkElement2 = "{F19104BE-422A-4904-A52F-EE72010429E5}"
Global Const $sIID_IFrameworkElement3 = "{C81C2720-5C52-4BBE-A199-2B1E34F00F70}"
Global Const $sIID_IFrameworkElement4 = "{6B765BB3-FBA3-4404-BDEE-1A45D1CA5F21}"
Global Const $sIID_IFrameworkElement6 = "{792A5D91-62A1-40BF-A0CE-F9C131FCB7A7}"
Global Const $sIID_IFrameworkElement7 = "{2263886C-C069-570F-B9CC-9E21DD028D8E}"
Global Const $sIID_IFrameworkElementFactory = "{DEAEE126-03CA-4966-B576-604CCE93B5E8}"
Global Const $sIID_IFrameworkElementOverrides = "{DA007E54-B3C2-4B9A-AA8E-D3F071262B97}"
Global Const $sIID_IFrameworkElementOverrides2 = "{CB5CD2B9-E3B4-458C-B64E-1434FD1BD88A}"
Global Const $sIID_IFrameworkElementProtected7 = "{65AA0480-22E3-5103-AD2A-B626F88CA5AE}"
Global Const $sIID_IFrameworkElementStatics = "{48383032-FBEB-4F8A-AED2-EE21FB27A57B}"
Global Const $sIID_IFrameworkElementStatics2 = "{9695DB02-C0D8-4FA2-B100-3FA2DF8B9538}"
Global Const $sIID_IFrameworkElementStatics4 = "{9C41B155-C5D8-4663-BFF2-D8D54FB5DBB3}"
Global Const $sIID_IFrameworkElementStatics5 = "{525D3941-0B3C-4BE6-9978-19A8025C09D8}"
Global Const $sIID_IFrameworkElementStatics6 = "{FCC1529A-69DB-4582-A7BE-CF6A1CFDACD0}"
Global Const $sIID_IUIElement = "{676D0BE9-B65C-41C6-BA40-58CF87F201C1}"
Global Const $sIID_IUIElement10 = "{D531C629-AD2C-5F6B-ADCF-FB87287D18D7}"
Global Const $sIID_IUIElement2 = "{676D0BF9-B66C-41D6-BA50-58CF87F201D1}"
Global Const $sIID_IUIElement3 = "{BC2B28F1-26F2-4AAB-B256-3B5350881E37}"
Global Const $sIID_IUIElement4 = "{69145CD4-199A-4657-9E57-E99E8F136712}"
Global Const $sIID_IUIElement5 = "{8EED9BC2-A58C-4453-AF0F-A92EE06D0317}"
Global Const $sIID_IUIElement7 = "{CAFC4968-6369-4249-80F9-3D656319E811}"
Global Const $sIID_IUIElement8 = "{3AB70E85-D508-4477-B6F8-0E435701C836}"
Global Const $sIID_IUIElement9 = "{B4A04776-4E88-50CA-8F2B-08940D6C5F94}"
Global Const $sIID_IUIElementFactory = "{B9EE93FE-A338-419F-AC32-91DCAADF5D08}"
Global Const $sIID_IUIElementOverrides = "{608D2F1D-7858-4AEB-89E4-B54E2C7ED3D3}"
Global Const $sIID_IUIElementOverrides7 = "{B97F7F68-C29B-4C99-A1C3-952619D6E720}"
Global Const $sIID_IUIElementOverrides8 = "{4A5A645C-548D-48CF-B998-7844D6E235A1}"
Global Const $sIID_IUIElementOverrides9 = "{9A6E5973-6D63-54F2-90FA-62813B20B7B9}"
Global Const $sIID_IUIElementStatics = "{58D3573B-F52C-45BE-988B-A5869564873C}"
Global Const $sIID_IUIElementStatics10 = "{60D25362-4B3E-53DA-8B78-38DB94AE8F26}"
Global Const $sIID_IUIElementStatics2 = "{58D3574B-F53C-45BE-989B-A5869564874C}"
Global Const $sIID_IUIElementStatics3 = "{D1F87ADE-ECA1-4561-A32B-64601B4E0597}"
Global Const $sIID_IUIElementStatics4 = "{1D157D61-16AF-411F-B774-272375A4AC2C}"
Global Const $sIID_IUIElementStatics5 = "{59BD7D91-8FA3-4C65-BA1B-40DF38556CBB}"
Global Const $sIID_IUIElementStatics6 = "{647E03B7-036A-4DEA-9540-1DD7FD1266F1}"
Global Const $sIID_IUIElementStatics7 = "{DA9B4493-A695-4145-AE93-888024396A0F}"
Global Const $sIID_IUIElementStatics8 = "{17BE3487-4875-4915-B0B1-A4C0F851DF3F}"
Global Const $sIID_IUIElementStatics9 = "{71467E77-8CA3-5ED7-95DB-D51CDAD77F81}"
Global Const $sIID_IUIElementWeakCollection = "{10341223-E66D-519E-ACF8-556BD244EAC3}"
Global Const $sIID_IUIElementWeakCollectionFactory = "{57242561-188A-5304-8792-A43F35D90F99}"

Global $mTrustlevel[]
$mTrustlevel["BaseTrust"] = 0x00000000
$mTrustlevel["PartialTrust"] = 0x00000001
$mTrustlevel["FullTrust"] = 0x00000002
__WinRT_AddReverseMappings($mTrustlevel)

Global $mAdaptiveMediaSourceCreationStatus[]
$mAdaptiveMediaSourceCreationStatus["Success"] = 0x00000000
$mAdaptiveMediaSourceCreationStatus["ManifestDownloadFailure"] = 0x00000001
$mAdaptiveMediaSourceCreationStatus["ManifestParseFailure"] = 0x00000002
$mAdaptiveMediaSourceCreationStatus["UnsupportedManifestContentType"] = 0x00000003
$mAdaptiveMediaSourceCreationStatus["UnsupportedManifestVersion"] = 0x00000004
$mAdaptiveMediaSourceCreationStatus["UnsupportedManifestProfile"] = 0x00000005
$mAdaptiveMediaSourceCreationStatus["UnknownFailure"] = 0x00000006
__WinRT_AddReverseMappings($mAdaptiveMediaSourceCreationStatus)

Global $mAdaptiveMediaSourceDiagnosticType[]
$mAdaptiveMediaSourceDiagnosticType["ManifestUnchangedUponReload"] = 0x00000000
$mAdaptiveMediaSourceDiagnosticType["ManifestMismatchUponReload"] = 0x00000001
$mAdaptiveMediaSourceDiagnosticType["ManifestSignaledEndOfLiveEventUponReload"] = 0x00000002
$mAdaptiveMediaSourceDiagnosticType["MediaSegmentSkipped"] = 0x00000003
$mAdaptiveMediaSourceDiagnosticType["ResourceNotFound"] = 0x00000004
$mAdaptiveMediaSourceDiagnosticType["ResourceTimedOut"] = 0x00000005
$mAdaptiveMediaSourceDiagnosticType["ResourceParsingError"] = 0x00000006
$mAdaptiveMediaSourceDiagnosticType["BitrateDisabled"] = 0x00000007
$mAdaptiveMediaSourceDiagnosticType["FatalMediaSourceError"] = 0x00000008
__WinRT_AddReverseMappings($mAdaptiveMediaSourceDiagnosticType)

Global $mAdaptiveMediaSourceDownloadBitrateChangedReason[]
$mAdaptiveMediaSourceDownloadBitrateChangedReason["SufficientInboundBitsPerSecond"] = 0x00000000
$mAdaptiveMediaSourceDownloadBitrateChangedReason["InsufficientInboundBitsPerSecond"] = 0x00000001
$mAdaptiveMediaSourceDownloadBitrateChangedReason["LowBufferLevel"] = 0x00000002
$mAdaptiveMediaSourceDownloadBitrateChangedReason["PositionChanged"] = 0x00000003
$mAdaptiveMediaSourceDownloadBitrateChangedReason["TrackSelectionChanged"] = 0x00000004
$mAdaptiveMediaSourceDownloadBitrateChangedReason["DesiredBitratesChanged"] = 0x00000005
$mAdaptiveMediaSourceDownloadBitrateChangedReason["ErrorInPreviousBitrate"] = 0x00000006
__WinRT_AddReverseMappings($mAdaptiveMediaSourceDownloadBitrateChangedReason)

Global $mAdaptiveMediaSourceResourceType[]
$mAdaptiveMediaSourceResourceType["Manifest"] = 0x00000000
$mAdaptiveMediaSourceResourceType["InitializationSegment"] = 0x00000001
$mAdaptiveMediaSourceResourceType["MediaSegment"] = 0x00000002
$mAdaptiveMediaSourceResourceType["Key"] = 0x00000003
$mAdaptiveMediaSourceResourceType["InitializationVector"] = 0x00000004
$mAdaptiveMediaSourceResourceType["MediaSegmentIndex"] = 0x00000005
__WinRT_AddReverseMappings($mAdaptiveMediaSourceResourceType)

Global $mAsyncStatus[]
$mAsyncStatus["Started"] = 0x00000000
$mAsyncStatus["Completed"] = 0x00000001
$mAsyncStatus["Canceled"] = 0x00000002
$mAsyncStatus["Error"] = 0x00000003
__WinRT_AddReverseMappings($mAsyncStatus)

Global $mBackgroundSizing[]
$mBackgroundSizing["InnerBorderEdge"] = 0x00000000
$mBackgroundSizing["OuterBorderEdge"] = 0x00000001
__WinRT_AddReverseMappings($mBackgroundSizing)

Global $mElementCompositeMode[]
$mElementCompositeMode["Inherit"] = 0x00000000
$mElementCompositeMode["SourceOver"] = 0x00000001
$mElementCompositeMode["MinBlend"] = 0x00000002
__WinRT_AddReverseMappings($mElementCompositeMode)

Global $mElementHighContrastAdjustment[]
$mElementHighContrastAdjustment["None"] = 0x00000000
$mElementHighContrastAdjustment["Application"] = 0x80000000
$mElementHighContrastAdjustment["Auto"] = 0xFFFFFFFF
__WinRT_AddReverseMappings($mElementHighContrastAdjustment)

Global $mElementSoundMode[]
$mElementSoundMode["Default"] = 0x00000000
$mElementSoundMode["FocusOnly"] = 0x00000001
$mElementSoundMode["Off"] = 0x00000002
__WinRT_AddReverseMappings($mElementSoundMode)

Global $mElementTheme[]
$mElementTheme["Default"] = 0x00000000
$mElementTheme["Light"] = 0x00000001
$mElementTheme["Dark"] = 0x00000002
__WinRT_AddReverseMappings($mElementTheme)

Global $mFlowDirection[]
$mFlowDirection["LeftToRight"] = 0x00000000
$mFlowDirection["RightToLeft"] = 0x00000001
__WinRT_AddReverseMappings($mFlowDirection)

Global $mFocusState[]
$mFocusState["Unfocused"] = 0x00000000
$mFocusState["Pointer"] = 0x00000001
$mFocusState["Keyboard"] = 0x00000002
$mFocusState["Programmatic"] = 0x00000003
__WinRT_AddReverseMappings($mFocusState)

Global $mFontStretch[]
$mFontStretch["Undefined"] = 0x00000000
$mFontStretch["UltraCondensed"] = 0x00000001
$mFontStretch["ExtraCondensed"] = 0x00000002
$mFontStretch["Condensed"] = 0x00000003
$mFontStretch["SemiCondensed"] = 0x00000004
$mFontStretch["Normal"] = 0x00000005
$mFontStretch["SemiExpanded"] = 0x00000006
$mFontStretch["Expanded"] = 0x00000007
$mFontStretch["ExtraExpanded"] = 0x00000008
$mFontStretch["UltraExpanded"] = 0x00000009
__WinRT_AddReverseMappings($mFontStretch)

Global $mFontStyle[]
$mFontStyle["Normal"] = 0x00000000
$mFontStyle["Oblique"] = 0x00000001
$mFontStyle["Italic"] = 0x00000002
__WinRT_AddReverseMappings($mFontStyle)

Global $mHorizontalAlignment[]
$mHorizontalAlignment["Left"] = 0x00000000
$mHorizontalAlignment["Center"] = 0x00000001
$mHorizontalAlignment["Right"] = 0x00000002
$mHorizontalAlignment["Stretch"] = 0x00000003
__WinRT_AddReverseMappings($mHorizontalAlignment)

Global $mKeyboardAcceleratorPlacementMode[]
$mKeyboardAcceleratorPlacementMode["Auto"] = 0x00000000
$mKeyboardAcceleratorPlacementMode["Hidden"] = 0x00000001
__WinRT_AddReverseMappings($mKeyboardAcceleratorPlacementMode)

Global $mKeyboardNavigationMode[]
$mKeyboardNavigationMode["Local"] = 0x00000000
$mKeyboardNavigationMode["Cycle"] = 0x00000001
$mKeyboardNavigationMode["Once"] = 0x00000002
__WinRT_AddReverseMappings($mKeyboardNavigationMode)

Global $mKeyTipPlacementMode[]
$mKeyTipPlacementMode["Auto"] = 0x00000000
$mKeyTipPlacementMode["Bottom"] = 0x00000001
$mKeyTipPlacementMode["Top"] = 0x00000002
$mKeyTipPlacementMode["Left"] = 0x00000003
$mKeyTipPlacementMode["Right"] = 0x00000004
$mKeyTipPlacementMode["Center"] = 0x00000005
$mKeyTipPlacementMode["Hidden"] = 0x00000006
__WinRT_AddReverseMappings($mKeyTipPlacementMode)

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

Global $mMediaPlaybackState[]
$mMediaPlaybackState["None"] = 0x00000000
$mMediaPlaybackState["Opening"] = 0x00000001
$mMediaPlaybackState["Buffering"] = 0x00000002
$mMediaPlaybackState["Playing"] = 0x00000003
$mMediaPlaybackState["Paused"] = 0x00000004
__WinRT_AddReverseMappings($mMediaPlaybackState)

Global $mMediaPlayerAudioCategory[]
$mMediaPlayerAudioCategory["Other"] = 0x00000000
$mMediaPlayerAudioCategory["Communications"] = 0x00000003
$mMediaPlayerAudioCategory["Alerts"] = 0x00000004
$mMediaPlayerAudioCategory["SoundEffects"] = 0x00000005
$mMediaPlayerAudioCategory["GameEffects"] = 0x00000006
$mMediaPlayerAudioCategory["GameMedia"] = 0x00000007
$mMediaPlayerAudioCategory["GameChat"] = 0x00000008
$mMediaPlayerAudioCategory["Speech"] = 0x00000009
$mMediaPlayerAudioCategory["Movie"] = 0x0000000A
$mMediaPlayerAudioCategory["Media"] = 0x0000000B
__WinRT_AddReverseMappings($mMediaPlayerAudioCategory)

Global $mMediaPlayerAudioDeviceType[]
$mMediaPlayerAudioDeviceType["Console"] = 0x00000000
$mMediaPlayerAudioDeviceType["Multimedia"] = 0x00000001
$mMediaPlayerAudioDeviceType["Communications"] = 0x00000002
__WinRT_AddReverseMappings($mMediaPlayerAudioDeviceType)

Global $mMediaPlayerError[]
$mMediaPlayerError["Unknown"] = 0x00000000
$mMediaPlayerError["Aborted"] = 0x00000001
$mMediaPlayerError["NetworkError"] = 0x00000002
$mMediaPlayerError["DecodingError"] = 0x00000003
$mMediaPlayerError["SourceNotSupported"] = 0x00000004
__WinRT_AddReverseMappings($mMediaPlayerError)

Global $mMediaPlayerState[]
$mMediaPlayerState["Closed"] = 0x00000000
$mMediaPlayerState["Opening"] = 0x00000001
$mMediaPlayerState["Buffering"] = 0x00000002
$mMediaPlayerState["Playing"] = 0x00000003
$mMediaPlayerState["Paused"] = 0x00000004
$mMediaPlayerState["Stopped"] = 0x00000005
__WinRT_AddReverseMappings($mMediaPlayerState)

Global $mMediaRotation[]
$mMediaRotation["None"] = 0x00000000
$mMediaRotation["Clockwise90Degrees"] = 0x00000001
$mMediaRotation["Clockwise180Degrees"] = 0x00000002
$mMediaRotation["Clockwise270Degrees"] = 0x00000003
__WinRT_AddReverseMappings($mMediaRotation)

Global $mMediaSourceAudioInputNodeCreationStatus[]
$mMediaSourceAudioInputNodeCreationStatus["Success"] = 0x00000000
$mMediaSourceAudioInputNodeCreationStatus["FormatNotSupported"] = 0x00000001
$mMediaSourceAudioInputNodeCreationStatus["NetworkError"] = 0x00000002
$mMediaSourceAudioInputNodeCreationStatus["UnknownFailure"] = 0x00000003
__WinRT_AddReverseMappings($mMediaSourceAudioInputNodeCreationStatus)

Global $mMediaSourceState[]
$mMediaSourceState["Initial"] = 0x00000000
$mMediaSourceState["Opening"] = 0x00000001
$mMediaSourceState["Opened"] = 0x00000002
$mMediaSourceState["Failed"] = 0x00000003
$mMediaSourceState["Closed"] = 0x00000004
__WinRT_AddReverseMappings($mMediaSourceState)

Global $mRequiresPointer[]
$mRequiresPointer["Never"] = 0x00000000
$mRequiresPointer["WhenEngaged"] = 0x00000001
$mRequiresPointer["WhenFocused"] = 0x00000002
__WinRT_AddReverseMappings($mRequiresPointer)

Global $mStereoscopicVideoPackingMode[]
$mStereoscopicVideoPackingMode["None"] = 0x00000000
$mStereoscopicVideoPackingMode["SideBySide"] = 0x00000001
$mStereoscopicVideoPackingMode["TopBottom"] = 0x00000002
__WinRT_AddReverseMappings($mStereoscopicVideoPackingMode)

Global $mStereoscopicVideoRenderMode[]
$mStereoscopicVideoRenderMode["Mono"] = 0x00000000
$mStereoscopicVideoRenderMode["Stereo"] = 0x00000001
__WinRT_AddReverseMappings($mStereoscopicVideoRenderMode)

Global $mStretch[]
$mStretch["None"] = 0x00000000
$mStretch["Fill"] = 0x00000001
$mStretch["Uniform"] = 0x00000002
$mStretch["UniformToFill"] = 0x00000003
__WinRT_AddReverseMappings($mStretch)

Global $mThumbnailMode[]
$mThumbnailMode["PicturesView"] = 0x00000000
$mThumbnailMode["VideosView"] = 0x00000001
$mThumbnailMode["MusicView"] = 0x00000002
$mThumbnailMode["DocumentsView"] = 0x00000003
$mThumbnailMode["ListView"] = 0x00000004
$mThumbnailMode["SingleItem"] = 0x00000005
__WinRT_AddReverseMappings($mThumbnailMode)

Global $mThumbnailOptions[]
$mThumbnailOptions["None"] = 0x00000000
$mThumbnailOptions["ReturnOnlyIfCached"] = 0x00000001
$mThumbnailOptions["ResizeThumbnail"] = 0x00000002
$mThumbnailOptions["UseCurrentScale"] = 0x00000004
__WinRT_AddReverseMappings($mThumbnailOptions)

Global $mVerticalAlignment[]
$mVerticalAlignment["Top"] = 0x00000000
$mVerticalAlignment["Center"] = 0x00000001
$mVerticalAlignment["Bottom"] = 0x00000002
$mVerticalAlignment["Stretch"] = 0x00000003
__WinRT_AddReverseMappings($mVerticalAlignment)

Global $mVisibility[]
$mVisibility["Visible"] = 0x00000000
$mVisibility["Collapsed"] = 0x00000001
__WinRT_AddReverseMappings($mVisibility)

Global $mXYFocusKeyboardNavigationMode[]
$mXYFocusKeyboardNavigationMode["Auto"] = 0x00000000
$mXYFocusKeyboardNavigationMode["Enabled"] = 0x00000001
$mXYFocusKeyboardNavigationMode["Disabled"] = 0x00000002
__WinRT_AddReverseMappings($mXYFocusKeyboardNavigationMode)

Global $mXYFocusNavigationStrategy[]
$mXYFocusNavigationStrategy["Auto"] = 0x00000000
$mXYFocusNavigationStrategy["Projection"] = 0x00000001
$mXYFocusNavigationStrategy["NavigationDirectionDistance"] = 0x00000002
$mXYFocusNavigationStrategy["RectilinearDistance"] = 0x00000003
__WinRT_AddReverseMappings($mXYFocusNavigationStrategy)

Global Const $CorOpenFlg_ofRead = 0x00000000
Global Const $CorOpenFlg_ofWrite = 0x00000001
Global Const $CorOpenFlg_ofReadWriteMask = 0x00000001
Global Const $CorOpenFlg_ofCopyMemory = 0x00000002
Global Const $CorOpenFlg_ofCacheImage = 0x00000004 ;obsolete
Global Const $CorOpenFlg_ofManifestMetadata = 0x00000008 ;obsolete
Global Const $CorOpenFlg_ofReadOnly = 0x00000010
Global Const $CorOpenFlg_ofTakeOwnership = 0x00000020
Global Const $CorOpenFlg_ofNoTypeLib = 0x00000080 ;obsolete
Global Const $CorOpenFlg_ofNoTransform = 0x00001000
Global Const $CorOpenFlg_ofReserved1 = 0x00000100
Global Const $CorOpenFlg_ofReserved2 = 0x00000200
Global Const $CorOpenFlg_ofReserved = 0xffffff40

Global Const $ELEMENT_TYPE_VOID = 0x1
Global Const $ELEMENT_TYPE_BOOLEAN = 0x2
Global Const $ELEMENT_TYPE_CHAR = 0x3
Global Const $ELEMENT_TYPE_I1 = 0x4
Global Const $ELEMENT_TYPE_U1 = 0x5
Global Const $ELEMENT_TYPE_I2 = 0x6
Global Const $ELEMENT_TYPE_U2 = 0x7
Global Const $ELEMENT_TYPE_I4 = 0x8
Global Const $ELEMENT_TYPE_U4 = 0x9
Global Const $ELEMENT_TYPE_I8 = 0xa
Global Const $ELEMENT_TYPE_U8 = 0xb
Global Const $ELEMENT_TYPE_R4 = 0xc
Global Const $ELEMENT_TYPE_R8 = 0xd
Global Const $ELEMENT_TYPE_STRING = 0xe
Global Const $ELEMENT_TYPE_BYREF = 0x10
Global Const $ELEMENT_TYPE_VALUETYPE = 0x11
Global Const $ELEMENT_TYPE_CLASS = 0x12
Global Const $ELEMENT_TYPE_VAR = 0x13
Global Const $ELEMENT_TYPE_GENERICINST = 0x15
Global Const $ELEMENT_TYPE_I = 0x18
Global Const $ELEMENT_TYPE_U = 0x19
Global Const $ELEMENT_TYPE_OBJECT = 0x1C
Global Const $ELEMENT_TYPE_SZARRAY = 0x1D
Global Const $ELEMENT_TYPE_CMOD_OPT = 0x20
Global Const $ELEMENT_TYPE_CMOD_REQ = 0x21

Global Const $MDT_Module = 0x00000000
Global Const $MDT_TypeRef = 0x01000000
Global Const $MDT_TypeDef = 0x02000000
Global Const $MDT_FieldDef = 0x04000000
Global Const $MDT_MethodDef = 0x06000000
Global Const $MDT_ParamDef = 0x08000000
Global Const $MDT_InterfaceImpl = 0x09000000
Global Const $MDT_MemberRef = 0x0a000000
Global Const $MDT_CustomAttribute = 0x0c000000
Global Const $MDT_Permission = 0x0e000000
Global Const $MDT_Signature = 0x11000000
Global Const $MDT_Event = 0x14000000
Global Const $MDT_Property = 0x17000000
Global Const $MDT_ModuleRef = 0x1a000000
Global Const $MDT_TypeSpec = 0x1b000000
Global Const $MDT_Assembly = 0x20000000
Global Const $MDT_AssemblyRef = 0x23000000
Global Const $MDT_File = 0x26000000
Global Const $MDT_ExportedType = 0x27000000
Global Const $MDT_ManifestResource = 0x28000000
Global Const $MDT_GenericParam = 0x2a000000
Global Const $MDT_MethodSpec = 0x2b000000
Global Const $MDT_GenericParamConstraint = 0x2c000000
Global Const $MDT_String = 0x70000000
Global Const $MDT_Name = 0x71000000
Global Const $MDT_BaseType = 0x72000000

Global $mCorElementTag[]
$mCorElementTag[$ELEMENT_TYPE_BOOLEAN] = "bool"
$mCorElementTag[$ELEMENT_TYPE_CHAR] = "char"
$mCorElementTag[$ELEMENT_TYPE_I1] = "byte"
$mCorElementTag[$ELEMENT_TYPE_U1] = "byte"
$mCorElementTag[$ELEMENT_TYPE_I2] = "short"
$mCorElementTag[$ELEMENT_TYPE_U2] = "ushort"
$mCorElementTag[$ELEMENT_TYPE_I4] = "long"
$mCorElementTag[$ELEMENT_TYPE_U4] = "ulong"
$mCorElementTag[$ELEMENT_TYPE_I8] = "int64"
$mCorElementTag[$ELEMENT_TYPE_U8] = "uint64"
$mCorElementTag[$ELEMENT_TYPE_R4] = "float"
$mCorElementTag[$ELEMENT_TYPE_R8] = "double"
$mCorElementTag[$ELEMENT_TYPE_STRING] = "string"

Global $mCorElementType[]
$mCorElementType[$ELEMENT_TYPE_VOID] = "Void"
$mCorElementType[$ELEMENT_TYPE_U1] = "UInt8"
$mCorElementType[$ELEMENT_TYPE_I2] = "Int16"
$mCorElementType[$ELEMENT_TYPE_I4] = "Int32"
$mCorElementType[$ELEMENT_TYPE_I8] = "Int64"
$mCorElementType[$ELEMENT_TYPE_U2] = "UInt16"
$mCorElementType[$ELEMENT_TYPE_U4] = "UInt32"
$mCorElementType[$ELEMENT_TYPE_U8] = "UInt64"
$mCorElementType[$ELEMENT_TYPE_R4] = "Single"
$mCorElementType[$ELEMENT_TYPE_R8] = "Double"
$mCorElementType[$ELEMENT_TYPE_CHAR] = "Char16"
$mCorElementType[$ELEMENT_TYPE_BOOLEAN] = "Boolean"
$mCorElementType[$ELEMENT_TYPE_STRING] = "String"

Global Const $tdVisibilityMask = 0x00000007
Global Const $tdNotPublic = 0x00000000
Global Const $tdPublic = 0x00000001
Global Const $tdNestedPublic = 0x00000002
Global Const $tdNestedPrivate = 0x00000003
Global Const $tdNestedFamily = 0x00000004
Global Const $tdNestedAssembly = 0x00000005
Global Const $tdNestedFamANDAssem = 0x00000006
Global Const $tdNestedFamORAssem = 0x00000007

Global Const $tdLayoutMask = 0x00000018
Global Const $tdAutoLayout = 0x00000000
Global Const $tdSequentialLayout = 0x00000008
Global Const $tdExplicitLayout = 0x00000010

Global Const $tdClassSemanticsMask = 0x00000020
Global Const $tdClass = 0x00000000
Global Const $tdInterface = 0x00000020

Global Const $tdAbstract = 0x00000080
Global Const $tdSealed = 0x00000100
Global Const $tdSpecialName = 0x00000400

Global Const $tdImport = 0x00001000
Global Const $tdSerializable = 0x00002000
Global Const $tdWindowsRuntime = 0x00004000

Global Const $tdStringFormatMask = 0x00030000
Global Const $tdAnsiClass = 0x00000000
Global Const $tdUnicodeClass = 0x00010000
Global Const $tdAutoClass = 0x00020000
Global Const $tdCustomFormatClass = 0x00030000
Global Const $tdCustomFormatMask = 0x00C00000

Global Const $tdBeforeFieldInit = 0x00100000
Global Const $tdForwarder = 0x00200000

Global Const $tdReservedMask = 0x00040800
Global Const $tdRTSpecialName = 0x00000800
Global Const $tdHasSecurity = 0x00040000

Global $aCustomAttribTypes[] = [ _
		"Windows.Foundation.Metadata.ActivatableAttribute", _
		"Windows.Foundation.Metadata.AllowForWebAttribute", _
		"Windows.Foundation.Metadata.AllowMultipleAttribute", _
		"Windows.Foundation.Metadata.ApiContractAttribute", _
		"Windows.Foundation.Metadata.ApiInformation", _
		"Windows.Foundation.Metadata.AttributeNameAttribute", _
		"Windows.Foundation.Metadata.AttributeTargets", _
		"Windows.Foundation.Metadata.AttributeUsageAttribute", _
		"Windows.Foundation.Metadata.ComposableAttribute", _
		"Windows.Foundation.Metadata.CompositionType", _
		"Windows.Foundation.Metadata.ContractVersionAttribute", _
		"Windows.Foundation.Metadata.CreateFromStringAttribute", _
		"Windows.Foundation.Metadata.DefaultAttribute", _
		"Windows.Foundation.Metadata.DefaultOverloadAttribute", _
		"Windows.Foundation.Metadata.DeprecatedAttribute", _
		"Windows.Foundation.Metadata.DeprecationType", _
		"Windows.Foundation.Metadata.DualApiPartitionAttribute", _
		"Windows.Foundation.Metadata.ExclusiveToAttribute", _
		"Windows.Foundation.Metadata.ExperimentalAttribute", _
		"Windows.Foundation.Metadata.FastAbiAttribute", _
		"Windows.Foundation.Metadata.FeatureAttribute", _
		"Windows.Foundation.Metadata.FeatureStage", _
		"Windows.Foundation.Metadata.GCPressureAmount", _
		"Windows.Foundation.Metadata.GCPressureAttribute", _
		"Windows.Foundation.Metadata.GuidAttribute", _
		"Windows.Foundation.Metadata.HasVariantAttribute", _
		"Windows.Foundation.Metadata.IApiInformationStatics", _
		"Windows.Foundation.Metadata.InternalAttribute", _
		"Windows.Foundation.Metadata.LengthIsAttribute", _
		"Windows.Foundation.Metadata.MarshalingBehaviorAttribute", _
		"Windows.Foundation.Metadata.MarshalingType", _
		"Windows.Foundation.Metadata.MetadataMarshalAttribute", _
		"Windows.Foundation.Metadata.MuseAttribute", _
		"Windows.Foundation.Metadata.NoExceptionAttribute", _
		"Windows.Foundation.Metadata.OverloadAttribute", _
		"Windows.Foundation.Metadata.OverridableAttribute", _
		"Windows.Foundation.Metadata.Platform", _
		"Windows.Foundation.Metadata.PlatformAttribute", _
		"Windows.Foundation.Metadata.PreviousContractVersionAttribute", _
		"Windows.Foundation.Metadata.ProtectedAttribute", _
		"Windows.Foundation.Metadata.RangeAttribute", _
		"Windows.Foundation.Metadata.RemoteAsyncAttribute", _
		"Windows.Foundation.Metadata.StaticAttribute", _
		"Windows.Foundation.Metadata.ThreadingAttribute", _
		"Windows.Foundation.Metadata.ThreadingModel", _
		"Windows.Foundation.Metadata.VariantAttribute", _
		"Windows.Foundation.Metadata.VersionAttribute", _
		"Windows.Foundation.Metadata.WebHostHiddenAttribute", _
		"System.FlagsAttribute"]

Func __AddRef($pThis)
	Local $tThis = DllStructCreate("align 4;ptr pVTab;int iRefCnt", $pThis)
	$tThis.iRefCnt += 1
	Return $tThis.iRefCnt
EndFunc   ;==>__AddRef

Func __IMetaDataImport_EnumProc($pThis, $iVTableIdx, ByRef $pEnum, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[5]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumProc

Func __IMetaDataImport_EnumWithTokenAndNameProc($pThis, $iVTableIdx, ByRef $pEnum, $iToken, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "wstr", $sName, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[6]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumWithTokenAndNameProc

Func __IMetaDataImport_EnumWithTokenProc($pThis, $iVTableIdx, ByRef $pEnum, $iToken, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[6]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumWithTokenProc

Func __IMetaDataImport_FindProc($pThis, $iVTableIdx, $iToken, $sName, ByRef $dSignature)
	Local $vFailVal = -1
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $dSignature And (Not IsBinary($dSignature)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pSig, $iSigLen
	If $dSignature Then
		$iSigLen = BinaryLen($dSignature)
		Local $tSig = DllStructCreate(StringFormat("byte[%d]", $iSigLen))
		DllStructSetData($tSig, 1, $dSignature)
		$pSig = DllStructGetPtr($tSig)
	EndIf
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "wstr", $sName, "ptr", $pSig, "uint", $iSigLen, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[6])
EndFunc   ;==>__IMetaDataImport_FindProc

Func __IRoMetaDataLocator_Locate($pThis, $pNameElement, $pBuilder)
	#forceref $pThis, $pNameElement, $pBuilder

	Local $bIsParamatised, $bIsInterface, $bIsDelegate
	Local $sFilePath, $pScope, $iTypeDefTkn, $sGUID
	Local $pIntImplEnum, $aIfaceImplTkn, $aIfaceImplProp, $iIfaceTkn, $sIfaceName
	Local $pAttribEnum, $aAttrib, $aAttribProps, $aMemRefProps, $pFieldsEnum, $aFieldProps

	Local $aCall = DllCall("kernel32.dll", "int", "lstrlenW", "ptr", $pNameElement)
	Local $tNameElement = DllStructCreate(StringFormat("wchar[%d]", $aCall[0]), $pNameElement)
	Local $sNameElement = DllStructGetData($tNameElement, 1)
	_WinRT_GetMetaDataFile($sNameElement, 0, $sFilePath, $pScope, $iTypeDefTkn)

	Local $aTDProps = _MetaData_GetTypeDefProps($pScope, $iTypeDefTkn)
	Local $sName = $aTDProps[0]
	Local $sExtends = _MetaData_GetTokenName($pScope, $aTDProps[2])
	If $sExtends = "System.MulticastDelegate" Then
		$bIsDelegate = True
		$sGUID = _MetaData_GetGUIDAttrib($pScope, $iTypeDefTkn)
	EndIf

	Local $iNumParams
	If StringInStr($sName, "`") Then
		$bIsParamatised = True
		$iNumParams = Int(StringRegExpReplace($sName, ".*`", ""))
	EndIf

	Local $iLayout = BitAND($aTDProps[1], $tdLayoutMask)
	Local $iClassSemantics = BitAND($aTDProps[1], $tdClassSemanticsMask)
	If BitAND($iClassSemantics, $tdInterface) Then
		$bIsInterface = True
		$sGUID = _MetaData_GetGUIDAttrib($pScope, $iTypeDefTkn)

	ElseIf BitAND($iLayout, $tdSequentialLayout) Then
		Local $aFields = _MetaData_EnumFields($pScope, $pFieldsEnum, $iTypeDefTkn, -1)
		_MetaData_CloseEnum($pScope, $pFieldsEnum)

		Local $asFieldTypeNames[UBound($aFields)]
		Local $aSigParams

		For $i = 0 To UBound($aFields) - 1
			$aFieldProps = _MetaData_GetFieldProps($pScope, $aFields[$i])
			$aSigParams = _MetaData_DecodeFieldSig($pScope, $aFieldProps[3])
			$asFieldTypeNames[$i] = $mCorElementType[$aSigParams[0][0]]
		Next
	Else
		While 1
			$aIfaceImplTkn = _MetaData_EnumInterfaceImpls($pScope, $pIntImplEnum, $iTypeDefTkn)
			If @error Then ExitLoop

			$aAttrib = _MetaData_EnumCustomAttributes($pScope, $pAttribEnum, $aIfaceImplTkn[0], $MDT_InterfaceImpl, -1)
			_MetaData_CloseEnum($pScope, $pAttribEnum)

			For $i = 0 To UBound($aAttrib) - 1
				$aAttribProps = _MetaData_GetCustomAttributeProps($pScope, $aAttrib[0])
				$aMemRefProps = _MetaData_GetMemberRefProps($pScope, $aAttribProps[1])
				If _MetaData_GetTokenName($pScope, $aMemRefProps[0]) = "Windows.Foundation.Metadata.DefaultAttribute" Then ExitLoop
			Next
			If $i = UBound($aAttrib) Then ContinueLoop

			$aIfaceImplProp = _MetaData_GetInterfaceImplsProps($pScope, $aIfaceImplTkn[0])
			$iIfaceTkn = $aIfaceImplProp[1]
			If _MetaData_IsTypeRefTkn($iIfaceTkn) Then
				$sIfaceName = _MetaData_GetTokenName($pScope, $iIfaceTkn)
				$iTypeDefTkn = _MetaData_FindTypeDef($pScope, $sIfaceName)
				$aTDProps = _MetaData_GetTypeDefProps($pScope, $iTypeDefTkn)
				$sGUID = _MetaData_GetGUIDAttrib($pScope, $iTypeDefTkn)
			ElseIf _MetaData_IsTypeSpecTkn($iIfaceTkn) Then
				Local $dBlob = _MetaData_GetTypeSpecFromToken($pScope, $aIfaceImplProp[1])
				$dBlob = $dBlob
			EndIf
		WEnd
		_MetaData_CloseEnum($pScope, $pIntImplEnum)
	EndIf

	If $bIsInterface Or $bIsDelegate Then
		If $bIsParamatised Then
			If (Not $sGUID) Or (Not $iNumParams) Then Return $E_ABORT
			If $bIsDelegate Then
				IRoSimpleMetaDataBuilder_SetParameterizedDelegate($pBuilder, $sGUID, $iNumParams)
			Else
				IRoSimpleMetaDataBuilder_SetParameterizedInterface($pBuilder, $sGUID, $iNumParams)
			EndIf
			Return $S_OK
		Else
			If Not $sGUID Then Return $E_ABORT
			If $bIsDelegate Then
				IRoSimpleMetaDataBuilder_SetDelegate($pBuilder, $sGUID)
			Else
				IRoSimpleMetaDataBuilder_SetWinRtInterface($pBuilder, $sGUID)
			EndIf

			Return $S_OK
		EndIf
	Else
		Switch $sExtends
			Case "System.Enum"
				_MetaData_GetCustomAttributeByName($pScope, $iTypeDefTkn, "System.FlagsAttribute")
				Local $bIsBitfield = (@error = 0)
				IRoSimpleMetaDataBuilder_SetEnum($pBuilder, $sName, $bIsBitfield ? "UInt32" : "Int32")
				Return $S_OK

			Case "System.ValueType"
				IRoSimpleMetaDataBuilder_SetStruct($pBuilder, $sName, $asFieldTypeNames)
				Return $S_OK

			Case Else
				If (Not $sIfaceName) Then Return $E_ABORT
;~ 				If $bIsDelegate Then
;~ 					IRoSimpleMetaDataBuilder_SetDelegate($pBuilder, $sName, $sIfaceName, $sGUID)
;~ 				Else
				IRoSimpleMetaDataBuilder_SetRuntimeClassSimpleDefault($pBuilder, $sName, $sIfaceName, $sGUID)
;~ 				EndIf
				Return $S_OK
		EndSwitch
	EndIf

	Return $E_ABORT
EndFunc   ;==>__IRoMetaDataLocator_Locate

Func __MetaData_ReadCompressedInt(ByRef $dSig, ByRef $iReadPtr, $bSigned)
	Local $iByte1 = Int(BinaryMid($dSig, $iReadPtr, 1))
	Local $iCmprLen = 1
	If BitAND(0x80, $iByte1) Then $iCmprLen = (BitAND(0x40, $iByte1)) ? 4 : 2
	Local $tIntBuff = DllStructCreate("byte[4]")
	For $i = $iCmprLen To 1 Step -1
		DllStructSetData($tIntBuff, 1, BinaryMid($dSig, $iReadPtr, 1), $i)
		$iReadPtr += 1
	Next
	Local $iInt = Int(DllStructGetData($tIntBuff, 1))
	Local $iLenBits = Log($iCmprLen) / Log(2) + 1
	Local $iValMask = Int(2 ^ (8 * $iCmprLen - $iLenBits) - 1, 1)

	$iInt = BitAND($iValMask, $iInt)

	If $bSigned Then
		Local $iNeg = BitAND($iInt, 1)
		$iInt = BitShift($iInt, 1)
		$iValMask = BitShift($iValMask, 1)
		If $iNeg Then $iInt = BitOR(BitNOT($iValMask), $iInt)
	EndIf

	Return $iInt
EndFunc   ;==>__MetaData_ReadCompressedInt

Func __MetaData_ReadSerString(ByRef $tBuff, $iOffset)
	Local $pBuff = Ptr(DllStructGetPtr($tBuff) + $iOffset)
	Local $sDecStr = ""
	Local $tBuff2 = DllStructCreate("byte", $pBuff)
	Local $iEncLen = Int(DllStructGetData($tBuff2, 1))
	Local $iDecLen, $iStrLenLen = 0, $tWStr, $aCall

	If $iEncLen = 0xFF Or $iEncLen = 0 Then
		$iDecLen = 0
		$iStrLenLen = 1
	ElseIf BitAND(0x80, $iEncLen) Then
		$tBuff2 = DllStructCreate("byte[2]", $pBuff)
		$iEncLen = BitOR(BitShift($iEncLen, -8), DllStructGetData($tBuff2, 1, 2))
		If BitAND(0xC000, $iEncLen) = 0x8000 Then
			$iDecLen = BitAND($iEncLen, 0x3FFF)
			$iStrLenLen = 2
		ElseIf BitAND(0xE000, $iEncLen) = 0xC000 Then
			$tBuff2 = DllStructCreate("byte[4]", $pBuff)
			$iEncLen = BitOR(BitShift($iEncLen, -16), BitShift(DllStructGetData($tBuff2, 1, 3), -8), DllStructGetData($tBuff2, 1, 4))
			$iDecLen = BitAND($iEncLen, 0x1FFFFFFF)
			$iStrLenLen = 4
		Else
			Return SetError($ERROR_INVALID_PARAMETER, 0, 0)
		EndIf
	Else
		$iDecLen = $iEncLen
		$iStrLenLen = 1
	EndIf

	$tBuff2 = DllStructCreate(StringFormat("byte[%d]", $iDecLen), Ptr($pBuff + $iStrLenLen))
	If Not @error Then
		$aCall = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $CP_UTF8, "dword", 0, _
				"struct*", $tBuff2, "int", DllStructGetSize($tBuff2), "ptr", 0, "int", 0)
		$tWStr = DllStructCreate(StringFormat("wchar[%d]", $aCall[0]))

		$aCall = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $CP_UTF8, "dword", 0, _
				"struct*", $tBuff2, "int", DllStructGetSize($tBuff2), "struct*", $tWStr, "int", DllStructGetSize($tWStr))
		$sDecStr = DllStructGetData($tWStr, 1)
	EndIf

	Return SetExtended($iStrLenLen + $iDecLen, $sDecStr)
EndFunc   ;==>__MetaData_ReadSerString

Func __MetaData_ReadSigDataType($pScope, ByRef $dSig, ByRef $iReadPtr)
	Local $iDataType, $sDataType
	Local $iToken, $iTokenType, $aTokenProps
	Local $iGenInstArgCount

	$iDataType = Int(BinaryMid($dSig, $iReadPtr, 1))
	$iReadPtr += 1
	Switch $iDataType
		Case $ELEMENT_TYPE_VOID
			$sDataType = "Void"

		Case 0x02 To 0x0E
			$sDataType = $mCorElementType[$iDataType]

		Case $ELEMENT_TYPE_BYREF
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "*"

		Case $ELEMENT_TYPE_VALUETYPE, $ELEMENT_TYPE_CLASS, $ELEMENT_TYPE_CMOD_OPT, $ELEMENT_TYPE_CMOD_REQ
			$iToken = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
			$iTokenType = BitAND($iToken, 0x03)
			$iToken = BitShift($iToken, 2)
			Switch $iTokenType
				Case 0
					$iToken = BitOR($MDT_TypeDef, $iToken)
					$aTokenProps = _MetaData_GetTypeDefProps($pScope, $iToken)
					$sDataType = $aTokenProps[1]
				Case 1
					$iToken = BitOR($MDT_TypeRef, $iToken)
					$aTokenProps = _MetaData_GetTypeRefProps($pScope, $iToken)
					$sDataType = $aTokenProps[1] ; & " " & Hex($iToken, 8) & " " & $iReadPtr
				Case 2
					$iToken = BitOR($MDT_TypeSpec, $iToken)
					$sDataType = "TypeSpec 0x" & Hex($iToken, 8)

			EndSwitch

		Case $ELEMENT_TYPE_GENERICINST
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "<"
			$iGenInstArgCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)

			For $i = 0 To $iGenInstArgCount - 1
				$sDataType &= __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & ", "
			Next
			$sDataType = StringTrimRight($sDataType, 2) & ">"

		Case $ELEMENT_TYPE_SZARRAY
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "[]"
			;MsgBox(0, "", $sDataType)

		Case $ELEMENT_TYPE_I
			$sDataType = "System.IntPtr"

		Case $ELEMENT_TYPE_U
			$sDataType = "System.UIntPtr"

		Case $ELEMENT_TYPE_OBJECT
			$sDataType = "System.Object"

		Case $ELEMENT_TYPE_VAR
			$sDataType = "var" & __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)

		Case Else
			;;Not Supported
			Return SetError($ERROR_NOT_SUPPORTED, $iDataType, Binary("0x"))
;~ 			ConsoleWrite(Hex($iDataType) & " " & $dSig & " " & $iReadPtr & @CRLF)
;~ 			MsgBox(0, "", $dSig)

	EndSwitch

	Return SetExtended($iDataType, $sDataType)

EndFunc   ;==>__MetaData_ReadSigDataType

Func __QueryInterface($pThis, $pIID, $ppObj)
	Local $tThis = DllStructCreate("align 4;ptr pVTab;int iRefCnt;int iIIDCnt", $pThis)
	Local $hResult = $S_OK
	If Not $ppObj Then
		$hResult = $E_POINTER
	Else
		For $i = 0 To $tThis.iIIDCnt - 1
			If _WinAPI_StringFromGUID($pIID) = _WinAPI_StringFromGUID(Ptr(DllStructGetPtr($tThis, "iIIDCnt") + 4 + ($i * 16))) Then
				DllStructSetData(DllStructCreate("ptr", $ppObj), 1, $pThis)
				__AddRef($pThis)
				ExitLoop
			EndIf
		Next
		If $i = $tThis.iIIDCnt Then $hResult = $E_NOINTERFACE

	EndIf
	Return $hResult
EndFunc   ;==>__QueryInterface

Func __Release($pThis)
	Local $tThis = DllStructCreate("align 4;ptr pVTab;int iRefCnt", $pThis)
	$tThis.iRefCnt -= 1
	Return $tThis.iRefCnt
EndFunc   ;==>__Release

Func __WinRT_AddHandler($pThis, $iVTableIdx, $pHandler)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If (Not $pHandler) Or Not (IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pHandler, "int64*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>__WinRT_AddHandler

Func __WinRT_AddReverseMappings(ByRef $mMap)
	If Not IsMap($mMap) Then Return
	Local $aKeys = MapKeys($mMap), $vKey
	For $i = 0 To UBound($aKeys) - 1
		$vKey = $aKeys[$i]
		$mMap[String($mMap[$vKey])] = $vKey
	Next
EndFunc   ;==>__WinRT_AddReverseMappings

Func __WinRT_FreeMem($pTask)
	If (Not $pTask) Or (Not IsPtr($pTask)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, "")
	DllCall($__g_hDLLOle32, "none", "CoTaskMemFree", "ptr", $pTask)
EndFunc   ;==>__WinRT_FreeMem

Func __WinRT_GetDllError($iError = @error)
	Switch $iError
		Case 0
			$iError = $ERROR_SUCCESS
		Case 1
			$iError = $ERROR_DLL_INIT_FAILED
		Case Else
			$iError = $ERROR_INVALID_PARAMETER
	EndSwitch
	Return $iError
EndFunc   ;==>__WinRT_GetDllError

Func __WinRT_GetFuncAddress($pThis, $iIndex)
	Local Const $PTR_LEN = @AutoItX64 ? 8 : 4
	$iIndex -= 1
	If IsInt($pThis) Then $pThis = Ptr($pThis)
	If (Not $pThis) Or (Not IsPtr($pThis)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	If ($iIndex < 0) Or (Not IsInt($iIndex)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	Local $pVTable = __WinRT_GetPtrAt($pThis)
	Return __WinRT_GetPtrAt($pVTable + ($iIndex * $PTR_LEN))
EndFunc   ;==>__WinRT_GetFuncAddress

Func __WinRT_GetProperty_Bool($pThis, $iVTableIdx)
	Local $vFailVal
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[2] = True))
EndFunc   ;==>__WinRT_GetProperty_Bool

Func __WinRT_GetProperty_HString($pThis, $iVTableIdx)
	Local $vFailVal = ""
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $sString = _WinRT_ReadHString($aCall[2])
	Local $iError = @error
	_WinRT_DeleteHString($aCall[2])
	If $iError Then Return SetError($iError, 0, $vFailVal)
	Return SetError($aCall[0], 0, $sString)
EndFunc   ;==>__WinRT_GetProperty_HString

Func __WinRT_GetProperty_Number($pThis, $iVTableIdx, $sDataType)
	Local $vFailVal = 0
	Switch $sDataType
		Case "int", "long", "float"
			$vFailVal = 0
		Case "uint", "ulong", "dword"
			$vFailVal = -1
		Case "int64", "double"
			$vFailVal = Int(0, $NUMBER_64BIT)
		Case "uint64"
			$vFailVal = Int(-1, $NUMBER_64BIT)
		Case "ptr", "handle", "hwnd"
			$vFailVal = Ptr(0)
		Case "bool"
			$vFailVal = Null
		Case Else
			Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndSwitch
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType & "*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>__WinRT_GetProperty_Number

Func __WinRT_GetProperty_Ptr($pThis, $iVTableIdx)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>__WinRT_GetProperty_Ptr

Func __WinRT_GetProperty_Struct($pThis, $iVTableIdx, ByRef $tStruct)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tStruct)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_GetProperty_Struct

Func __WinRT_GetPtrAt($pPtr)
	If (Not $pPtr) Or (Not IsPtr($pPtr)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	Local $tPtr = DllStructCreate("ptr", $pPtr)
	Return DllStructGetData($tPtr, 1)
EndFunc   ;==>__WinRT_GetPtrAt

Func __WinRT_ParseTypeName($sTypeName)
	Local Const $PTR_LEN = @AutoItX64 ? 8 : 4
	Local $aCall, $hsTypeName, $iError
	$hsTypeName = _WinRT_CreateHString($sTypeName)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	$aCall = DllCall($__g_hDLLWinTypes, "long", "RoParseTypeName", "handle", $hsTypeName, "dword*", 0, "ptr*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsTypeName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, Ptr(0))
	Local $asParsedTypeNames[$aCall[2]]
	Local $pHString = $aCall[3], $hsElement
	For $i = 0 To $aCall[2] - 1
		$hsElement = __WinRT_GetPtrAt($pHString)
		$asParsedTypeNames[$i] = _WinRT_ReadHString($hsElement)
		$pHString += $PTR_LEN
	Next
	__WinRT_FreeMem($aCall[3])
	Return SetError($aCall[0], $aCall[2], $asParsedTypeNames)
EndFunc   ;==>__WinRT_ParseTypeName

Func __WinRT_RemoveHandler($pThis, $iVTableIdx, $iToken)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If (Not $iToken) Or Not (IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "int64", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_RemoveHandler

Func __WinRT_SetProperty_Bool($pThis, $iVTableIdx, $bValue)
	Local $vFailVal
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool", ($bValue = True))
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Bool

Func __WinRT_SetProperty_HString($pThis, $iVTableIdx, $sValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $hsString = _WinRT_CreateHString($sValue)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hsString)
	Local $iError = @error
	_WinRT_DeleteHString($hsString)
	If $iError Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_HString

Func __WinRT_SetProperty_Number($pThis, $iVTableIdx, $sDataType, $iValue)
	Local $vFailVal = False
	Switch $sDataType
		Case "int", "long", "float"
			$vFailVal = 0
		Case "uint", "ulong", "dword"
			$vFailVal = -1
		Case "int64", "double"
			$vFailVal = Int(0, $NUMBER_64BIT)
		Case "uint64"
			$vFailVal = Int(-1, $NUMBER_64BIT)
		Case "ptr", "handle", "hwnd"
			$vFailVal = Ptr(0)
		Case "bool"
			$vFailVal = Null
		Case Else
			Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndSwitch
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType, $iValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Number

Func __WinRT_SetProperty_Ptr($pThis, $iVTableIdx, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Ptr

Func __WinRT_SetProperty_Struct($pThis, $iVTableIdx, ByRef $tStruct)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If (Not IsDllStruct($tStruct)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tStruct)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Struct

Func _MetaData_CloseEnum($pScope, ByRef $pEnum)
	Local $bSuccess = IMetaDataImport_CloseEnum($pScope, $pEnum)
	Return SetError(@error, @extended, $bSuccess)
EndFunc   ;==>_MetaData_CloseEnum

Func _MetaData_CountEnum($pScope, ByRef $pEnum)
	Local $iCount = IMetaDataImport_CountEnum($pScope, $pEnum)
	Return SetError(@error, @extended, $iCount)
EndFunc   ;==>_MetaData_CountEnum

Func _MetaData_DecodeFieldSig($pScope, $dSig)
	Local $vFailVal[0], $aParams[1][2]
	Local $iReadPtr = 1
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	$iReadPtr += 1 ;First byte is always 0x06
	$aParams[0][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
	$aParams[0][0] = @extended
	Return $aParams
EndFunc   ;==>_MetaData_DecodeFieldSig

Func _MetaData_DecodeMethodDefSig($pScope, $dSig)
	Local $vFailVal[0]
	Local $iReadPtr = 1 ;, $bHasThis, $bExplicitThis
	;Local $iCallConv, $iGenParamCount
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	;Local $iByte1 = Int(BinaryMid($dSig, $iRdPtr, 1))
	$iReadPtr += 1
	;If BitAND($iByte1, 0x20) Then $bHasThis = True
	;If BitAND($iByte1, 0x40) Then $bExplicitThis = True
	;$iCallConv = BitAND($iByte1, 0x1F)
	;If $iCallConv = 0x10 Then $iGenParamCount = __MetaData_ReadCompressedInt($dSig, $iRdPtr, False)
	Local $iParamCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
	Local $aParams[$iParamCount + 1][2]
	For $i = 0 To UBound($aParams) - 1
		$aParams[$i][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
		$aParams[$i][0] = @extended
	Next

	Return $aParams
EndFunc   ;==>_MetaData_DecodeMethodDefSig

Func _MetaData_DecodePropertySig($pScope, $dSig)
	Local $vFailVal[0]
	Local $iReadPtr = 1 ;, $bHasThis
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	;Local $iByte1 = Int(BinaryMid($dSig, $iRdPtr, 1))
	$iReadPtr += 1 ;Fist byte is always 0x08 or 0x28 (HASTHIS|PROPERTY)
	;If BitAND($iByte1, 0x20) Then $bHasThis = True
	Local $iParamCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
	Local $aParams[$iParamCount + 1][2]
	For $i = 0 To UBound($aParams) - 1
		$aParams[$i][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
		$aParams[$i][0] = @extended
	Next
	Return $aParams
EndFunc   ;==>_MetaData_DecodePropertySig

Func _MetaData_DecodeTypeSpec($pScope, $dBlob)
	Local $vFailVal = Binary("0x")
	If (Not IsBinary($dBlob)) Or (Not BinaryLen($dBlob)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iReadPtr = 1
	Local $sType = __MetaData_ReadSigDataType($pScope, $dBlob, $iReadPtr)
	Return SetError(@error, @extended, $sType)
EndFunc   ;==>_MetaData_DecodeTypeSpec

Func _MetaData_EnumCustomAttributes($pScope, ByRef $pEnum, $iToken, $iTokenType = 0, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumCustomAttributes($pScope, $pEnum, $iToken, $iTokenType, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumCustomAttributes($pScope, $pEnum, $iToken, $iTokenType, $iMaxTokens)
		If @error Then Return SetError($S_False, 0, $aTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumCustomAttributes

Func _MetaData_EnumFields($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumFields($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumFields($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumFields

Func _MetaData_EnumGenericParamConstraints($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport2_EnumGenericParamConstraints($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport2_EnumGenericParamConstraints($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumGenericParamConstraints

Func _MetaData_EnumGenericParams($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport2_EnumGenericParams($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport2_EnumGenericParams($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumGenericParams

Func _MetaData_EnumInterfaceImpls($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumInterfaceImpls($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumInterfaceImpls($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumInterfaceImpls

Func _MetaData_EnumMethodImpls($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aBodyTkns, $aDeclTkns, $vFailVal[0]
	IMetaDataImport_EnumMethodImpls($pScope, $pEnum, $iTypeDefTkn, $aBodyTkns, $aDeclTkns, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $vFailVal)
		IMetaDataImport_EnumMethodImpls($pScope, $pEnum, $iTypeDefTkn, $aBodyTkns, $aDeclTkns, $iMaxTokens)
		If @error Then Return SetError($S_False, 0, $vFailVal)
	EndIf
	Local $aTokens[UBound($aBodyTkns)][2]
	For $i = 0 To UBound($aBodyTkns) - 1
		$aTokens[$i][0] = $aBodyTkns[$i]
		$aTokens[$i][1] = $aDeclTkns[$i]
	Next
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethodImpls

Func _MetaData_EnumMethods($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumMethods($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumMethods($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethods

Func _MetaData_EnumMethodSpecs($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport2_EnumMethodSpecs($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport2_EnumMethodSpecs($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethodSpecs

Func _MetaData_EnumModuleRefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumModuleRefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumModuleRefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumModuleRefs

Func _MetaData_EnumParams($pScope, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumParams($pScope, $pEnum, $iMethodDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumParams($pScope, $pEnum, $iMethodDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumParams

Func _MetaData_EnumProperties($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumProperties($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumProperties($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumProperties

Func _MetaData_EnumTypeDefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeDefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeDefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumTypeDefs

Func _MetaData_EnumTypeRefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeRefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeRefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumTypeRefs

Func _MetaData_EnumTypeSpecs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeSpecs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeSpecs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumTypeSpecs

Func _MetaData_FindMember($pScope, $sName, $dSig = 0)
	Local $iMemberTkn = -1
	SetError($ERROR_INVALID_PARAMETER)
	If _MetaData_IsTypeDefTkn Then
		$iMemberTkn = IMetaDataImport_FindMember($pScope, $sName, $dSig)
	ElseIf _MetaData_IsTypeRefTkn Then
		$iMemberTkn = IMetaDataImport_FindMemberRef($pScope, $sName, $dSig)
	EndIf
	Return SetError(@error, @extended, $iMemberTkn)
EndFunc   ;==>_MetaData_FindMember

Func _MetaData_FindTypeDef($pScope, $sName, $iEncClassTkn = 0)
	Local $iTypeDefTkn = IMetaDataImport_FindTypeDefByName($pScope, $sName, $iEncClassTkn)
	Return SetError(@error, @extended, $iTypeDefTkn)
EndFunc   ;==>_MetaData_FindTypeDef

Func _MetaData_FindTypeRef($pScope, $sName, $iResScopeTkn = Default)
	If $iResScopeTkn = Default Then
		$iResScopeTkn = IMetaDataImport_GetModuleFromScope($pScope)
		If @error Then SetError(@error, @extended, $iResScopeTkn)
	EndIf
	Local $iTypeRefTkn = IMetaDataImport_FindTypeRef($pScope, $iResScopeTkn, $sName)
	Return SetError(@error, @extended, $iTypeRefTkn)
EndFunc   ;==>_MetaData_FindTypeRef

Func _MetaData_GetActivatableAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ActivatableAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $iPlatformStrLen = Int(BinaryMid($dAttrib, 8 + $iTypeStrLen, 1))
	Local $tStatic = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong;char;char[%d]", $iTypeStrLen, $iPlatformStrLen), DllStructGetPtr($tBuff))
	Local $aProps[3] = [DllStructGetData($tStatic, 3), DllStructGetData($tStatic, 4), DllStructGetData($tStatic, 6)]
	Return $aProps
EndFunc   ;==>_MetaData_GetActivatableAttrib

Func _MetaData_GetComposableAttibuteType($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ComposableAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Return __MetaData_ReadSerString($tBuff, 2) ;DllStructGetData($tType, 3)
EndFunc   ;==>_MetaData_GetComposableAttibuteType

Func _MetaData_GetContractVersionAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ContractVersionAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iContractStrLen = Int(BinaryMid($dAttrib, 3, 1)) ;Cheating here - String is UTF8
	Local $tContractVers = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong", $iContractStrLen), DllStructGetPtr($tBuff))
	Local $aProps[2] = [DllStructGetData($tContractVers, 3), DllStructGetData($tContractVers, 4)]
	Return $aProps
EndFunc   ;==>_MetaData_GetContractVersionAttrib

Func _MetaData_GetCustomAttributeByName($pScope, $iToken, $sName)
	Local $dBlob = IMetaDataImport_GetCustomAttributeByName($pScope, $iToken, $sName)
	Return SetError(@error, @extended, $dBlob)
EndFunc   ;==>_MetaData_GetCustomAttributeByName

Func _MetaData_GetCustomAttributeProps($pScope, $iCustomAttribTkn)
	Local $iObjectTkn, $iTypeTkn, $dValue
	IMetaDataImport_GetCustomAttributeProps($pScope, $iCustomAttribTkn, $iObjectTkn, $iTypeTkn, $dValue)
	Local $aProps[] = [$iObjectTkn, $iTypeTkn, $dValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetCustomAttributeProps

Func _MetaData_GetDeprecatedAttribute($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.DeprecatedAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $aProps[4]
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	Local $pBuff = DllStructGetPtr($tBuff)
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iOffset = 2, $tProps ;, $tWStr
	$aProps[0] = __MetaData_ReadSerString($tBuff, $iOffset)
	$iOffset += @extended
	$tProps = DllStructCreate("align 2;ulong;uint", Ptr($pBuff + $iOffset))
	$aProps[1] = DllStructGetData($tProps, 1) ;Deprection Type
	$aProps[2] = DllStructGetData($tProps, 2) ;Version
	$iOffset += 8
	$aProps[3] = __MetaData_ReadSerString($tBuff, $iOffset)

	Return $aProps
EndFunc   ;==>_MetaData_GetDeprecatedAttribute

Func _MetaData_GetDispenser()
	Local $aCall, $tCLSID, $tIID, $vFailVal = Ptr(0)
	$tCLSID = _WinAPI_GUIDFromString($sCLSID_CorMetaDataDispenser)
	If Not @error Then $tIID = _WinAPI_GUIDFromString($sIID_IMetaDataDispenser)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	$aCall = DllCall($__g_hDLLRoMetaData, "long", "MetaDataGetDispenser", "struct*", $tCLSID, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_MetaData_GetDispenser

Func _MetaData_GetExcusiveToAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ExclusiveToAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Return __MetaData_ReadSerString($tBuff, 2)
EndFunc   ;==>_MetaData_GetExcusiveToAttrib

Func _MetaData_GetFieldProps($pScope, $iFieldDefTkn)
	Local $iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue
	IMetaDataImport_GetFieldProps($pScope, $iFieldDefTkn, $iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue)
	Local $aProps[] = [$iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetFieldProps

Func _MetaData_GetGenericParamProps($pScope, $iGenericParamTkn)
	Local $iParamSeq, $iParamFlags, $iOwnerTkn, $sName
	IMetaDataImport2_GetGenericParamProps($pScope, $iGenericParamTkn, $iParamSeq, $iParamFlags, $iOwnerTkn, $sName)
	Local $aProps[] = [$iParamSeq, $iParamFlags, $iOwnerTkn, $sName]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetGenericParamProps

Func _MetaData_GetGUIDAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.GuidAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Return _WinAPI_StringFromGUID(Ptr(DllStructGetPtr($tBuff) + 2))
EndFunc   ;==>_MetaData_GetGUIDAttrib

Func _MetaData_GetInterfaceImplsProps($pScope, $iInterfaceImplTkn)
	Local $iClassToken, $iIfaceToken
	IMetaDataImport_GetInterfaceImplProps($pScope, $iInterfaceImplTkn, $iClassToken, $iIfaceToken)
	Local $aProps[] = [$iClassToken, $iIfaceToken]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetInterfaceImplsProps

Func _MetaData_GetMarshalingBehaviorAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.MarshalingBehaviorAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Return Int(BinaryMid($dAttrib, 3, 4))
EndFunc   ;==>_MetaData_GetMarshalingBehaviorAttrib

Func _MetaData_GetMemberRefProps($pScope, $iMemberRefTkn)
	Local $iTypeTkn, $sMemberName, $dSignature
	IMetaDataImport_GetMemberRefProps($pScope, $iMemberRefTkn, $iTypeTkn, $sMemberName, $dSignature)
	Local $aProps[] = [$iTypeTkn, $sMemberName, $dSignature]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetMemberRefProps

Func _MetaData_GetMetaDataFile($sClassID)
	Local $sFilePath, $pIMetaDataImport2, $iTypeDefTkn
	_WinRT_GetMetaDataFile($sClassID, 0, $sFilePath, $pIMetaDataImport2, $iTypeDefTkn)
	If @error Then Return SetError(@error, @extended, "")
	IUnknown_Release($pIMetaDataImport2)
	Return SetExtended($iTypeDefTkn, $sFilePath)
EndFunc   ;==>_MetaData_GetMetaDataFile

Func _MetaData_GetMethodProps($pScope, $iMethodDefTkn)
	Local $iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags
	IMetaDataImport_GetMethodProps($pScope, $iMethodDefTkn, $iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags)
	Local $aProps[] = [$iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetMethodProps

Func _MetaData_GetMethodSemantics($pScope, $iMethodDefTkn, $iEventPropTkn)
	Local $iMethodSemanticsTkn = IMetaDataImport_GetMethodSemantics($pScope, $iMethodDefTkn, $iEventPropTkn)
	Return SetError(@error, @extended, $iMethodSemanticsTkn)
EndFunc   ;==>_MetaData_GetMethodSemantics

Func _MetaData_GetNestedClassProps($pScope, $iTypeDefTkn)
	Local $iEnclTypeDefTkn = IMetaDataImport_GetNestedClassProps($pScope, $iTypeDefTkn)
	Return SetError(@error, @extended, $iEnclTypeDefTkn)
EndFunc   ;==>_MetaData_GetNestedClassProps

Func _MetaData_GetParamForMethodIndex($pScope, $iMethodDefTkn, $iSequence)
	Local $iParamTkn = IMetaDataImport_GetParamForMethodIndex($pScope, $iMethodDefTkn, $iSequence)
	Return SetError(@error, @extended, $iParamTkn)
EndFunc   ;==>_MetaData_GetParamForMethodIndex

Func _MetaData_GetParamProps($pScope, $iParamDefTkn)
	Local $iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue
	IMetaDataImport_GetParamProps($pScope, $iParamDefTkn, $iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue)
	Local $aProps[] = [$iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetParamProps

Func _MetaData_GetPropertyProps($pScope, $iPropertyDefTkn)
	Local $iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther, $iMaxOtherMethods = 10
	IMetaDataImport_GetPropertyProps($pScope, $iPropertyDefTkn, $iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther, $iMaxOtherMethods)
	Local $aProps[] = [$iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetPropertyProps

Func _MetaData_GetScopeProps($pScope)
	Local $sName, $sVersionGUID
	IMetaDataImport_GetScopeProps($pScope, $sName, $sVersionGUID)
	Local $aProps[] = [$sName, $sVersionGUID]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetScopeProps

Func _MetaData_GetStaticAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.StaticAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $iContractStrLen = Int(BinaryMid($dAttrib, 8 + $iTypeStrLen, 1))
	Local $tStatic = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong;char;char[%d]", $iTypeStrLen, $iContractStrLen), DllStructGetPtr($tBuff))
	Local $aProps[3] = [DllStructGetData($tStatic, 3), DllStructGetData($tStatic, 4), DllStructGetData($tStatic, 6)]
	Return $aProps
EndFunc   ;==>_MetaData_GetStaticAttrib

Func _MetaData_GetStaticAttribNames($pScope, $iToken)
	Local $pEnum, $aAttrib, $aAttribProps, $aMemRefProps
	If @error Then Return SetError(@error, @extended, "")
	Local $aNames[0], $iCnt, $dAttrib, $tBuff
	While 1
		$aAttrib = _MetaData_EnumCustomAttributes($pScope, $pEnum, $iToken, 0)
		If @error Then ExitLoop
		$aAttribProps = _MetaData_GetCustomAttributeProps($pScope, $aAttrib[0])
		If Not @error Then $aMemRefProps = _MetaData_GetMemberRefProps($pScope, $aAttribProps[1])
		If @error Then ContinueLoop
		If _MetaData_GetTokenName($pScope, $aMemRefProps[0]) <> "Windows.Foundation.Metadata.StaticAttribute" Then ContinueLoop
		$dAttrib = $aAttribProps[2]
		$tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
		DllStructSetData($tBuff, 1, $dAttrib)
		ReDim $aNames[$iCnt + 1]
		$aNames[$iCnt] = __MetaData_ReadSerString($tBuff, 2)
		$iCnt += 1
	WEnd
	_MetaData_CloseEnum($pScope, $pEnum)
	Return $aNames
EndFunc   ;==>_MetaData_GetStaticAttribNames

Func _MetaData_GetThreadingAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ThreadingAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Return Int(BinaryMid($dAttrib, 3, 4))
EndFunc   ;==>_MetaData_GetThreadingAttrib

Func _MetaData_GetTokenName($pScope, $iToken)
	Local $aProps, $vFailVal = ""
	Switch BitAND($iToken, 0xFF000000)
		Case $MDT_TypeDef
			$aProps = _MetaData_GetTypeDefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[0])
		Case $MDT_TypeRef
			$aProps = _MetaData_GetTypeRefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_Property
			$aProps = _MetaData_GetPropertyProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_MethodDef
			$aProps = _MetaData_GetMethodProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_FieldDef
			$aProps = _MetaData_GetFieldProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_ParamDef
			$aProps = _MetaData_GetParamProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[2])
		Case $MDT_MemberRef
			$aProps = _MetaData_GetMemberRefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_GenericParam
			$aProps = _MetaData_GetGenericParamProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[3])

	EndSwitch
EndFunc   ;==>_MetaData_GetTokenName

Func _MetaData_GetTypeDefProps($pScope, $iTypeDefTkn)
	Local $sTypeName, $iFlags, $iExtendsTkn
	IMetaDataImport_GetTypeDefProps($pScope, $iTypeDefTkn, $sTypeName, $iFlags, $iExtendsTkn)
	Local $aProps[] = [$sTypeName, $iFlags, $iExtendsTkn]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetTypeDefProps

Func _MetaData_GetTypeRefProps($pScope, $iTypeRefTkn)
	Local $iResScopeTkn, $sTypeName
	IMetaDataImport_GetTypeRefProps($pScope, $iTypeRefTkn, $iResScopeTkn, $sTypeName)
	Local $aProps[] = [$iResScopeTkn, $sTypeName]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetTypeRefProps

Func _MetaData_GetTypeSpecFromToken($pScope, $iTypeSpecTkn)
	Local $dBlob = IMetaDataImport_GetTypeSpecFromToken($pScope, $iTypeSpecTkn)
	Return SetError(@error, @extended, $dBlob)
EndFunc   ;==>_MetaData_GetTypeSpecFromToken

Func _MetaData_GetVersionString($pScope)
	Local $sRet = IMetaDataImport2_GetVersionString($pScope)
	Return SetError(@error, @extended, $sRet)
EndFunc   ;==>_MetaData_GetVersionString

Func _MetaData_IsAssemblyTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Assembly)
EndFunc   ;==>_MetaData_IsAssemblyTkn

Func _MetaData_IsFieldDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_FieldDef)
EndFunc   ;==>_MetaData_IsFieldDefTkn

Func _MetaData_IsMethodDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_MethodDef)
EndFunc   ;==>_MetaData_IsMethodDefTkn

Func _MetaData_IsModuleTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Module)
EndFunc   ;==>_MetaData_IsModuleTkn

Func _MetaData_IsPropertyTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Property)
EndFunc   ;==>_MetaData_IsPropertyTkn

Func _MetaData_IsTypeDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeDef)
EndFunc   ;==>_MetaData_IsTypeDefTkn

Func _MetaData_IsTypeRefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeRef)
EndFunc   ;==>_MetaData_IsTypeRefTkn

Func _MetaData_IsTypeSpecTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeSpec)
EndFunc   ;==>_MetaData_IsTypeSpecTkn

Func _MetaData_OpenScope($pDispenser, $sMetaDataFile)
	Local $pIface = IMetaDataDispenser_OpenScope($pDispenser, $sMetaDataFile, $CorOpenFlg_ofRead, $sIID_IMetaDataImport)
	Return SetError(@error, @extended, $pIface)
EndFunc   ;==>_MetaData_OpenScope

Func _MetaData_OpenScopeFromName($sClassID)
	Local $sFilePath, $pIMetaDataImport2, $iTypeDefTkn
	_WinRT_GetMetaDataFile($sClassID, 0, $sFilePath, $pIMetaDataImport2, $iTypeDefTkn)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	Return SetExtended($iTypeDefTkn, $pIMetaDataImport2)
EndFunc   ;==>_MetaData_OpenScopeFromName

Func _MetaData_ResetEnum($pScope, $pEnum, $iPos)
	Local $bSuccess = IMetaDataImport_ResetEnum($pScope, $pEnum, $iPos)
	Return SetError(@error, @extended, $bSuccess)
EndFunc   ;==>_MetaData_ResetEnum

Func _WinRT_ActivateInstance($sClassID)
	Local $aCall, $hsClassID, $iError
	$hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	$aCall = DllCall($__g_hDLLComBase, "long", "RoActivateInstance", "handle", $hsClassID, "ptr*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>_WinRT_ActivateInstance

Func _WinRT_CreateDelegate($sFunction, $sType = "")
	Local $sIID_Delegate
	If $sType Then
		$sIID_Delegate = _WinRT_GetParameterizedTypeInstanceIID($sType)
		If @error Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	EndIf

	Local $hDelegate = DllCallbackRegister($sFunction, "none", "ptr;ptr;ptr")
	If @error Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))

	If Not $__g_hQueryInterface Then
		$__g_hQueryInterface = DllCallbackRegister("__QueryInterface", "long", "ptr;ptr;ptr")
		$__g_hAddRef = DllCallbackRegister("__AddRef", "long", "ptr")
		$__g_hRelease = DllCallbackRegister("__Release", "long", "ptr")
	EndIf

	Local $iDelegateId = UBound($__g_aDelegates)
	ReDim $__g_aDelegates[$iDelegateId + 1][4]
	$__g_aDelegates[0][0] += 1

	Local $tVTab = DllStructCreate("ptr pFunc[4]")
	$tVTab.pFunc(1) = DllCallbackGetPtr($__g_hQueryInterface)
	$tVTab.pFunc(2) = DllCallbackGetPtr($__g_hAddRef)
	$tVTab.pFunc(3) = DllCallbackGetPtr($__g_hRelease)
	$tVTab.pFunc(4) = DllCallbackGetPtr($hDelegate)

	Local $tagDelegate = "align 4;ptr pVTab;int iRefCnt;int iIIDCnt;byte IID_IUnknown[16]"
	If $sIID_Delegate Then $tagDelegate &= ";byte IID_Delegate[16]"
	Local $tDelegate = DllStructCreate($tagDelegate)
	$tDelegate.pVTab = DllStructGetPtr($tVTab)
	$tDelegate.iRefCnt = 1
	$tDelegate.iIIDCnt = ($sIID_Delegate) ? 2 : 1
	_WinAPI_GUIDFromStringEx($sIID_IUnknown, DllStructGetPtr($tDelegate, "IID_IUnknown"))
	If $sIID_Delegate Then _WinAPI_GUIDFromStringEx($sIID_Delegate, DllStructGetPtr($tDelegate, "IID_Delegate"))
	Local $pDelegate = DllStructGetPtr($tDelegate)

	$__g_aDelegates[$iDelegateId][0] = $pDelegate
	$__g_aDelegates[$iDelegateId][1] = $tDelegate
	$__g_aDelegates[$iDelegateId][2] = $tVTab
	$__g_aDelegates[$iDelegateId][3] = $hDelegate

	Return $pDelegate
EndFunc   ;==>_WinRT_CreateDelegate

Func _WinRT_CreateHString($sString)
	Local $aCall = DllCall($__g_hDLLComBase, "long", "WindowsCreateString", "wstr", $sString, "uint", StringLen($sString), "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_WinRT_CreateHString

Func _WinRT_CreateMetaDataLocator()
	$__g_hIRoMetaDataLocator_Locate = DllCallbackRegister("__IRoMetaDataLocator_Locate", "long", "ptr;ptr;ptr")
	$__g_tMetaDataLocator_VTab = DllStructCreate("ptr locate")
	DllStructSetData($__g_tMetaDataLocator_VTab, 1, DllCallbackGetPtr($__g_hIRoMetaDataLocator_Locate))
	$__g_tMetaDataLocator = DllStructCreate("ptr vtab")
	DllStructSetData($__g_tMetaDataLocator, 1, DllStructGetPtr($__g_tMetaDataLocator_VTab))
	$__g_pMetaDataLocator = DllStructGetPtr($__g_tMetaDataLocator)
EndFunc   ;==>_WinRT_CreateMetaDataLocator

Func _WinRT_DeleteHString(ByRef $hString)
	Local $aCall = DllCall($__g_hDLLComBase, "long", "WindowsDeleteString", "ptr", $hString)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, Ptr(0))
	$hString = 0
	Return SetError($aCall[0], 0, $aCall[0] = 0)
EndFunc   ;==>_WinRT_DeleteHString

Func _WinRT_DestroyDelegate($pDelegate)
	If Not $pDelegate Or Not IsPtr($pDelegate) Then Return SetError($ERROR_INVALID_PARAMETER, 0, False)
	For $i = 0 To UBound($__g_aDelegates) - 1
		If $__g_aDelegates[$i][0] = $pDelegate Then ExitLoop
	Next
	If $i = UBound($__g_aDelegates) Then Return SetError($ERROR_INVALID_PARAMETER, 0, False)

	DllCallbackFree($__g_aDelegates[$i][3])
	For $j = 0 To UBound($__g_aDelegates, 2) - 1
		$__g_aDelegates[$i][$j] = 0
	Next
	$__g_aDelegates[0][0] -= 1

	If Not $__g_aDelegates[0][0] Then
		DllCallbackFree($__g_hQueryInterface)
		DllCallbackFree($__g_hAddRef)
		DllCallbackFree($__g_hRelease)
		$__g_hQueryInterface = 0
		$__g_hAddRef = 0
		$__g_hRelease = 0
	EndIf
EndFunc   ;==>_WinRT_DestroyDelegate

Func _WinRT_DestroyMetaDataLocator()
	$__g_pMetaDataLocator = 0
	$__g_tMetaDataLocator = 0
	$__g_tMetaDataLocator_VTab = 0
	DllCallbackFree($__g_hIRoMetaDataLocator_Locate)
EndFunc   ;==>_WinRT_DestroyMetaDataLocator

Func _WinRT_GetActivationFactory($sClassID, $sIID)
	Local $aCall, $hsClassID, $tIID, $iError
	$tIID = _WinAPI_GUIDFromString($sIID)
	If Not @error Then $hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	$aCall = DllCall($__g_hDLLComBase, "long", "RoGetActivationFactory", "handle", $hsClassID, "struct*", $tIID, "ptr*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_WinRT_GetActivationFactory

Func _WinRT_GetEnum($mMap, $vKey)
	If Not IsMap($mMap) Then Return
	Return $mMap[String($vKey)]
EndFunc   ;==>_WinRT_GetEnum

Func _WinRT_GetMetaDataFile($sClassID, $pIMetaDataDispenserEx, ByRef $sFilePath, ByRef $pIMetaDataImport2, ByRef $iTypeDefTkn)
	Local $aCall, $hsClassID, $iError, $vFailVal = True
	$hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	$aCall = DllCall($__g_hDLLWinTypes, "long", "RoGetMetaDataFile", "handle", $hsClassID, "ptr", $pIMetaDataDispenserEx, "handle*", 0, "ptr*", 0, "ulong*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	$sFilePath = _WinRT_ReadHString($aCall[3])
	_WinRT_DeleteHString($aCall[3])
	$pIMetaDataImport2 = $aCall[4]
	$iTypeDefTkn = $aCall[5]
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>_WinRT_GetMetaDataFile

Func _WinRT_GetParameterizedTypeInstanceIID($sTypeName)
	Local $bDestroyLocator = False
	If Not $__g_pMetaDataLocator Then
		_WinRT_CreateMetaDataLocator()
		$bDestroyLocator = True
	EndIf

	Local $aCall, $tNameElements, $iNameElementCount

	Local $asTypeNames = __WinRT_ParseTypeName($sTypeName)
	$iNameElementCount = UBound($asTypeNames)

	Local $atNameBuffers[$iNameElementCount]
	$tNameElements = DllStructCreate(StringFormat("ptr[%d]", $iNameElementCount))

	For $i = 0 To $iNameElementCount - 1
		$atNameBuffers[$i] = DllStructCreate(StringFormat("wchar[%d]", StringLen($asTypeNames[$i]) + 1))
		DllStructSetData($atNameBuffers[$i], 1, $asTypeNames[$i])
		DllStructSetData($tNameElements, 1, DllStructGetPtr($atNameBuffers[$i]), $i + 1)
	Next

	Local $tIID = _WinAPI_GUIDFromString($sGUID_NULL)

	$aCall = DllCall($__g_hDLLComBase, "long", "RoGetParameterizedTypeInstanceIID", _
			"dword", $iNameElementCount, "struct*", $tNameElements, "ptr", $__g_pMetaDataLocator, "struct*", $tIID, "ptr*", 0)

	If $bDestroyLocator Then _WinRT_DestroyMetaDataLocator()

	Return SetError($aCall[0], 0, _WinAPI_StringFromGUID($tIID))
EndFunc   ;==>_WinRT_GetParameterizedTypeInstanceIID

Func _WinRT_ReadHString(ByRef $hString)
	Local $aCall = DllCall($__g_hDLLComBase, "wstr", "WindowsGetStringRawBuffer", "ptr", $hString, "int*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, "")
	Return SetExtended($aCall[1], $aCall[0])
EndFunc   ;==>_WinRT_ReadHString

Func _WinRT_Shutdown()
	DllClose($__g_hDLLComBase)
	DllClose($__g_hDLLOle32)
	DllClose($__g_hDLLRoMetaData)
	DllClose($__g_hDLLWinTypes)
EndFunc   ;==>_WinRT_Shutdown

Func _WinRT_Startup()
	$__g_hDLLComBase = DllOpen("Combase.dll")
	$__g_hDLLOle32 = DllOpen("Ole32.dll")
	$__g_hDLLRoMetaData = DllOpen("RoMetaData.dll")
	$__g_hDLLWinTypes = DllOpen("WinTypes.dll")
EndFunc   ;==>_WinRT_Startup

Func _WinRT_SwitchInterface(ByRef $pThis, $sIID)
	Local $pResult = IUnknown_QueryInterface($pThis, $sIID)
	If @error Then Return SetError(@error, @extended, $pResult)
	IUnknown_Release($pThis)
	$pThis = $pResult
EndFunc   ;==>_WinRT_SwitchInterface

Func _WinRT_WaitForAsync(ByRef $pAsync, $sDataType = "ptr*", $iTimeout = 500)
	Local $pAsyncInfo = IUnknown_QueryInterface($pAsync, $sIID_IAsyncInfo)
	If @error Then Return SetError(@error, @extended, -1)

	Local $hTimer = TimerInit()
	Local $iStatus, $iError, $vResult = Null
	Do
		$iStatus = IAsyncInfo_GetStatus($pAsyncInfo)
		If TimerDiff($hTimer) > $iTimeout Then ExitLoop
		Sleep(10)
	Until $iStatus <> _WinRT_GetEnum($mAsyncStatus, "Started")

	Switch $iStatus
		Case _WinRT_GetEnum($mAsyncStatus, "Started")
			$iStatus = -1
			$iError = $WAIT_TIMEOUT
		Case Else
			$iError = IAsyncInfo_GetErrorCode($pAsyncInfo)
	EndSwitch

	If $iStatus = _WinRT_GetEnum($mAsyncStatus, "Completed") Then
		_WinRT_SwitchInterface($pAsync, $sIID_IAsyncAction)
		If Not @error Then
			$vResult = ($iError = $S_OK)
		Else
			$vResult = IAsyncOperation_GetResults($pAsync, $sDataType)
			If @error Then $iError = @error
		EndIf
	EndIf
	IUnknown_Release($pAsyncInfo)
	IUnknown_Release($pAsync)

	Return SetError($iError, $iStatus, $vResult)
EndFunc   ;==>_WinRT_WaitForAsync

Func IAdaptiveMediaSource2_GetAdvancedSettings($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource2_GetAdvancedSettings

Func IAdaptiveMediaSource3_GetCorrelatedTimes($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IAdaptiveMediaSource3_GetCorrelatedTimes

Func IAdaptiveMediaSource3_GetDesiredSeekableWindowSize($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource3_GetDesiredSeekableWindowSize

Func IAdaptiveMediaSource3_GetDiagnostics($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource3_GetDiagnostics

Func IAdaptiveMediaSource3_GetMaxSeekableWindowSize($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource3_GetMaxSeekableWindowSize

Func IAdaptiveMediaSource3_GetMinLiveOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource3_GetMinLiveOffset

Func IAdaptiveMediaSource3_SetDesiredSeekableWindowSize($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource3_SetDesiredSeekableWindowSize

Func IAdaptiveMediaSource_AddHdlrDownloadBitrateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_AddHdlrDownloadBitrateChanged

Func IAdaptiveMediaSource_AddHdlrDownloadCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 29, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_AddHdlrDownloadCompleted

Func IAdaptiveMediaSource_AddHdlrDownloadFailed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 31, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_AddHdlrDownloadFailed

Func IAdaptiveMediaSource_AddHdlrDownloadRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 27, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_AddHdlrDownloadRequested

Func IAdaptiveMediaSource_AddHdlrPlaybackBitrateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_AddHdlrPlaybackBitrateChanged

Func IAdaptiveMediaSource_GetAudioOnlyPlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetAudioOnlyPlayback

Func IAdaptiveMediaSource_GetAvailableBitrates($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetAvailableBitrates

Func IAdaptiveMediaSource_GetCurrentDownloadBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetCurrentDownloadBitrate

Func IAdaptiveMediaSource_GetCurrentPlaybackBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 13, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetCurrentPlaybackBitrate

Func IAdaptiveMediaSource_GetDesiredLiveOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetDesiredLiveOffset

Func IAdaptiveMediaSource_GetDesiredMaxBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetDesiredMaxBitrate

Func IAdaptiveMediaSource_GetDesiredMinBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetDesiredMinBitrate

Func IAdaptiveMediaSource_GetInboundBitsPerSecond($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "uint64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetInboundBitsPerSecond

Func IAdaptiveMediaSource_GetInboundBitsPerSecondWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetInboundBitsPerSecondWindow

Func IAdaptiveMediaSource_GetInitialBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetInitialBitrate

Func IAdaptiveMediaSource_GetIsLive($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_GetIsLive

Func IAdaptiveMediaSource_RemoveHdlrDownloadBitrateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_RemoveHdlrDownloadBitrateChanged

Func IAdaptiveMediaSource_RemoveHdlrDownloadCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 30, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_RemoveHdlrDownloadCompleted

Func IAdaptiveMediaSource_RemoveHdlrDownloadFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 32, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_RemoveHdlrDownloadFailed

Func IAdaptiveMediaSource_RemoveHdlrDownloadRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 28, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_RemoveHdlrDownloadRequested

Func IAdaptiveMediaSource_RemoveHdlrPlaybackBitrateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_RemoveHdlrPlaybackBitrateChanged

Func IAdaptiveMediaSource_SetDesiredLiveOffset($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_SetDesiredLiveOffset

Func IAdaptiveMediaSource_SetDesiredMaxBitrate($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_SetDesiredMaxBitrate

Func IAdaptiveMediaSource_SetDesiredMinBitrate($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_SetDesiredMinBitrate

Func IAdaptiveMediaSource_SetInboundBitsPerSecondWindow($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_SetInboundBitsPerSecondWindow

Func IAdaptiveMediaSource_SetInitialBitrate($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSource_SetInitialBitrate

Func IAdaptiveMediaSourceAdvancedSettings_GetAllSegmentsIndependent($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_GetAllSegmentsIndependent

Func IAdaptiveMediaSourceAdvancedSettings_GetBitrateDowngradeTriggerRatio($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_GetBitrateDowngradeTriggerRatio

Func IAdaptiveMediaSourceAdvancedSettings_GetDesiredBitrateHeadroomRatio($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_GetDesiredBitrateHeadroomRatio

Func IAdaptiveMediaSourceAdvancedSettings_SetAllSegmentsIndependent($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_SetAllSegmentsIndependent

Func IAdaptiveMediaSourceAdvancedSettings_SetBitrateDowngradeTriggerRatio($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_SetBitrateDowngradeTriggerRatio

Func IAdaptiveMediaSourceAdvancedSettings_SetDesiredBitrateHeadroomRatio($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceAdvancedSettings_SetDesiredBitrateHeadroomRatio

Func IAdaptiveMediaSourceCorrelatedTimes_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCorrelatedTimes_GetPosition

Func IAdaptiveMediaSourceCorrelatedTimes_GetPresentationTimeStamp($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCorrelatedTimes_GetPresentationTimeStamp

Func IAdaptiveMediaSourceCorrelatedTimes_GetProgramDateTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCorrelatedTimes_GetProgramDateTime

Func IAdaptiveMediaSourceCreationResult2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCreationResult2_GetExtendedError

Func IAdaptiveMediaSourceCreationResult_GetHttpResponseMessage($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCreationResult_GetHttpResponseMessage

Func IAdaptiveMediaSourceCreationResult_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCreationResult_GetMediaSource

Func IAdaptiveMediaSourceCreationResult_GetStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceCreationResult_GetStatus

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_GetExtendedError

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceContentType

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceDuration

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetBitrate

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetDiagnosticType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetDiagnosticType

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetPosition

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetRequestId($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetRequestId

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceByteRangeLength

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceByteRangeOffset

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceType($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceType

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetResourceUri

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetSegmentId($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnosticAvailableEventArgs_GetSegmentId

Func IAdaptiveMediaSourceDiagnostics_AddHdlrDiagnosticAvailable($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnostics_AddHdlrDiagnosticAvailable

Func IAdaptiveMediaSourceDiagnostics_RemoveHdlrDiagnosticAvailable($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDiagnostics_RemoveHdlrDiagnosticAvailable

Func IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_GetReason($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_GetReason

Func IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetNewValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetNewValue

Func IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetOldValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetOldValue

Func IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetPosition

Func IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetRequestId($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetRequestId

Func IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetStatistics($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs2_GetStatistics

Func IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceContentType

Func IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceDuration

Func IAdaptiveMediaSourceDownloadCompletedEventArgs_GetHttpResponseMessage($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs_GetHttpResponseMessage

Func IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceByteRangeLength

Func IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceByteRangeOffset

Func IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceType

Func IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadCompletedEventArgs_GetResourceUri

Func IAdaptiveMediaSourceDownloadFailedEventArgs2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs2_GetExtendedError

Func IAdaptiveMediaSourceDownloadFailedEventArgs2_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs2_GetPosition

Func IAdaptiveMediaSourceDownloadFailedEventArgs2_GetRequestId($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs2_GetRequestId

Func IAdaptiveMediaSourceDownloadFailedEventArgs2_GetStatistics($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs2_GetStatistics

Func IAdaptiveMediaSourceDownloadFailedEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs3_GetResourceContentType

Func IAdaptiveMediaSourceDownloadFailedEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs3_GetResourceDuration

Func IAdaptiveMediaSourceDownloadFailedEventArgs_GetHttpResponseMessage($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs_GetHttpResponseMessage

Func IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceByteRangeLength

Func IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceByteRangeOffset

Func IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceType

Func IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadFailedEventArgs_GetResourceUri

Func IAdaptiveMediaSourceDownloadRequestedDeferral_Complete($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedDeferral_Complete

Func IAdaptiveMediaSourceDownloadRequestedEventArgs2_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs2_GetPosition

Func IAdaptiveMediaSourceDownloadRequestedEventArgs2_GetRequestId($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs2_GetRequestId

Func IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceContentType

Func IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceDuration

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetDeferral($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetDeferral

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceByteRangeLength

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceByteRangeOffset

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceType

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResourceUri

Func IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResult($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadRequestedEventArgs_GetResult

Func IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeLength

Func IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeOffset

Func IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeLength($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeLength

Func IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeOffset($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeOffset

Func IAdaptiveMediaSourceDownloadResult_GetBuffer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_GetBuffer

Func IAdaptiveMediaSourceDownloadResult_GetContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_GetContentType

Func IAdaptiveMediaSourceDownloadResult_GetExtendedStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_GetExtendedStatus

Func IAdaptiveMediaSourceDownloadResult_GetInputStream($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_GetInputStream

Func IAdaptiveMediaSourceDownloadResult_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_GetResourceUri

Func IAdaptiveMediaSourceDownloadResult_SetBuffer($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_SetBuffer

Func IAdaptiveMediaSourceDownloadResult_SetContentType($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 14, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_SetContentType

Func IAdaptiveMediaSourceDownloadResult_SetExtendedStatus($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_SetExtendedStatus

Func IAdaptiveMediaSourceDownloadResult_SetInputStream($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_SetInputStream

Func IAdaptiveMediaSourceDownloadResult_SetResourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadResult_SetResourceUri

Func IAdaptiveMediaSourceDownloadStatistics_GetContentBytesReceivedCount($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "uint64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadStatistics_GetContentBytesReceivedCount

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToFirstByteReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadStatistics_GetTimeToFirstByteReceived

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToHeadersReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadStatistics_GetTimeToHeadersReceived

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToLastByteReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourceDownloadStatistics_GetTimeToLastByteReceived

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetAudioOnly($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetAudioOnly

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetNewValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetNewValue

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetOldValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetOldValue

Func IAdaptiveMediaSourceStatics_CreateFromStreamAsync($pThis, $pStream, $pUri, $sContentType)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "ptr", $pUri, "handle", $hContentType, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IAdaptiveMediaSourceStatics_CreateFromStreamAsync

Func IAdaptiveMediaSourceStatics_CreateFromStreamAsync2($pThis, $pStream, $pUri, $sContentType, $pHttpClient)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	If $pHttpClient And IsInt($pHttpClient) Then $pHttpClient = Ptr($pHttpClient)
	If $pHttpClient And (Not IsPtr($pHttpClient)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "ptr", $pUri, "handle", $hContentType, "ptr", $pHttpClient, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[6])
EndFunc   ;==>IAdaptiveMediaSourceStatics_CreateFromStreamAsync2

Func IAdaptiveMediaSourceStatics_CreateFromUriAsync($pThis, $pUri)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IAdaptiveMediaSourceStatics_CreateFromUriAsync

Func IAdaptiveMediaSourceStatics_CreateFromUriAsync2($pThis, $pUri, $pHttpClient)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHttpClient And IsInt($pHttpClient) Then $pHttpClient = Ptr($pHttpClient)
	If $pHttpClient And (Not IsPtr($pHttpClient)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr", $pHttpClient, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IAdaptiveMediaSourceStatics_CreateFromUriAsync2

Func IAdaptiveMediaSourceStatics_IsContentTypeSupported($pThis, $sContentType)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hContentType, "bool*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IAdaptiveMediaSourceStatics_IsContentTypeSupported

Func IAnimationObject_PopulatePropertyInfo($pThis, $sPropertyName, $pPropertyInfo)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sPropertyName) And (Not IsString($sPropertyName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPropertyName = _WinRT_CreateHString($sPropertyName)
	If $pPropertyInfo And IsInt($pPropertyInfo) Then $pPropertyInfo = Ptr($pPropertyInfo)
	If $pPropertyInfo And (Not IsPtr($pPropertyInfo)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hPropertyName, "ptr", $pPropertyInfo)
	Local $iError = @error
	_WinRT_DeleteHString($hPropertyName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAnimationObject_PopulatePropertyInfo

Func IAsyncAction_GetCompleted($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAsyncAction_GetCompleted

Func IAsyncAction_GetResults($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAsyncAction_GetResults

Func IAsyncAction_SetCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAsyncAction_SetCompleted


Func IAsyncInfo_Cancel($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, (($aCall[0] = $S_OK) Or ($aCall[0] = $S_False)))
EndFunc   ;==>IAsyncInfo_Cancel

Func IAsyncInfo_Close($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, (($aCall[0] = $S_OK) Or ($aCall[0] = $S_False)))
EndFunc   ;==>IAsyncInfo_Close

Func IAsyncInfo_GetErrorCode($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 9, "long")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_GetErrorCode

Func IAsyncInfo_GetId($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_GetId

Func IAsyncInfo_GetStatus($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_GetStatus


Func IAsyncOperation_Completed($pThis)
	Local $pValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $pValue)
EndFunc   ;==>IAsyncOperation_Completed

Func IAsyncOperation_GetResults($pThis, $sDataType, $pData = Ptr(0))
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sDataType = "ptr" And (Not $pData) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType, $pData)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IAsyncOperation_GetResults

Func IAsyncOperation_SetCompleted($pThis, $pHandler)
	Local $vFailVal = False
	If (Not $pHandler) Or (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pHandler)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IAsyncOperation_SetCompleted

Func IAudioInputNode2_GetEmitter($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioInputNode2_GetEmitter

Func IAudioInputNode_AddOutgoingConnection($pThis, $pDestination)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioInputNode_AddOutgoingConnection

Func IAudioInputNode_AddOutgoingConnection2($pThis, $pDestination, $fGain)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($fGain) And (Not IsNumber($fGain)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination, "double", $fGain)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioInputNode_AddOutgoingConnection2

Func IAudioInputNode_GetOutgoingConnections($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioInputNode_GetOutgoingConnections

Func IAudioInputNode_RemoveOutgoingConnection($pThis, $pDestination)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioInputNode_RemoveOutgoingConnection

Func IAudioNode_DisableEffectsByDefinition($pThis, $pDefinition)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDefinition And IsInt($pDefinition) Then $pDefinition = Ptr($pDefinition)
	If $pDefinition And (Not IsPtr($pDefinition)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDefinition)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioNode_DisableEffectsByDefinition

Func IAudioNode_EnableEffectsByDefinition($pThis, $pDefinition)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 17)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDefinition And IsInt($pDefinition) Then $pDefinition = Ptr($pDefinition)
	If $pDefinition And (Not IsPtr($pDefinition)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDefinition)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioNode_EnableEffectsByDefinition

Func IAudioNode_GetConsumeInput($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_GetConsumeInput

Func IAudioNode_GetEffectDefinitions($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_GetEffectDefinitions

Func IAudioNode_GetEncodingProperties($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_GetEncodingProperties

Func IAudioNode_GetOutgoingGain($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_GetOutgoingGain

Func IAudioNode_Reset($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioNode_Reset

Func IAudioNode_SetConsumeInput($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_SetConsumeInput

Func IAudioNode_SetOutgoingGain($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IAudioNode_SetOutgoingGain

Func IAudioNode_Start($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioNode_Start

Func IAudioNode_Stop($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IAudioNode_Stop

Func IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromBackground($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromBackground

Func IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromForeground($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromForeground

Func IBackgroundMediaPlayerStatics_GetCurrent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IBackgroundMediaPlayerStatics_GetCurrent

Func IBackgroundMediaPlayerStatics_IsMediaPlaying($pThis)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IBackgroundMediaPlayerStatics_IsMediaPlaying

Func IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromBackground($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromBackground

Func IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromForeground($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromForeground

Func IBackgroundMediaPlayerStatics_SendMessageToBackground($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IBackgroundMediaPlayerStatics_SendMessageToBackground

Func IBackgroundMediaPlayerStatics_SendMessageToForeground($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IBackgroundMediaPlayerStatics_SendMessageToForeground

Func IBackgroundMediaPlayerStatics_Shutdown($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IBackgroundMediaPlayerStatics_Shutdown

Func IClosable_Close($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IClosable_Close

Func ICompositionSupportsSystemBackdrop_GetSystemBackdrop($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 0)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>ICompositionSupportsSystemBackdrop_GetSystemBackdrop

Func ICompositionSupportsSystemBackdrop_SetSystemBackdrop($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 1, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>ICompositionSupportsSystemBackdrop_SetSystemBackdrop

Func IControl2_GetIsTextScaleFactorEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl2_GetIsTextScaleFactorEnabled

Func IControl2_SetIsTextScaleFactorEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl2_SetIsTextScaleFactorEnabled

Func IControl3_GetUseSystemFocusVisuals($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl3_GetUseSystemFocusVisuals

Func IControl3_SetUseSystemFocusVisuals($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl3_SetUseSystemFocusVisuals

Func IControl4_AddHdlrFocusDisengaged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_AddHdlrFocusDisengaged

Func IControl4_AddHdlrFocusEngaged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_AddHdlrFocusEngaged

Func IControl4_GetElementSoundMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetElementSoundMode

Func IControl4_GetIsFocusEngaged($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetIsFocusEngaged

Func IControl4_GetIsFocusEngagementEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetIsFocusEngagementEnabled

Func IControl4_GetRequiresPointer($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetRequiresPointer

Func IControl4_GetXYFocusDown($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetXYFocusDown

Func IControl4_GetXYFocusLeft($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetXYFocusLeft

Func IControl4_GetXYFocusRight($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetXYFocusRight

Func IControl4_GetXYFocusUp($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_GetXYFocusUp

Func IControl4_RemoveFocusEngagement($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 27)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControl4_RemoveFocusEngagement

Func IControl4_RemoveHdlrFocusDisengaged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_RemoveHdlrFocusDisengaged

Func IControl4_RemoveHdlrFocusEngaged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_RemoveHdlrFocusEngaged

Func IControl4_SetElementSoundMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetElementSoundMode

Func IControl4_SetIsFocusEngaged($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetIsFocusEngaged

Func IControl4_SetIsFocusEngagementEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetIsFocusEngagementEnabled

Func IControl4_SetRequiresPointer($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetRequiresPointer

Func IControl4_SetXYFocusDown($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 20, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetXYFocusDown

Func IControl4_SetXYFocusLeft($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetXYFocusLeft

Func IControl4_SetXYFocusRight($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetXYFocusRight

Func IControl4_SetXYFocusUp($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl4_SetXYFocusUp

Func IControl5_GetDefaultStyleResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl5_GetDefaultStyleResourceUri

Func IControl5_SetDefaultStyleResourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl5_SetDefaultStyleResourceUri

Func IControl7_GetBackgroundSizing($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl7_GetBackgroundSizing

Func IControl7_GetCornerRadius($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 9, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IControl7_GetCornerRadius

Func IControl7_SetBackgroundSizing($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl7_SetBackgroundSizing

Func IControl7_SetCornerRadius($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 10, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl7_SetCornerRadius

Func IControl_AddHdlrIsEnabledChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_AddHdlrIsEnabledChanged

Func IControl_ApplyTemplate($pThis)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 46)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IControl_ApplyTemplate

Func IControl_Focus($pThis, $iValue)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 47)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iValue) And (Not IsInt($iValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iValue, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IControl_Focus

Func IControl_GetBackground($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetBackground

Func IControl_GetBorderBrush($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetBorderBrush

Func IControl_GetBorderThickness($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 39, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IControl_GetBorderThickness

Func IControl_GetCharacterSpacing($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 17, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetCharacterSpacing

Func IControl_GetFocusState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 43, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFocusState

Func IControl_GetFontFamily($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFontFamily

Func IControl_GetFontSize($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFontSize

Func IControl_GetFontStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFontStretch

Func IControl_GetFontStyle($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 13, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFontStyle

Func IControl_GetFontWeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "ushort")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetFontWeight

Func IControl_GetForeground($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetForeground

Func IControl_GetHorizontalContentAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 33, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetHorizontalContentAlignment

Func IControl_GetIsEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetIsEnabled

Func IControl_GetIsTabStop($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetIsTabStop

Func IControl_GetPadding($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 31, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IControl_GetPadding

Func IControl_GetTabIndex($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 25, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetTabIndex

Func IControl_GetTabNavigation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 27, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetTabNavigation

Func IControl_GetTemplate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetTemplate

Func IControl_GetVerticalContentAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 35, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_GetVerticalContentAlignment

Func IControl_RemoveHdlrIsEnabledChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_RemoveHdlrIsEnabledChanged

Func IControl_SetBackground($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 38, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetBackground

Func IControl_SetBorderBrush($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 42, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetBorderBrush

Func IControl_SetBorderThickness($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 40, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetBorderThickness

Func IControl_SetCharacterSpacing($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 18, "long", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetCharacterSpacing

Func IControl_SetFontFamily($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetFontFamily

Func IControl_SetFontSize($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetFontSize

Func IControl_SetFontStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetFontStretch

Func IControl_SetFontStyle($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 14, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetFontStyle

Func IControl_SetFontWeight($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "ushort", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetFontWeight

Func IControl_SetForeground($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 20, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetForeground

Func IControl_SetHorizontalContentAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 34, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetHorizontalContentAlignment

Func IControl_SetIsEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 24, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetIsEnabled

Func IControl_SetIsTabStop($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 22, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetIsTabStop

Func IControl_SetPadding($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 32, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetPadding

Func IControl_SetTabIndex($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 26, "long", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetTabIndex

Func IControl_SetTabNavigation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 28, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetTabNavigation

Func IControl_SetTemplate($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 30, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetTemplate

Func IControl_SetVerticalContentAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 36, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControl_SetVerticalContentAlignment

Func IControlFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IControlFactory_CreateInstance

Func IControlOverrides6_OnCharacterReceived($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides6_OnCharacterReceived

Func IControlOverrides6_OnPreviewKeyDown($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides6_OnPreviewKeyDown

Func IControlOverrides6_OnPreviewKeyUp($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides6_OnPreviewKeyUp

Func IControlOverrides_OnDoubleTapped($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnDoubleTapped

Func IControlOverrides_OnDragEnter($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 28)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnDragEnter

Func IControlOverrides_OnDragLeave($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 29)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnDragLeave

Func IControlOverrides_OnDragOver($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 30)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnDragOver

Func IControlOverrides_OnDrop($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 31)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnDrop

Func IControlOverrides_OnGotFocus($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 26)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnGotFocus

Func IControlOverrides_OnHolding($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 17)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnHolding

Func IControlOverrides_OnKeyDown($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 25)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnKeyDown

Func IControlOverrides_OnKeyUp($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 24)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnKeyUp

Func IControlOverrides_OnLostFocus($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 27)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnLostFocus

Func IControlOverrides_OnManipulationCompleted($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 23)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnManipulationCompleted

Func IControlOverrides_OnManipulationDelta($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 22)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnManipulationDelta

Func IControlOverrides_OnManipulationInertiaStarting($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 20)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnManipulationInertiaStarting

Func IControlOverrides_OnManipulationStarted($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 21)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnManipulationStarted

Func IControlOverrides_OnManipulationStarting($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 19)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnManipulationStarting

Func IControlOverrides_OnPointerCanceled($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerCanceled

Func IControlOverrides_OnPointerCaptureLost($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerCaptureLost

Func IControlOverrides_OnPointerEntered($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerEntered

Func IControlOverrides_OnPointerExited($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerExited

Func IControlOverrides_OnPointerMoved($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerMoved

Func IControlOverrides_OnPointerPressed($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerPressed

Func IControlOverrides_OnPointerReleased($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerReleased

Func IControlOverrides_OnPointerWheelChanged($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnPointerWheelChanged

Func IControlOverrides_OnRightTapped($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 18)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnRightTapped

Func IControlOverrides_OnTapped($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlOverrides_OnTapped

Func IControlProtected_GetDefaultStyleKey($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlProtected_GetDefaultStyleKey

Func IControlProtected_GetTemplateChild($pThis, $sChildName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sChildName) And (Not IsString($sChildName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hChildName = _WinRT_CreateHString($sChildName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hChildName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hChildName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IControlProtected_GetTemplateChild

Func IControlProtected_SetDefaultStyleKey($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlProtected_SetDefaultStyleKey

Func IControlStatics2_GetIsTextScaleFactorEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics2_GetIsTextScaleFactorEnabledProperty

Func IControlStatics3_GetIsTemplateFocusTarget($pThis, $pElement)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IControlStatics3_GetIsTemplateFocusTarget

Func IControlStatics3_GetIsTemplateFocusTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics3_GetIsTemplateFocusTargetProperty

Func IControlStatics3_GetUseSystemFocusVisualsProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics3_GetUseSystemFocusVisualsProperty

Func IControlStatics3_SetIsTemplateFocusTarget($pThis, $pElement, $bValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($bValue) And (Not IsBool($bValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "bool", $bValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlStatics3_SetIsTemplateFocusTarget

Func IControlStatics4_GetElementSoundModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetElementSoundModeProperty

Func IControlStatics4_GetIsFocusEngagedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetIsFocusEngagedProperty

Func IControlStatics4_GetIsFocusEngagementEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetIsFocusEngagementEnabledProperty

Func IControlStatics4_GetRequiresPointerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetRequiresPointerProperty

Func IControlStatics4_GetXYFocusDownProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetXYFocusDownProperty

Func IControlStatics4_GetXYFocusLeftProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetXYFocusLeftProperty

Func IControlStatics4_GetXYFocusRightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetXYFocusRightProperty

Func IControlStatics4_GetXYFocusUpProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics4_GetXYFocusUpProperty

Func IControlStatics5_GetDefaultStyleResourceUriProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics5_GetDefaultStyleResourceUriProperty

Func IControlStatics5_GetIsTemplateKeyTipTarget($pThis, $pElement)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IControlStatics5_GetIsTemplateKeyTipTarget

Func IControlStatics5_GetIsTemplateKeyTipTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics5_GetIsTemplateKeyTipTargetProperty

Func IControlStatics5_SetIsTemplateKeyTipTarget($pThis, $pElement, $bValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($bValue) And (Not IsBool($bValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "bool", $bValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IControlStatics5_SetIsTemplateKeyTipTarget

Func IControlStatics7_GetBackgroundSizingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics7_GetBackgroundSizingProperty

Func IControlStatics7_GetCornerRadiusProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics7_GetCornerRadiusProperty

Func IControlStatics_GetBackgroundProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetBackgroundProperty

Func IControlStatics_GetBorderBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetBorderBrushProperty

Func IControlStatics_GetBorderThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetBorderThicknessProperty

Func IControlStatics_GetCharacterSpacingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetCharacterSpacingProperty

Func IControlStatics_GetDefaultStyleKeyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetDefaultStyleKeyProperty

Func IControlStatics_GetFocusStateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFocusStateProperty

Func IControlStatics_GetFontFamilyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFontFamilyProperty

Func IControlStatics_GetFontSizeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFontSizeProperty

Func IControlStatics_GetFontStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFontStretchProperty

Func IControlStatics_GetFontStyleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFontStyleProperty

Func IControlStatics_GetFontWeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetFontWeightProperty

Func IControlStatics_GetForegroundProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetForegroundProperty

Func IControlStatics_GetHorizontalContentAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetHorizontalContentAlignmentProperty

Func IControlStatics_GetIsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetIsEnabledProperty

Func IControlStatics_GetIsTabStopProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetIsTabStopProperty

Func IControlStatics_GetPaddingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetPaddingProperty

Func IControlStatics_GetTabIndexProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetTabIndexProperty

Func IControlStatics_GetTabNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetTabNavigationProperty

Func IControlStatics_GetTemplateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetTemplateProperty

Func IControlStatics_GetVerticalContentAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IControlStatics_GetVerticalContentAlignmentProperty

Func ICreateMediaSourceAudioInputNodeResult2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>ICreateMediaSourceAudioInputNodeResult2_GetExtendedError

Func ICreateMediaSourceAudioInputNodeResult_GetNode($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>ICreateMediaSourceAudioInputNodeResult_GetNode

Func ICreateMediaSourceAudioInputNodeResult_GetStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>ICreateMediaSourceAudioInputNodeResult_GetStatus

Func IDependencyObject2_RegisterPropertyChangedCallback($pThis, $pDp, $pCallback)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pCallback And IsInt($pCallback) Then $pCallback = Ptr($pCallback)
	If $pCallback And (Not IsPtr($pCallback)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr", $pCallback, "int64*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IDependencyObject2_RegisterPropertyChangedCallback

Func IDependencyObject2_UnregisterPropertyChangedCallback($pThis, $pDp, $iToken)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iToken) And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "int64", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IDependencyObject2_UnregisterPropertyChangedCallback

Func IDependencyObject_ClearValue($pThis, $pDp)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IDependencyObject_ClearValue

Func IDependencyObject_GetAnimationBaseValue($pThis, $pDp)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IDependencyObject_GetAnimationBaseValue

Func IDependencyObject_GetDispatcher($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDependencyObject_GetDispatcher

Func IDependencyObject_GetValue($pThis, $pDp)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IDependencyObject_GetValue

Func IDependencyObject_ReadLocalValue($pThis, $pDp)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IDependencyObject_ReadLocalValue

Func IDependencyObject_SetValue($pThis, $pDp, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IDependencyObject_SetValue

Func IDependencyObjectCollectionFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IDependencyObjectCollectionFactory_CreateInstance

Func IDependencyObjectFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IDependencyObjectFactory_CreateInstance

Func IDesktopWindowXamlSource_AddHdlrGotFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 12, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_AddHdlrGotFocus

Func IDesktopWindowXamlSource_AddHdlrTakeFocusRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_AddHdlrTakeFocusRequested

Func IDesktopWindowXamlSource_GetContent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_GetContent

Func IDesktopWindowXamlSource_GetHasFocus($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_GetHasFocus

Func IDesktopWindowXamlSource_NavigateFocus($pThis, $pRequest)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRequest And IsInt($pRequest) Then $pRequest = Ptr($pRequest)
	If $pRequest And (Not IsPtr($pRequest)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRequest, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IDesktopWindowXamlSource_NavigateFocus

Func IDesktopWindowXamlSource_RemoveHdlrGotFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 13, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_RemoveHdlrGotFocus

Func IDesktopWindowXamlSource_RemoveHdlrTakeFocusRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_RemoveHdlrTakeFocusRequested

Func IDesktopWindowXamlSource_SetContent($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSource_SetContent

Func IDesktopWindowXamlSourceFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IDesktopWindowXamlSourceFactory_CreateInstance

Func IDesktopWindowXamlSourceGotFocusEventArgs_GetRequest($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSourceGotFocusEventArgs_GetRequest

Func IDesktopWindowXamlSourceNative2_PreTranslateMessage($pThis, $tMessage)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tMessage) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tMessage, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IDesktopWindowXamlSourceNative2_PreTranslateMessage

Func IDesktopWindowXamlSourceNative_AttachToWindow($pThis, $hParentWnd)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $hParentWnd And (Not IsHWnd($hParentWnd)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "hwnd", $hParentWnd)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IDesktopWindowXamlSourceNative_AttachToWindow

Func IDesktopWindowXamlSourceNative_GetWindowHandle($pThis)
	Local $vFailVal = HWnd(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "hwnd*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError(@error, @extended, $aCall[2])
EndFunc   ;==>IDesktopWindowXamlSourceNative_GetWindowHandle

Func IDesktopWindowXamlSourceTakeFocusRequestedEventArgs_GetRequest($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IDesktopWindowXamlSourceTakeFocusRequestedEventArgs_GetRequest

Func IFrameworkElement2_AddHdlrDataContextChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement2_AddHdlrDataContextChanged

Func IFrameworkElement2_GetBindingExpression($pThis, $pDp)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IFrameworkElement2_GetBindingExpression

Func IFrameworkElement2_GetRequestedTheme($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement2_GetRequestedTheme

Func IFrameworkElement2_RemoveHdlrDataContextChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement2_RemoveHdlrDataContextChanged

Func IFrameworkElement2_SetRequestedTheme($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement2_SetRequestedTheme

Func IFrameworkElement3_AddHdlrLoading($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement3_AddHdlrLoading

Func IFrameworkElement3_RemoveHdlrLoading($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement3_RemoveHdlrLoading

Func IFrameworkElement4_GetAllowFocusOnInteraction($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_GetAllowFocusOnInteraction

Func IFrameworkElement4_GetAllowFocusWhenDisabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_GetAllowFocusWhenDisabled

Func IFrameworkElement4_GetFocusVisualMargin($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 9, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IFrameworkElement4_GetFocusVisualMargin

Func IFrameworkElement4_GetFocusVisualPrimaryBrush($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_GetFocusVisualPrimaryBrush

Func IFrameworkElement4_GetFocusVisualPrimaryThickness($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 13, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IFrameworkElement4_GetFocusVisualPrimaryThickness

Func IFrameworkElement4_GetFocusVisualSecondaryBrush($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_GetFocusVisualSecondaryBrush

Func IFrameworkElement4_GetFocusVisualSecondaryThickness($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 11, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IFrameworkElement4_GetFocusVisualSecondaryThickness

Func IFrameworkElement4_SetAllowFocusOnInteraction($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetAllowFocusOnInteraction

Func IFrameworkElement4_SetAllowFocusWhenDisabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetAllowFocusWhenDisabled

Func IFrameworkElement4_SetFocusVisualMargin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 10, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetFocusVisualMargin

Func IFrameworkElement4_SetFocusVisualPrimaryBrush($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetFocusVisualPrimaryBrush

Func IFrameworkElement4_SetFocusVisualPrimaryThickness($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 14, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetFocusVisualPrimaryThickness

Func IFrameworkElement4_SetFocusVisualSecondaryBrush($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetFocusVisualSecondaryBrush

Func IFrameworkElement4_SetFocusVisualSecondaryThickness($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 12, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement4_SetFocusVisualSecondaryThickness

Func IFrameworkElement6_AddHdlrActualThemeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement6_AddHdlrActualThemeChanged

Func IFrameworkElement6_GetActualTheme($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement6_GetActualTheme

Func IFrameworkElement6_RemoveHdlrActualThemeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement6_RemoveHdlrActualThemeChanged

Func IFrameworkElement7_AddHdlrEffectiveViewportChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement7_AddHdlrEffectiveViewportChanged

Func IFrameworkElement7_GetIsLoaded($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement7_GetIsLoaded

Func IFrameworkElement7_RemoveHdlrEffectiveViewportChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement7_RemoveHdlrEffectiveViewportChanged

Func IFrameworkElement_AddHdlrLayoutUpdated($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 50, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_AddHdlrLayoutUpdated

Func IFrameworkElement_AddHdlrLoaded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_AddHdlrLoaded

Func IFrameworkElement_AddHdlrSizeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 48, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_AddHdlrSizeChanged

Func IFrameworkElement_AddHdlrUnloaded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 46, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_AddHdlrUnloaded

Func IFrameworkElement_FindName($pThis, $sName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 52)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sName) And (Not IsString($sName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hName = _WinRT_CreateHString($sName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IFrameworkElement_FindName

Func IFrameworkElement_GetActualHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetActualHeight

Func IFrameworkElement_GetActualWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 14, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetActualWidth

Func IFrameworkElement_GetBaseUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetBaseUri

Func IFrameworkElement_GetDataContext($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetDataContext

Func IFrameworkElement_GetFlowDirection($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 42, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetFlowDirection

Func IFrameworkElement_GetHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetHeight

Func IFrameworkElement_GetHorizontalAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 28, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetHorizontalAlignment

Func IFrameworkElement_GetLanguage($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetLanguage

Func IFrameworkElement_GetMargin($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 32, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IFrameworkElement_GetMargin

Func IFrameworkElement_GetMaxHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetMaxHeight

Func IFrameworkElement_GetMaxWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetMaxWidth

Func IFrameworkElement_GetMinHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 24, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetMinHeight

Func IFrameworkElement_GetMinWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetMinWidth

Func IFrameworkElement_GetName($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetName

Func IFrameworkElement_GetParent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetParent

Func IFrameworkElement_GetResources($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetResources

Func IFrameworkElement_GetStyle($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetStyle

Func IFrameworkElement_GetTag($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetTag

Func IFrameworkElement_GetTriggers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetTriggers

Func IFrameworkElement_GetVerticalAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 30, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetVerticalAlignment

Func IFrameworkElement_GetWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_GetWidth

Func IFrameworkElement_RemoveHdlrLayoutUpdated($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 51, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_RemoveHdlrLayoutUpdated

Func IFrameworkElement_RemoveHdlrLoaded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_RemoveHdlrLoaded

Func IFrameworkElement_RemoveHdlrSizeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 49, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_RemoveHdlrSizeChanged

Func IFrameworkElement_RemoveHdlrUnloaded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 47, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_RemoveHdlrUnloaded

Func IFrameworkElement_SetBinding($pThis, $pDp, $pBinding)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 53)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pBinding And IsInt($pBinding) Then $pBinding = Ptr($pBinding)
	If $pBinding And (Not IsPtr($pBinding)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr", $pBinding)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IFrameworkElement_SetBinding

Func IFrameworkElement_SetDataContext($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 38, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetDataContext

Func IFrameworkElement_SetFlowDirection($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 43, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetFlowDirection

Func IFrameworkElement_SetHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetHeight

Func IFrameworkElement_SetHorizontalAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 29, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetHorizontalAlignment

Func IFrameworkElement_SetLanguage($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 13, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetLanguage

Func IFrameworkElement_SetMargin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 33, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetMargin

Func IFrameworkElement_SetMaxHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 27, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetMaxHeight

Func IFrameworkElement_SetMaxWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetMaxWidth

Func IFrameworkElement_SetMinHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 25, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetMinHeight

Func IFrameworkElement_SetMinWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 21, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetMinWidth

Func IFrameworkElement_SetName($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 35, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetName

Func IFrameworkElement_SetResources($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetResources

Func IFrameworkElement_SetStyle($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 40, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetStyle

Func IFrameworkElement_SetTag($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 11, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetTag

Func IFrameworkElement_SetVerticalAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 31, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetVerticalAlignment

Func IFrameworkElement_SetWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElement_SetWidth

Func IFrameworkElementFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IFrameworkElementFactory_CreateInstance

Func IFrameworkElementOverrides2_GoToElementStateCore($pThis, $sStateName, $bUseTransitions)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sStateName) And (Not IsString($sStateName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hStateName = _WinRT_CreateHString($sStateName)
	If ($bUseTransitions) And (Not IsBool($bUseTransitions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hStateName, "bool", $bUseTransitions, "bool*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hStateName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IFrameworkElementOverrides2_GoToElementStateCore

Func IFrameworkElementOverrides_ArrangeOverride($pThis, $tFinalSize)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tFinalSize) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tFinalSize, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tagResult = "float;float;"
	Local $tResult = DllStructCreate($tagResult, $aCall[3])
	Return SetError($aCall[0], 0, $tResult)
EndFunc   ;==>IFrameworkElementOverrides_ArrangeOverride

Func IFrameworkElementOverrides_MeasureOverride($pThis, $tAvailableSize)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tAvailableSize) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tAvailableSize, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tagResult = "float;float;"
	Local $tResult = DllStructCreate($tagResult, $aCall[3])
	Return SetError($aCall[0], 0, $tResult)
EndFunc   ;==>IFrameworkElementOverrides_MeasureOverride

Func IFrameworkElementOverrides_OnApplyTemplate($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IFrameworkElementOverrides_OnApplyTemplate

Func IFrameworkElementProtected7_InvalidateViewport($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IFrameworkElementProtected7_InvalidateViewport

Func IFrameworkElementStatics2_GetRequestedThemeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics2_GetRequestedThemeProperty

Func IFrameworkElementStatics4_GetAllowFocusOnInteractionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetAllowFocusOnInteractionProperty

Func IFrameworkElementStatics4_GetAllowFocusWhenDisabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetAllowFocusWhenDisabledProperty

Func IFrameworkElementStatics4_GetFocusVisualMarginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetFocusVisualMarginProperty

Func IFrameworkElementStatics4_GetFocusVisualPrimaryBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetFocusVisualPrimaryBrushProperty

Func IFrameworkElementStatics4_GetFocusVisualPrimaryThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetFocusVisualPrimaryThicknessProperty

Func IFrameworkElementStatics4_GetFocusVisualSecondaryBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetFocusVisualSecondaryBrushProperty

Func IFrameworkElementStatics4_GetFocusVisualSecondaryThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics4_GetFocusVisualSecondaryThicknessProperty

Func IFrameworkElementStatics5_DeferTree($pThis, $pElement)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IFrameworkElementStatics5_DeferTree

Func IFrameworkElementStatics6_GetActualThemeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics6_GetActualThemeProperty

Func IFrameworkElementStatics_GetActualHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetActualHeightProperty

Func IFrameworkElementStatics_GetActualWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetActualWidthProperty

Func IFrameworkElementStatics_GetDataContextProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetDataContextProperty

Func IFrameworkElementStatics_GetFlowDirectionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetFlowDirectionProperty

Func IFrameworkElementStatics_GetHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetHeightProperty

Func IFrameworkElementStatics_GetHorizontalAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetHorizontalAlignmentProperty

Func IFrameworkElementStatics_GetLanguageProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetLanguageProperty

Func IFrameworkElementStatics_GetMarginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetMarginProperty

Func IFrameworkElementStatics_GetMaxHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetMaxHeightProperty

Func IFrameworkElementStatics_GetMaxWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetMaxWidthProperty

Func IFrameworkElementStatics_GetMinHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetMinHeightProperty

Func IFrameworkElementStatics_GetMinWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetMinWidthProperty

Func IFrameworkElementStatics_GetNameProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetNameProperty

Func IFrameworkElementStatics_GetStyleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetStyleProperty

Func IFrameworkElementStatics_GetTagProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetTagProperty

Func IFrameworkElementStatics_GetVerticalAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetVerticalAlignmentProperty

Func IFrameworkElementStatics_GetWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IFrameworkElementStatics_GetWidthProperty

Func IInputStreamReference_OpenSequentialReadAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IInputStreamReference_OpenSequentialReadAsync

Func IInspectable_GetIids($pThis)
	Local $vFailVal[0]
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "uint*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $iCount = $aCall[2], $asIIDs[$iCount]
	For $i = 0 To $iCount - 1
		_WinAPI_StringFromGUID(Ptr($aCall[3] + ($i * 16)))
	Next
	__WinRT_FreeMem($aCall[3])
	Return SetError($aCall[0], 0, $asIIDs)
EndFunc   ;==>IInspectable_GetIids

Func IInspectable_GetRuntimeClassName($pThis)
	Local $sValue = __WinRT_GetProperty_HString($pThis, 5)
	Return SetError(@error, @extended, $sValue)
EndFunc   ;==>IInspectable_GetRuntimeClassName

Func IInspectable_GetTrustLevel($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 6, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IInspectable_GetTrustLevel

Func IMediaElement2_GetAreTransportControlsEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_GetAreTransportControlsEnabled

Func IMediaElement2_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_GetIsFullWindow

Func IMediaElement2_GetPlayToPreferredSourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_GetPlayToPreferredSourceUri

Func IMediaElement2_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_GetStretch

Func IMediaElement2_SetAreTransportControlsEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_SetAreTransportControlsEnabled

Func IMediaElement2_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_SetIsFullWindow

Func IMediaElement2_SetMediaStreamSource($pThis, $pSource)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pSource And IsInt($pSource) Then $pSource = Ptr($pSource)
	If $pSource And (Not IsPtr($pSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pSource)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement2_SetMediaStreamSource

Func IMediaElement2_SetPlayToPreferredSourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 15, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_SetPlayToPreferredSourceUri

Func IMediaElement2_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 10, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement2_SetStretch

Func IMediaElement3_AddHdlrPartialMediaFailureDetected($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement3_AddHdlrPartialMediaFailureDetected

Func IMediaElement3_GetAsCastingSource($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMediaElement3_GetAsCastingSource

Func IMediaElement3_GetTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement3_GetTransportControls

Func IMediaElement3_RemoveHdlrPartialMediaFailureDetected($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement3_RemoveHdlrPartialMediaFailureDetected

Func IMediaElement3_SetPlaybackSource($pThis, $pSource)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pSource And IsInt($pSource) Then $pSource = Ptr($pSource)
	If $pSource And (Not IsPtr($pSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pSource)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement3_SetPlaybackSource

Func IMediaElement3_SetTransportControls($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement3_SetTransportControls

Func IMediaElement_AddAudioEffect($pThis, $sEffectID, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 83)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sEffectID) And (Not IsString($sEffectID)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hEffectID = _WinRT_CreateHString($sEffectID)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hEffectID, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hEffectID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_AddAudioEffect

Func IMediaElement_AddHdlrBufferingProgressChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 65, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrBufferingProgressChanged

Func IMediaElement_AddHdlrCurrentStateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 67, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrCurrentStateChanged

Func IMediaElement_AddHdlrDownloadProgressChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 63, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrDownloadProgressChanged

Func IMediaElement_AddHdlrMarkerReached($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 69, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrMarkerReached

Func IMediaElement_AddHdlrMediaEnded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 59, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrMediaEnded

Func IMediaElement_AddHdlrMediaFailed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 61, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrMediaFailed

Func IMediaElement_AddHdlrMediaOpened($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 57, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrMediaOpened

Func IMediaElement_AddHdlrRateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 71, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrRateChanged

Func IMediaElement_AddHdlrSeekCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 75, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrSeekCompleted

Func IMediaElement_AddHdlrVolumeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 73, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_AddHdlrVolumeChanged

Func IMediaElement_AddVideoEffect($pThis, $sEffectID, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 84)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sEffectID) And (Not IsString($sEffectID)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hEffectID = _WinRT_CreateHString($sEffectID)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hEffectID, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hEffectID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_AddVideoEffect

Func IMediaElement_CanPlayType($pThis, $sType)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 80)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sType) And (Not IsString($sType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hType = _WinRT_CreateHString($sType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hType, "ulong*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaElement_CanPlayType

Func IMediaElement_GetActualStereo3DVideoPackingMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 86, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetActualStereo3DVideoPackingMode

Func IMediaElement_GetAspectRatioHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 43, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAspectRatioHeight

Func IMediaElement_GetAspectRatioWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 42, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAspectRatioWidth

Func IMediaElement_GetAudioCategory($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 46, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAudioCategory

Func IMediaElement_GetAudioDeviceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 48, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAudioDeviceType

Func IMediaElement_GetAudioStreamCount($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 32, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAudioStreamCount

Func IMediaElement_GetAudioStreamIndex($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAudioStreamIndex

Func IMediaElement_GetAudioStreamLanguage($pThis, $pIndex)
	Local $vFailVal = ""
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 82)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pIndex And IsInt($pIndex) Then $pIndex = Ptr($pIndex)
	If $pIndex And (Not IsPtr($pIndex)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pIndex, "handle*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $sResult = _WinRT_ReadHString($aCall[3])
	_WinRT_DeleteHString($aCall[3])
	Return SetError($aCall[0], 0, $sResult)
EndFunc   ;==>IMediaElement_GetAudioStreamLanguage

Func IMediaElement_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetAutoPlay

Func IMediaElement_GetBalance($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetBalance

Func IMediaElement_GetBufferingProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetBufferingProgress

Func IMediaElement_GetCanPause($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetCanPause

Func IMediaElement_GetCanSeek($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetCanSeek

Func IMediaElement_GetCurrentState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 28, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetCurrentState

Func IMediaElement_GetDefaultPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 40, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetDefaultPlaybackRate

Func IMediaElement_GetDownloadProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 25, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetDownloadProgress

Func IMediaElement_GetDownloadProgressOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 27, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetDownloadProgressOffset

Func IMediaElement_GetIsAudioOnly($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetIsAudioOnly

Func IMediaElement_GetIsLooping($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetIsLooping

Func IMediaElement_GetIsMuted($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetIsMuted

Func IMediaElement_GetIsStereo3DVideo($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 56)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetIsStereo3DVideo

Func IMediaElement_GetMarkers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetMarkers

Func IMediaElement_GetNaturalDuration($pThis)
	Local $tagValue = "int64;ulong;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 22, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IMediaElement_GetNaturalDuration

Func IMediaElement_GetNaturalVideoHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetNaturalVideoHeight

Func IMediaElement_GetNaturalVideoWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetNaturalVideoWidth

Func IMediaElement_GetPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 35, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetPlaybackRate

Func IMediaElement_GetPlayToSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetPlayToSource

Func IMediaElement_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetPosition

Func IMediaElement_GetPosterSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetPosterSource

Func IMediaElement_GetProtectionManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 50)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetProtectionManager

Func IMediaElement_GetRealTimePlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 44)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetRealTimePlayback

Func IMediaElement_GetSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetSource

Func IMediaElement_GetStereo3DVideoPackingMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 52, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetStereo3DVideoPackingMode

Func IMediaElement_GetStereo3DVideoRenderMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 54, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetStereo3DVideoRenderMode

Func IMediaElement_GetVolume($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_GetVolume

Func IMediaElement_Pause($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 79)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_Pause

Func IMediaElement_Play($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 78)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_Play

Func IMediaElement_RemoveAllEffects($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 85)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_RemoveAllEffects

Func IMediaElement_RemoveHdlrBufferingProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 66, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrBufferingProgressChanged

Func IMediaElement_RemoveHdlrCurrentStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 68, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrCurrentStateChanged

Func IMediaElement_RemoveHdlrDownloadProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 64, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrDownloadProgressChanged

Func IMediaElement_RemoveHdlrMarkerReached($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 70, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrMarkerReached

Func IMediaElement_RemoveHdlrMediaEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 60, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrMediaEnded

Func IMediaElement_RemoveHdlrMediaFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 62, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrMediaFailed

Func IMediaElement_RemoveHdlrMediaOpened($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 58, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrMediaOpened

Func IMediaElement_RemoveHdlrRateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 72, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrRateChanged

Func IMediaElement_RemoveHdlrSeekCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 76, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrSeekCompleted

Func IMediaElement_RemoveHdlrVolumeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 74, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_RemoveHdlrVolumeChanged

Func IMediaElement_SetAudioCategory($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 47, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetAudioCategory

Func IMediaElement_SetAudioDeviceType($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 49, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetAudioDeviceType

Func IMediaElement_SetAudioStreamIndex($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 34, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetAudioStreamIndex

Func IMediaElement_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 15, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetAutoPlay

Func IMediaElement_SetBalance($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetBalance

Func IMediaElement_SetDefaultPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 41, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetDefaultPlaybackRate

Func IMediaElement_SetIsLooping($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetIsLooping

Func IMediaElement_SetIsMuted($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetIsMuted

Func IMediaElement_SetPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 36, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetPlaybackRate

Func IMediaElement_SetPosition($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetPosition

Func IMediaElement_SetPosterSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetPosterSource

Func IMediaElement_SetProtectionManager($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 51, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetProtectionManager

Func IMediaElement_SetRealTimePlayback($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 45, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetRealTimePlayback

Func IMediaElement_SetSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetSource

Func IMediaElement_SetSource2($pThis, $pStream, $sMimeType)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 81)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sMimeType) And (Not IsString($sMimeType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hMimeType = _WinRT_CreateHString($sMimeType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "handle", $hMimeType)
	Local $iError = @error
	_WinRT_DeleteHString($hMimeType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_SetSource2

Func IMediaElement_SetStereo3DVideoPackingMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 53, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetStereo3DVideoPackingMode

Func IMediaElement_SetStereo3DVideoRenderMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 55, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetStereo3DVideoRenderMode

Func IMediaElement_SetVolume($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElement_SetVolume

Func IMediaElement_Stop($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 77)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaElement_Stop

Func IMediaElementStatics2_GetAreTransportControlsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics2_GetAreTransportControlsEnabledProperty

Func IMediaElementStatics2_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics2_GetIsFullWindowProperty

Func IMediaElementStatics2_GetPlayToPreferredSourceUriProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics2_GetPlayToPreferredSourceUriProperty

Func IMediaElementStatics2_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics2_GetStretchProperty

Func IMediaElementStatics_GetActualStereo3DVideoPackingModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetActualStereo3DVideoPackingModeProperty

Func IMediaElementStatics_GetAspectRatioHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAspectRatioHeightProperty

Func IMediaElementStatics_GetAspectRatioWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAspectRatioWidthProperty

Func IMediaElementStatics_GetAudioCategoryProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAudioCategoryProperty

Func IMediaElementStatics_GetAudioDeviceTypeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAudioDeviceTypeProperty

Func IMediaElementStatics_GetAudioStreamCountProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAudioStreamCountProperty

Func IMediaElementStatics_GetAudioStreamIndexProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAudioStreamIndexProperty

Func IMediaElementStatics_GetAutoPlayProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetAutoPlayProperty

Func IMediaElementStatics_GetBalanceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetBalanceProperty

Func IMediaElementStatics_GetBufferingProgressProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetBufferingProgressProperty

Func IMediaElementStatics_GetCanPauseProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetCanPauseProperty

Func IMediaElementStatics_GetCanSeekProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetCanSeekProperty

Func IMediaElementStatics_GetCurrentStateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetCurrentStateProperty

Func IMediaElementStatics_GetDefaultPlaybackRateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetDefaultPlaybackRateProperty

Func IMediaElementStatics_GetDownloadProgressOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetDownloadProgressOffsetProperty

Func IMediaElementStatics_GetDownloadProgressProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetDownloadProgressProperty

Func IMediaElementStatics_GetIsAudioOnlyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetIsAudioOnlyProperty

Func IMediaElementStatics_GetIsLoopingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetIsLoopingProperty

Func IMediaElementStatics_GetIsMutedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetIsMutedProperty

Func IMediaElementStatics_GetIsStereo3DVideoProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 38)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetIsStereo3DVideoProperty

Func IMediaElementStatics_GetNaturalDurationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetNaturalDurationProperty

Func IMediaElementStatics_GetNaturalVideoHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetNaturalVideoHeightProperty

Func IMediaElementStatics_GetNaturalVideoWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetNaturalVideoWidthProperty

Func IMediaElementStatics_GetPlaybackRateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetPlaybackRateProperty

Func IMediaElementStatics_GetPlayToSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 28)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetPlayToSourceProperty

Func IMediaElementStatics_GetPositionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetPositionProperty

Func IMediaElementStatics_GetPosterSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetPosterSourceProperty

Func IMediaElementStatics_GetProtectionManagerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetProtectionManagerProperty

Func IMediaElementStatics_GetRealTimePlaybackProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 32)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetRealTimePlaybackProperty

Func IMediaElementStatics_GetSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetSourceProperty

Func IMediaElementStatics_GetStereo3DVideoPackingModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetStereo3DVideoPackingModeProperty

Func IMediaElementStatics_GetStereo3DVideoRenderModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetStereo3DVideoRenderModeProperty

Func IMediaElementStatics_GetVolumeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaElementStatics_GetVolumeProperty

Func IMediaPlayer2_GetAudioCategory($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer2_GetAudioCategory

Func IMediaPlayer2_GetAudioDeviceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer2_GetAudioDeviceType

Func IMediaPlayer2_GetSystemMediaTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer2_GetSystemMediaTransportControls

Func IMediaPlayer2_SetAudioCategory($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer2_SetAudioCategory

Func IMediaPlayer2_SetAudioDeviceType($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer2_SetAudioDeviceType

Func IMediaPlayer3_AddHdlrIsMutedChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_AddHdlrIsMutedChanged

Func IMediaPlayer3_AddHdlrSourceChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_AddHdlrSourceChanged

Func IMediaPlayer3_GetAsCastingSource($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 28)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMediaPlayer3_GetAsCastingSource

Func IMediaPlayer3_GetAudioBalance($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetAudioBalance

Func IMediaPlayer3_GetAudioDevice($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetAudioDevice

Func IMediaPlayer3_GetBreakManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetBreakManager

Func IMediaPlayer3_GetCommandManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetCommandManager

Func IMediaPlayer3_GetPlaybackSession($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetPlaybackSession

Func IMediaPlayer3_GetRealTimePlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetRealTimePlayback

Func IMediaPlayer3_GetStereoscopicVideoRenderMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetStereoscopicVideoRenderMode

Func IMediaPlayer3_GetTimelineController($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetTimelineController

Func IMediaPlayer3_GetTimelineControllerPositionOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_GetTimelineControllerPositionOffset

Func IMediaPlayer3_RemoveHdlrIsMutedChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_RemoveHdlrIsMutedChanged

Func IMediaPlayer3_RemoveHdlrSourceChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_RemoveHdlrSourceChanged

Func IMediaPlayer3_SetAudioBalance($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetAudioBalance

Func IMediaPlayer3_SetAudioDevice($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 20, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetAudioDevice

Func IMediaPlayer3_SetRealTimePlayback($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetRealTimePlayback

Func IMediaPlayer3_SetStereoscopicVideoRenderMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetStereoscopicVideoRenderMode

Func IMediaPlayer3_SetTimelineController($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 22, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetTimelineController

Func IMediaPlayer3_SetTimelineControllerPositionOffset($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer3_SetTimelineControllerPositionOffset

Func IMediaPlayer3_StepBackwardOneFrame($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 27)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer3_StepBackwardOneFrame

Func IMediaPlayer3_StepForwardOneFrame($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 26)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer3_StepForwardOneFrame

Func IMediaPlayer4_GetSurface($pThis, $pCompositor)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pCompositor And IsInt($pCompositor) Then $pCompositor = Ptr($pCompositor)
	If $pCompositor And (Not IsPtr($pCompositor)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pCompositor, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaPlayer4_GetSurface

Func IMediaPlayer4_SetSurfaceSize($pThis, $tSize)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tSize) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tSize)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer4_SetSurfaceSize

Func IMediaPlayer5_AddHdlrVideoFrameAvailable($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer5_AddHdlrVideoFrameAvailable

Func IMediaPlayer5_CopyFrameToStereoscopicVideoSurfaces($pThis, $pDestinationLeftEye, $pDestinationRightEye)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationLeftEye And IsInt($pDestinationLeftEye) Then $pDestinationLeftEye = Ptr($pDestinationLeftEye)
	If $pDestinationLeftEye And (Not IsPtr($pDestinationLeftEye)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pDestinationRightEye And IsInt($pDestinationRightEye) Then $pDestinationRightEye = Ptr($pDestinationRightEye)
	If $pDestinationRightEye And (Not IsPtr($pDestinationRightEye)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationLeftEye, "ptr", $pDestinationRightEye)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer5_CopyFrameToStereoscopicVideoSurfaces

Func IMediaPlayer5_CopyFrameToVideoSurface($pThis, $pDestination)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer5_CopyFrameToVideoSurface

Func IMediaPlayer5_CopyFrameToVideoSurface2($pThis, $pDestination, $tTargetRectangle)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsDllStruct($tTargetRectangle) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination, "struct", $tTargetRectangle)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer5_CopyFrameToVideoSurface2

Func IMediaPlayer5_GetIsVideoFrameServerEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer5_GetIsVideoFrameServerEnabled

Func IMediaPlayer5_RemoveHdlrVideoFrameAvailable($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer5_RemoveHdlrVideoFrameAvailable

Func IMediaPlayer5_SetIsVideoFrameServerEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer5_SetIsVideoFrameServerEnabled

Func IMediaPlayer6_AddHdlrSubtitleFrameChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer6_AddHdlrSubtitleFrameChanged

Func IMediaPlayer6_RemoveHdlrSubtitleFrameChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer6_RemoveHdlrSubtitleFrameChanged

Func IMediaPlayer6_RenderSubtitlesToSurface($pThis, $pDestination)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaPlayer6_RenderSubtitlesToSurface

Func IMediaPlayer6_RenderSubtitlesToSurface2($pThis, $pDestination, $tTargetRectangle)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsDllStruct($tTargetRectangle) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination, "struct", $tTargetRectangle, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaPlayer6_RenderSubtitlesToSurface2

Func IMediaPlayer7_GetAudioStateMonitor($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer7_GetAudioStateMonitor

Func IMediaPlayer_AddHdlrBufferingEnded($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrBufferingEnded

Func IMediaPlayer_AddHdlrBufferingStarted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 42, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrBufferingStarted

Func IMediaPlayer_AddHdlrCurrentStateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 32, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrCurrentStateChanged

Func IMediaPlayer_AddHdlrMediaEnded($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 28, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrMediaEnded

Func IMediaPlayer_AddHdlrMediaFailed($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 30, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrMediaFailed

Func IMediaPlayer_AddHdlrMediaOpened($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 26, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrMediaOpened

Func IMediaPlayer_AddHdlrMediaPlayerRateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 36, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrMediaPlayerRateChanged

Func IMediaPlayer_AddHdlrPlaybackMediaMarkerReached($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 34, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrPlaybackMediaMarkerReached

Func IMediaPlayer_AddHdlrSeekCompleted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 40, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrSeekCompleted

Func IMediaPlayer_AddHdlrVolumeChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 38, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_AddHdlrVolumeChanged

Func IMediaPlayer_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetAutoPlay

Func IMediaPlayer_GetBufferingProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetBufferingProgress

Func IMediaPlayer_GetCanPause($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetCanPause

Func IMediaPlayer_GetCanSeek($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetCanSeek

Func IMediaPlayer_GetCurrentState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 13, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetCurrentState

Func IMediaPlayer_GetIsLoopingEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetIsLoopingEnabled

Func IMediaPlayer_GetIsMuted($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetIsMuted

Func IMediaPlayer_GetIsProtected($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetIsProtected

Func IMediaPlayer_GetNaturalDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetNaturalDuration

Func IMediaPlayer_GetPlaybackMediaMarkers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetPlaybackMediaMarkers

Func IMediaPlayer_GetPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetPlaybackRate

Func IMediaPlayer_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetPosition

Func IMediaPlayer_GetVolume($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_GetVolume

Func IMediaPlayer_Pause($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 47)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer_Pause

Func IMediaPlayer_Play($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 46)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer_Play

Func IMediaPlayer_RemoveHdlrBufferingEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrBufferingEnded

Func IMediaPlayer_RemoveHdlrBufferingStarted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 43, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrBufferingStarted

Func IMediaPlayer_RemoveHdlrCurrentStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 33, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrCurrentStateChanged

Func IMediaPlayer_RemoveHdlrMediaEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 29, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrMediaEnded

Func IMediaPlayer_RemoveHdlrMediaFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 31, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrMediaFailed

Func IMediaPlayer_RemoveHdlrMediaOpened($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 27, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrMediaOpened

Func IMediaPlayer_RemoveHdlrMediaPlayerRateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 37, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrMediaPlayerRateChanged

Func IMediaPlayer_RemoveHdlrPlaybackMediaMarkerReached($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 35, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrPlaybackMediaMarkerReached

Func IMediaPlayer_RemoveHdlrSeekCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 41, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrSeekCompleted

Func IMediaPlayer_RemoveHdlrVolumeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 39, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_RemoveHdlrVolumeChanged

Func IMediaPlayer_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetAutoPlay

Func IMediaPlayer_SetIsLoopingEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 17, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetIsLoopingEnabled

Func IMediaPlayer_SetIsMuted($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetIsMuted

Func IMediaPlayer_SetPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetPlaybackRate

Func IMediaPlayer_SetPosition($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetPosition

Func IMediaPlayer_SetUriSource($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 48)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayer_SetUriSource

Func IMediaPlayer_SetVolume($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayer_SetVolume

Func IMediaPlayerDataReceivedEventArgs_GetData($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerDataReceivedEventArgs_GetData

Func IMediaPlayerEffects2_AddVideoEffect($pThis, $sActivatableClassId, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sActivatableClassId) And (Not IsString($sActivatableClassId)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hActivatableClassId = _WinRT_CreateHString($sActivatableClassId)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hActivatableClassId, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hActivatableClassId)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerEffects2_AddVideoEffect

Func IMediaPlayerEffects_AddAudioEffect($pThis, $sActivatableClassId, $bEffectOptional, $pConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sActivatableClassId) And (Not IsString($sActivatableClassId)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hActivatableClassId = _WinRT_CreateHString($sActivatableClassId)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pConfiguration And IsInt($pConfiguration) Then $pConfiguration = Ptr($pConfiguration)
	If $pConfiguration And (Not IsPtr($pConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hActivatableClassId, "bool", $bEffectOptional, "ptr", $pConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hActivatableClassId)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerEffects_AddAudioEffect

Func IMediaPlayerEffects_RemoveAllEffects($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerEffects_RemoveAllEffects

Func IMediaPlayerElement_GetAreTransportControlsEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetAreTransportControlsEnabled

Func IMediaPlayerElement_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetAutoPlay

Func IMediaPlayerElement_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetIsFullWindow

Func IMediaPlayerElement_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetMediaPlayer

Func IMediaPlayerElement_GetPosterSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetPosterSource

Func IMediaPlayerElement_GetSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetSource

Func IMediaPlayerElement_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetStretch

Func IMediaPlayerElement_GetTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_GetTransportControls

Func IMediaPlayerElement_SetAreTransportControlsEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetAreTransportControlsEnabled

Func IMediaPlayerElement_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetAutoPlay

Func IMediaPlayerElement_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetIsFullWindow

Func IMediaPlayerElement_SetMediaPlayer($pThis, $pMediaPlayer)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 22)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaPlayer And IsInt($pMediaPlayer) Then $pMediaPlayer = Ptr($pMediaPlayer)
	If $pMediaPlayer And (Not IsPtr($pMediaPlayer)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaPlayer)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerElement_SetMediaPlayer

Func IMediaPlayerElement_SetPosterSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetPosterSource

Func IMediaPlayerElement_SetSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetSource

Func IMediaPlayerElement_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetStretch

Func IMediaPlayerElement_SetTransportControls($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElement_SetTransportControls

Func IMediaPlayerElementFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaPlayerElementFactory_CreateInstance

Func IMediaPlayerElementStatics_GetAreTransportControlsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetAreTransportControlsEnabledProperty

Func IMediaPlayerElementStatics_GetAutoPlayProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetAutoPlayProperty

Func IMediaPlayerElementStatics_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetIsFullWindowProperty

Func IMediaPlayerElementStatics_GetMediaPlayerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetMediaPlayerProperty

Func IMediaPlayerElementStatics_GetPosterSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetPosterSourceProperty

Func IMediaPlayerElementStatics_GetSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetSourceProperty

Func IMediaPlayerElementStatics_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerElementStatics_GetStretchProperty

Func IMediaPlayerFailedEventArgs_GetError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerFailedEventArgs_GetError

Func IMediaPlayerFailedEventArgs_GetErrorMessage($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerFailedEventArgs_GetErrorMessage

Func IMediaPlayerFailedEventArgs_GetExtendedErrorCode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerFailedEventArgs_GetExtendedErrorCode

Func IMediaPlayerPresenter_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_GetIsFullWindow

Func IMediaPlayerPresenter_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_GetMediaPlayer

Func IMediaPlayerPresenter_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_GetStretch

Func IMediaPlayerPresenter_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_SetIsFullWindow

Func IMediaPlayerPresenter_SetMediaPlayer($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_SetMediaPlayer

Func IMediaPlayerPresenter_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 10, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenter_SetStretch

Func IMediaPlayerPresenterFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaPlayerPresenterFactory_CreateInstance

Func IMediaPlayerPresenterStatics_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenterStatics_GetIsFullWindowProperty

Func IMediaPlayerPresenterStatics_GetMediaPlayerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenterStatics_GetMediaPlayerProperty

Func IMediaPlayerPresenterStatics_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerPresenterStatics_GetStretchProperty

Func IMediaPlayerRateChangedEventArgs_GetNewRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerRateChangedEventArgs_GetNewRate

Func IMediaPlayerSource2_GetSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSource2_GetSource

Func IMediaPlayerSource2_SetSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSource2_SetSource

Func IMediaPlayerSource_GetProtectionManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSource_GetProtectionManager

Func IMediaPlayerSource_SetFileSource($pThis, $pFile)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFile And IsInt($pFile) Then $pFile = Ptr($pFile)
	If $pFile And (Not IsPtr($pFile)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFile)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerSource_SetFileSource

Func IMediaPlayerSource_SetMediaSource($pThis, $pSource)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pSource And IsInt($pSource) Then $pSource = Ptr($pSource)
	If $pSource And (Not IsPtr($pSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pSource)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerSource_SetMediaSource

Func IMediaPlayerSource_SetProtectionManager($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSource_SetProtectionManager

Func IMediaPlayerSource_SetStreamSource($pThis, $pStream)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaPlayerSource_SetStreamSource

Func IMediaPlayerSurface_GetCompositionSurface($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSurface_GetCompositionSurface

Func IMediaPlayerSurface_GetCompositor($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSurface_GetCompositor

Func IMediaPlayerSurface_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaPlayerSurface_GetMediaPlayer

Func IMediaSource2_AddHdlrOpenOperationCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_AddHdlrOpenOperationCompleted

Func IMediaSource2_GetCustomProperties($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_GetCustomProperties

Func IMediaSource2_GetDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_GetDuration

Func IMediaSource2_GetExternalTimedMetadataTracks($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_GetExternalTimedMetadataTracks

Func IMediaSource2_GetExternalTimedTextSources($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_GetExternalTimedTextSources

Func IMediaSource2_GetIsOpen($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_GetIsOpen

Func IMediaSource2_RemoveHdlrOpenOperationCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource2_RemoveHdlrOpenOperationCompleted

Func IMediaSource3_AddHdlrStateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource3_AddHdlrStateChanged

Func IMediaSource3_GetState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource3_GetState

Func IMediaSource3_RemoveHdlrStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource3_RemoveHdlrStateChanged

Func IMediaSource3_Reset($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaSource3_Reset

Func IMediaSource4_GetAdaptiveMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource4_GetAdaptiveMediaSource

Func IMediaSource4_GetMediaStreamSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource4_GetMediaStreamSource

Func IMediaSource4_GetMseStreamSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource4_GetMseStreamSource

Func IMediaSource4_GetUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource4_GetUri

Func IMediaSource4_OpenAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMediaSource4_OpenAsync

Func IMediaSource5_GetDownloadOperation($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSource5_GetDownloadOperation

Func IMediaSourceAppServiceConnection_AddHdlrInitializeMediaStreamSourceRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAppServiceConnection_AddHdlrInitializeMediaStreamSourceRequested

Func IMediaSourceAppServiceConnection_RemoveHdlrInitializeMediaStreamSourceRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAppServiceConnection_RemoveHdlrInitializeMediaStreamSourceRequested

Func IMediaSourceAppServiceConnection_Start($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaSourceAppServiceConnection_Start

Func IMediaSourceAppServiceConnectionFactory_Create($pThis, $pAppServiceConnection)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAppServiceConnection And IsInt($pAppServiceConnection) Then $pAppServiceConnection = Ptr($pAppServiceConnection)
	If $pAppServiceConnection And (Not IsPtr($pAppServiceConnection)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAppServiceConnection, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceAppServiceConnectionFactory_Create

Func IMediaSourceAudioInputNode_AddHdlrMediaSourceCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 19, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_AddHdlrMediaSourceCompleted

Func IMediaSourceAudioInputNode_GetDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 17, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetDuration

Func IMediaSourceAudioInputNode_GetEndTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetEndTime

Func IMediaSourceAudioInputNode_GetLoopCount($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetLoopCount

Func IMediaSourceAudioInputNode_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetMediaSource

Func IMediaSourceAudioInputNode_GetPlaybackSpeedFactor($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetPlaybackSpeedFactor

Func IMediaSourceAudioInputNode_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetPosition

Func IMediaSourceAudioInputNode_GetStartTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_GetStartTime

Func IMediaSourceAudioInputNode_RemoveHdlrMediaSourceCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 20, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_RemoveHdlrMediaSourceCompleted

Func IMediaSourceAudioInputNode_Seek($pThis, $iPosition)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iPosition) And (Not IsInt($iPosition)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "int64", $iPosition)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaSourceAudioInputNode_Seek

Func IMediaSourceAudioInputNode_SetEndTime($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_SetEndTime

Func IMediaSourceAudioInputNode_SetLoopCount($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_SetLoopCount

Func IMediaSourceAudioInputNode_SetPlaybackSpeedFactor($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 7, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_SetPlaybackSpeedFactor

Func IMediaSourceAudioInputNode_SetStartTime($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceAudioInputNode_SetStartTime

Func IMediaSourceError_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceError_GetExtendedError

Func IMediaSourceOpenOperationCompletedEventArgs_GetError($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceOpenOperationCompletedEventArgs_GetError

Func IMediaSourceStateChangedEventArgs_GetNewState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceStateChangedEventArgs_GetNewState

Func IMediaSourceStateChangedEventArgs_GetOldState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaSourceStateChangedEventArgs_GetOldState

Func IMediaSourceStatics2_CreateFromMediaBinder($pThis, $pBinder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBinder And IsInt($pBinder) Then $pBinder = Ptr($pBinder)
	If $pBinder And (Not IsPtr($pBinder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBinder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics2_CreateFromMediaBinder

Func IMediaSourceStatics3_CreateFromMediaFrameSource($pThis, $pFrameSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFrameSource And IsInt($pFrameSource) Then $pFrameSource = Ptr($pFrameSource)
	If $pFrameSource And (Not IsPtr($pFrameSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFrameSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics3_CreateFromMediaFrameSource

Func IMediaSourceStatics4_CreateFromDownloadOperation($pThis, $pDownloadOperation)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDownloadOperation And IsInt($pDownloadOperation) Then $pDownloadOperation = Ptr($pDownloadOperation)
	If $pDownloadOperation And (Not IsPtr($pDownloadOperation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDownloadOperation, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics4_CreateFromDownloadOperation

Func IMediaSourceStatics_CreateFromAdaptiveMediaSource($pThis, $pMediaSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaSource And IsInt($pMediaSource) Then $pMediaSource = Ptr($pMediaSource)
	If $pMediaSource And (Not IsPtr($pMediaSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromAdaptiveMediaSource

Func IMediaSourceStatics_CreateFromIMediaSource($pThis, $pMediaSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaSource And IsInt($pMediaSource) Then $pMediaSource = Ptr($pMediaSource)
	If $pMediaSource And (Not IsPtr($pMediaSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromIMediaSource

Func IMediaSourceStatics_CreateFromMediaStreamSource($pThis, $pMediaSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaSource And IsInt($pMediaSource) Then $pMediaSource = Ptr($pMediaSource)
	If $pMediaSource And (Not IsPtr($pMediaSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromMediaStreamSource

Func IMediaSourceStatics_CreateFromMseStreamSource($pThis, $pMediaSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaSource And IsInt($pMediaSource) Then $pMediaSource = Ptr($pMediaSource)
	If $pMediaSource And (Not IsPtr($pMediaSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromMseStreamSource

Func IMediaSourceStatics_CreateFromStorageFile($pThis, $pFile)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFile And IsInt($pFile) Then $pFile = Ptr($pFile)
	If $pFile And (Not IsPtr($pFile)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFile, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromStorageFile

Func IMediaSourceStatics_CreateFromStream($pThis, $pStream, $sContentType)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "handle", $hContentType, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaSourceStatics_CreateFromStream

Func IMediaSourceStatics_CreateFromStreamReference($pThis, $pStream, $sContentType)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "handle", $hContentType, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaSourceStatics_CreateFromStreamReference

Func IMediaSourceStatics_CreateFromUri($pThis, $pUri)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaSourceStatics_CreateFromUri

Func IMediaTransportControls2_AddHdlrThumbnailRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 21, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_AddHdlrThumbnailRequested

Func IMediaTransportControls2_GetFastPlayFallbackBehaviour($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 19, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetFastPlayFallbackBehaviour

Func IMediaTransportControls2_GetIsNextTrackButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsNextTrackButtonVisible

Func IMediaTransportControls2_GetIsPreviousTrackButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsPreviousTrackButtonVisible

Func IMediaTransportControls2_GetIsSkipBackwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsSkipBackwardButtonVisible

Func IMediaTransportControls2_GetIsSkipBackwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsSkipBackwardEnabled

Func IMediaTransportControls2_GetIsSkipForwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsSkipForwardButtonVisible

Func IMediaTransportControls2_GetIsSkipForwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_GetIsSkipForwardEnabled

Func IMediaTransportControls2_RemoveHdlrThumbnailRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 22, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_RemoveHdlrThumbnailRequested

Func IMediaTransportControls2_SetFastPlayFallbackBehaviour($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 20, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetFastPlayFallbackBehaviour

Func IMediaTransportControls2_SetIsNextTrackButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 16, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsNextTrackButtonVisible

Func IMediaTransportControls2_SetIsPreviousTrackButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsPreviousTrackButtonVisible

Func IMediaTransportControls2_SetIsSkipBackwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsSkipBackwardButtonVisible

Func IMediaTransportControls2_SetIsSkipBackwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsSkipBackwardEnabled

Func IMediaTransportControls2_SetIsSkipForwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsSkipForwardButtonVisible

Func IMediaTransportControls2_SetIsSkipForwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls2_SetIsSkipForwardEnabled

Func IMediaTransportControls3_GetIsRepeatButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_GetIsRepeatButtonVisible

Func IMediaTransportControls3_GetIsRepeatEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_GetIsRepeatEnabled

Func IMediaTransportControls3_GetShowAndHideAutomatically($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_GetShowAndHideAutomatically

Func IMediaTransportControls3_Hide($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaTransportControls3_Hide

Func IMediaTransportControls3_SetIsRepeatButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_SetIsRepeatButtonVisible

Func IMediaTransportControls3_SetIsRepeatEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_SetIsRepeatEnabled

Func IMediaTransportControls3_SetShowAndHideAutomatically($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls3_SetShowAndHideAutomatically

Func IMediaTransportControls3_Show($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaTransportControls3_Show

Func IMediaTransportControls4_GetIsCompactOverlayButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls4_GetIsCompactOverlayButtonVisible

Func IMediaTransportControls4_GetIsCompactOverlayEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls4_GetIsCompactOverlayEnabled

Func IMediaTransportControls4_SetIsCompactOverlayButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls4_SetIsCompactOverlayButtonVisible

Func IMediaTransportControls4_SetIsCompactOverlayEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls4_SetIsCompactOverlayEnabled

Func IMediaTransportControls_GetIsCompact($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsCompact

Func IMediaTransportControls_GetIsFastForwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFastForwardButtonVisible

Func IMediaTransportControls_GetIsFastForwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFastForwardEnabled

Func IMediaTransportControls_GetIsFastRewindButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFastRewindButtonVisible

Func IMediaTransportControls_GetIsFastRewindEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFastRewindEnabled

Func IMediaTransportControls_GetIsFullWindowButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFullWindowButtonVisible

Func IMediaTransportControls_GetIsFullWindowEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsFullWindowEnabled

Func IMediaTransportControls_GetIsPlaybackRateButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsPlaybackRateButtonVisible

Func IMediaTransportControls_GetIsPlaybackRateEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsPlaybackRateEnabled

Func IMediaTransportControls_GetIsSeekBarVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsSeekBarVisible

Func IMediaTransportControls_GetIsSeekEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsSeekEnabled

Func IMediaTransportControls_GetIsStopButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsStopButtonVisible

Func IMediaTransportControls_GetIsStopEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsStopEnabled

Func IMediaTransportControls_GetIsVolumeButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsVolumeButtonVisible

Func IMediaTransportControls_GetIsVolumeEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsVolumeEnabled

Func IMediaTransportControls_GetIsZoomButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsZoomButtonVisible

Func IMediaTransportControls_GetIsZoomEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_GetIsZoomEnabled

Func IMediaTransportControls_SetIsCompact($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 40, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsCompact

Func IMediaTransportControls_SetIsFastForwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 16, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFastForwardButtonVisible

Func IMediaTransportControls_SetIsFastForwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFastForwardEnabled

Func IMediaTransportControls_SetIsFastRewindButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFastRewindButtonVisible

Func IMediaTransportControls_SetIsFastRewindEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 22, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFastRewindEnabled

Func IMediaTransportControls_SetIsFullWindowButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFullWindowButtonVisible

Func IMediaTransportControls_SetIsFullWindowEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsFullWindowEnabled

Func IMediaTransportControls_SetIsPlaybackRateButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 32, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsPlaybackRateButtonVisible

Func IMediaTransportControls_SetIsPlaybackRateEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 34, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsPlaybackRateEnabled

Func IMediaTransportControls_SetIsSeekBarVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 36, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsSeekBarVisible

Func IMediaTransportControls_SetIsSeekEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsSeekEnabled

Func IMediaTransportControls_SetIsStopButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 24, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsStopButtonVisible

Func IMediaTransportControls_SetIsStopEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 26, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsStopEnabled

Func IMediaTransportControls_SetIsVolumeButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 28, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsVolumeButtonVisible

Func IMediaTransportControls_SetIsVolumeEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 30, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsVolumeEnabled

Func IMediaTransportControls_SetIsZoomButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsZoomButtonVisible

Func IMediaTransportControls_SetIsZoomEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControls_SetIsZoomEnabled

Func IMediaTransportControlsFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMediaTransportControlsFactory_CreateInstance

Func IMediaTransportControlsHelperStatics_GetDropoutOrder($pThis, $pElement)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMediaTransportControlsHelperStatics_GetDropoutOrder

Func IMediaTransportControlsHelperStatics_GetDropoutOrderProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsHelperStatics_GetDropoutOrderProperty

Func IMediaTransportControlsHelperStatics_SetDropoutOrder($pThis, $pElement, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMediaTransportControlsHelperStatics_SetDropoutOrder

Func IMediaTransportControlsStatics2_GetFastPlayFallbackBehaviourProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetFastPlayFallbackBehaviourProperty

Func IMediaTransportControlsStatics2_GetIsNextTrackButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsNextTrackButtonVisibleProperty

Func IMediaTransportControlsStatics2_GetIsPreviousTrackButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsPreviousTrackButtonVisibleProperty

Func IMediaTransportControlsStatics2_GetIsSkipBackwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsSkipBackwardButtonVisibleProperty

Func IMediaTransportControlsStatics2_GetIsSkipBackwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsSkipBackwardEnabledProperty

Func IMediaTransportControlsStatics2_GetIsSkipForwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsSkipForwardButtonVisibleProperty

Func IMediaTransportControlsStatics2_GetIsSkipForwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics2_GetIsSkipForwardEnabledProperty

Func IMediaTransportControlsStatics3_GetIsRepeatButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics3_GetIsRepeatButtonVisibleProperty

Func IMediaTransportControlsStatics3_GetIsRepeatEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics3_GetIsRepeatEnabledProperty

Func IMediaTransportControlsStatics3_GetShowAndHideAutomaticallyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics3_GetShowAndHideAutomaticallyProperty

Func IMediaTransportControlsStatics4_GetIsCompactOverlayButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics4_GetIsCompactOverlayButtonVisibleProperty

Func IMediaTransportControlsStatics4_GetIsCompactOverlayEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics4_GetIsCompactOverlayEnabledProperty

Func IMediaTransportControlsStatics_GetIsCompactProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsCompactProperty

Func IMediaTransportControlsStatics_GetIsFastForwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFastForwardButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsFastForwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFastForwardEnabledProperty

Func IMediaTransportControlsStatics_GetIsFastRewindButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFastRewindButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsFastRewindEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFastRewindEnabledProperty

Func IMediaTransportControlsStatics_GetIsFullWindowButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFullWindowButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsFullWindowEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsFullWindowEnabledProperty

Func IMediaTransportControlsStatics_GetIsPlaybackRateButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsPlaybackRateButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsPlaybackRateEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsPlaybackRateEnabledProperty

Func IMediaTransportControlsStatics_GetIsSeekBarVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsSeekBarVisibleProperty

Func IMediaTransportControlsStatics_GetIsSeekEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsSeekEnabledProperty

Func IMediaTransportControlsStatics_GetIsStopButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsStopButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsStopEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsStopEnabledProperty

Func IMediaTransportControlsStatics_GetIsVolumeButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsVolumeButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsVolumeEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsVolumeEnabledProperty

Func IMediaTransportControlsStatics_GetIsZoomButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsZoomButtonVisibleProperty

Func IMediaTransportControlsStatics_GetIsZoomEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMediaTransportControlsStatics_GetIsZoomEnabledProperty

Func IMetaDataDispenser_DefineScope($pThis, $sCLSID, $iCreateFlags, $sIID)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tCLSID = _WinAPI_GUIDFromString($sCLSID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $iCreateFlags And Not IsInt($iCreateFlags) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tCLSID, "dword", $iCreateFlags, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IMetaDataDispenser_DefineScope

Func IMetaDataDispenser_OpenScope($pThis, $sScope, $iOpenFlags, $sIID)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If (Not $sScope) Or (Not IsString($sScope)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $iOpenFlags And Not IsInt($iOpenFlags) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", $sScope, "dword", $iOpenFlags, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IMetaDataDispenser_OpenScope

Func IMetaDataDispenser_OpenScopeOnMemory($pThis, $pMetadata, $iMetadataSize, $iOpenFlags, $sIID)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If (Not $pMetadata) Or (Not IsPtr($pMetadata)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMetadataSize)) Or $iMetadataSize < 1 Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $iOpenFlags And Not IsInt($iOpenFlags) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMetadata, "uint", $iMetadataSize, "dword", $iOpenFlags, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[6])
EndFunc   ;==>IMetaDataDispenser_OpenScopeOnMemory

Func IMetaDataImport2_EnumGenericParamConstraints($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_GenericParam Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 69, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport2_EnumGenericParamConstraints

Func IMetaDataImport2_EnumGenericParams($pThis, ByRef $pEnum, $iToken, $iMaxTokens)
	Local $vFailVal[0]
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If ($iTokenType <> $MDT_TypeDef) And ($iTokenType <> $MDT_MethodDef) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 66, $pEnum, $iToken, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport2_EnumGenericParams

Func IMetaDataImport2_EnumMethodSpecs($pThis, ByRef $pEnum, $iToken, $iMaxTokens)
	Local $vFailVal[0]
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If ($iTokenType <> $MDT_MemberRef) And ($iTokenType <> $MDT_MethodDef) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 73, $pEnum, $iToken, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport2_EnumMethodSpecs

Func IMetaDataImport2_GetGenericParamConstraintProps($pThis, $iGenericConstraintTkn, ByRef $iGenericParamTkn, ByRef $iContraintTypeTkn)
	Local $vFailVal = False
	If Not IsInt($iGenericConstraintTkn) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 70)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iGenericConstraintTkn, "ulong*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iGenericParamTkn = $aCall[3]
	$iContraintTypeTkn = $aCall[4]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport2_GetGenericParamConstraintProps

Func IMetaDataImport2_GetGenericParamProps($pThis, $iGenericParamTkn, ByRef $iParamSeq, ByRef $iParamFlags, ByRef $iOwnerTkn, ByRef $sName)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iGenericParamTkn) <> $MDT_GenericParam Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 67)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iGenericParamTkn, "ulong*", 0, "dword*", 0, "ulong*", 0, "dword*", 0, "wstr", "", "ulong", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[9]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iGenericParamTkn, "ulong*", 0, "dword*", 0, "ulong*", 0, "dword*", 0, "struct*", $tName, "ulong", $aCall[9], "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iParamSeq = $aCall[3]
	$iParamFlags = $aCall[4]
	$iOwnerTkn = $aCall[5]
	$sName = DllStructGetData($tName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport2_GetGenericParamProps

Func IMetaDataImport2_GetMethodSpecProps($pThis, $iMethodSpecTkn, ByRef $iParentTkn, ByRef $dSignature)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iMethodSpecTkn) <> $MDT_MethodSpec Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 68)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodSpecTkn, "ulong*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iParentTkn = $aCall[3]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[5]), $aCall[4])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport2_GetMethodSpecProps

Func IMetaDataImport2_GetPEKind($pThis, ByRef $iPEKind, ByRef $iArch)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 71)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "uint*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iPEKind = $aCall[2]
	$iArch = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IMetaDataImport2_GetPEKind

Func IMetaDataImport2_GetVersionString($pThis)
	Local $vFailVal = "", $sVersion = ""
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 72)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", "", "ulong", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	If $aCall[4] Then
		Local $tBuffer = DllStructCreate(StringFormat("wchar[%d]", $aCall[4]))
		$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tBuffer, "ulong", $aCall[4], "ulong*", 0)
		If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
		$sVersion = DllStructGetData($tBuffer, 1)
	EndIf
	Return SetError($aCall[0], 0, $sVersion)
EndFunc   ;==>IMetaDataImport2_GetVersionString

Func IMetaDataImport_CloseEnum($pThis, ByRef $pEnum)
	Local $vFailVal = False
	If (Not IsPtr($pEnum)) Or (Not $pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	DllCallAddress("none", $pFunc, "ptr", $pThis, "ptr", $pEnum)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = Ptr(0)
	Return True
EndFunc   ;==>IMetaDataImport_CloseEnum

Func IMetaDataImport_CountEnum($pThis, $pEnum)
	Local $vFailVal = -1
	If (Not IsPtr($pEnum)) Or (Not $pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pEnum, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMetaDataImport_CountEnum

Func IMetaDataImport_EnumCustomAttributes($pThis, ByRef $pEnum, $iToken, $iTokenType, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) And ($iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iTokenType)) And ($iTokenType) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 54)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "ulong", $iTokenType, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>IMetaDataImport_EnumCustomAttributes

Func IMetaDataImport_EnumEvents($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 34, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumEvents

Func IMetaDataImport_EnumFields($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 21, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumFields

Func IMetaDataImport_EnumFieldsWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 22, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumFieldsWithName

Func IMetaDataImport_EnumInterfaceImpls($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 8, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumInterfaceImpls

Func IMetaDataImport_EnumMemberRefs($pThis, ByRef $pEnum, $iParentTkn, $iMaxTokens)
	Local $vFailVal[0]
	Local $iTokenType = BitAND(0xFF000000, $iParentTkn)
	Local $aValidTknTypes = [$MDT_TypeDef, $MDT_TypeRef, $MDT_MethodDef, $MDT_ModuleRef]
	For $i = 0 To UBound($aValidTknTypes) - 1
		If $iTokenType = $aValidTknTypes[$i] Then ExitLoop
	Next
	If $i = UBound($aValidTknTypes) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 24, $pEnum, $iParentTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMemberRefs

Func IMetaDataImport_EnumMembers($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 17, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMembers

Func IMetaDataImport_EnumMembersWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 18, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMembersWithName

Func IMetaDataImport_EnumMethodImpls($pThis, ByRef $pEnum, $iTypeDefTkn, ByRef $aBodyTkns, ByRef $aDeclTkns, $iMaxTokens)
	Local $vFailVal = False
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 25)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tBodyTkns = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pBodyTkns = DllStructGetPtr($tBodyTkns)
	Local $tDeclTkns = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pDeclTkns = DllStructGetPtr($tDeclTkns)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iTypeDefTkn, "ptr", $pBodyTkns, "ptr", $pDeclTkns, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	$aBodyTkns = $aTokens
	$aDeclTkns = $aTokens
	For $i = 0 To UBound($aTokens) - 1
		$aBodyTkns[$i] = DllStructGetData($tBodyTkns, 1, $i + 1)
		$aDeclTkns[$i] = DllStructGetData($tDeclTkns, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_EnumMethodImpls

Func IMetaDataImport_EnumMethods($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 19, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethods

Func IMetaDataImport_EnumMethodSemantics($pThis, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 36, $pEnum, $iMethodDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethodSemantics

Func IMetaDataImport_EnumMethodsWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 20, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethodsWithName

Func IMetaDataImport_EnumModuleRefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 44, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumModuleRefs

Func IMetaDataImport_EnumParams($pThis, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 23, $pEnum, $iMethodDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumParams

Func IMetaDataImport_EnumPermissionSets($pThis, ByRef $pEnum, $iToken, $iSecActions, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 26)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "dword", $iSecActions, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($aTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>IMetaDataImport_EnumPermissionSets

Func IMetaDataImport_EnumProperties($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 33, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumProperties

Func IMetaDataImport_EnumSignatures($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 50, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumSignatures

Func IMetaDataImport_EnumTypeDefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 7, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeDefs

Func IMetaDataImport_EnumTypeRefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 9, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeRefs

Func IMetaDataImport_EnumTypeSpecs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 51, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeSpecs

Func IMetaDataImport_EnumUnresolvedMethods($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 47, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumUnresolvedMethods

Func IMetaDataImport_EnumUserStrings($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 52, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumUserStrings

Func IMetaDataImport_FindField($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 29, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindField

Func IMetaDataImport_FindMember($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 27, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMember

Func IMetaDataImport_FindMemberRef($pThis, $iTypeRefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeRefTkn And BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 30, $iTypeRefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMemberRef

Func IMetaDataImport_FindMethod($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 28, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMethod

Func IMetaDataImport_FindTypeDefByName($pThis, $sName, $iEncClassTkn)
	Local $vFailVal = -1
	If $sName And (Not IsString($sName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iEncClassTkn Then
		Local $iTokenType = BitAND(0xFF000000, $iEncClassTkn)
		If $iTokenType <> $MDT_TypeRef And $iTokenType <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndIf
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", $sName, "ulong", $iEncClassTkn, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_FindTypeDefByName

Func IMetaDataImport_FindTypeRef($pThis, $iResScopeTkn, $sName)
	Local $vFailVal = -1
	Local $iTokenType = BitAND(0xFF000000, $iResScopeTkn)
	Local $aValidTknTypes = [$MDT_ModuleRef, $MDT_AssemblyRef, $MDT_TypeRef]
	For $i = 0 To UBound($aValidTknTypes) - 1
		If $iTokenType = $aValidTknTypes[$i] Then ExitLoop
	Next
	If $iResScopeTkn And (Not IsInt($iResScopeTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 56)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iResScopeTkn, "wstr", $sName, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_FindTypeRef

Func IMetaDataImport_GetClassLayout($pThis, $iTypeDefTkn, ByRef $iPackSize, ByRef $aFieldOffsets, ByRef $iClassSize)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 38)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "uint*", 0, "ptr", 0, "uint", 0, "uint*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tOffsets = DllStructCreate(StringFormat("ulong[%d];", 2 * $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "uint*", 0, "struct*", $tOffsets, "uint", $aCall[6], "uint*", 0, "uint*", 0)
	$iPackSize = $aCall[3]
	Local $aOffsets[$aCall[6]][2]
	For $i = 0 To UBound($aOffsets) - 1
		$aOffsets[$i + 1][0] = DllStructGetData($tOffsets, 1, 2 * $i + 1)
		$aOffsets[$i + 1][1] = DllStructGetData($tOffsets, 1, 2 * $i + 2)
	Next
	$aFieldOffsets = $aOffsets
	$iClassSize = $aCall[7]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetClassLayout

Func IMetaDataImport_GetCustomAttributeByName($pThis, $iObjectTkn, $sName)
	Local $vFailVal = Binary("0x")
	If $iObjectTkn And (Not IsInt($iObjectTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 61)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iObjectTkn, "wstr", $sName, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tData = DllStructCreate(StringFormat("byte[%d]", $aCall[5]), $aCall[4])
	Local $dData = (@error) ? $vFailVal : DllStructGetData($tData, 1)
	Return SetError($aCall[0], 0, $dData)
EndFunc   ;==>IMetaDataImport_GetCustomAttributeByName

Func IMetaDataImport_GetCustomAttributeProps($pThis, $iCustomAttribTkn, ByRef $iObjectTkn, ByRef $iTypeTkn, ByRef $dValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iCustomAttribTkn) <> $MDT_CustomAttribute Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 55)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iCustomAttribTkn, "ulong*", 0, "ulong*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iObjectTkn = $aCall[3]
	$iTypeTkn = $aCall[4]
	Local $tValue = DllStructCreate(StringFormat("byte[%d]", $aCall[6]), $aCall[5])
	$dValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetCustomAttributeProps

Func IMetaDataImport_GetEventProps($pThis, $iEventTkn, ByRef $iTypeDefTkn, ByRef $sEventName, ByRef $iEventFlags, ByRef $iEventTypeTkn, ByRef $iMthdTknAddOn, ByRef $iMthdTknRemoveOn, ByRef $iMthdTknFire, ByRef $aMthdTknsOther, $iMaxOtherMethods)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iEventTkn) <> $MDT_Event Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxOtherMethods)) Or ($iMaxOtherMethods < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 35)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iEventTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "ptr", 0, "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxOtherMethods))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iEventTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "struct*", $tTokens, "uint", $iMaxOtherMethods, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sEventName = DllStructGetData($tName, 1)
	If @error Then $sEventName = ""
	$iEventFlags = $aCall[7]
	$iEventTypeTkn = $aCall[8]
	$iMthdTknAddOn = $aCall[9]
	$iMthdTknRemoveOn = $aCall[10]
	$iMthdTknFire = $aCall[11]
	Local $aTokens[$aCall[14]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, $i + 1)
	Next
	$aMthdTknsOther = $aTokens
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetEventProps

Func IMetaDataImport_GetFieldMarshal($pThis, $iToken)
	Local $vFailVal = Binary("0x")
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 39)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[4]), $aCall[3])
	Return SetError(@error, 0, DllStructGetData($tSig, 1))
EndFunc   ;==>IMetaDataImport_GetFieldMarshal

Func IMetaDataImport_GetFieldProps($pThis, $iFieldDefTkn, ByRef $iTypeDefTkn, ByRef $sFieldName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iValueType, ByRef $vValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iFieldDefTkn) <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 58)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iFieldDefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iFieldDefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sFieldName = DllStructGetData($tName, 1)
	If @error Then $sFieldName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iValueType = $aCall[10]
	Local $tValue
	Switch $aCall[10]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[12]), $aCall[11])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[10]], $aCall[11])
	EndSwitch
	$vValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetFieldProps

Func IMetaDataImport_GetInterfaceImplProps($pThis, $iIfaceImplTkn, ByRef $iClassToken, ByRef $iIfaceToken)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iIfaceImplTkn) <> $MDT_InterfaceImpl Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iIfaceImplTkn, "ulong*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iClassToken = $aCall[3]
	$iIfaceToken = $aCall[4]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetInterfaceImplProps

Func IMetaDataImport_GetMemberProps($pThis, $iMemberTkn, ByRef $iTypeDefTkn, ByRef $sMemberName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iRelVAddress, ByRef $iImplFlags, ByRef $iDefValueType, ByRef $vDefValue)
	Local $vFailVal = False
	If $iMemberTkn And (Not IsInt($iMemberTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 57)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sMemberName = DllStructGetData($tName, 1)
	If @error Then $sMemberName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iRelVAddress = $aCall[10]
	$iImplFlags = $aCall[11]
	$iDefValueType = $aCall[12]
	Local $tValue
	Switch $aCall[12]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[14]), $aCall[13])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[12]], $aCall[13])
	EndSwitch
	$vDefValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetMemberProps

Func IMetaDataImport_GetMemberRefProps($pThis, $iMemberRefTkn, ByRef $iTypeTkn, ByRef $sMemberName, ByRef $dSignature)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iMemberRefTkn) <> $MDT_MemberRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 32)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberRefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberRefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeTkn = $aCall[3]
	$sMemberName = DllStructGetData($tName, 1)
	If @error Then $sMemberName = ""
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[8]), $aCall[7])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetMemberRefProps

Func IMetaDataImport_GetMethodProps($pThis, $iMethodDefTkn, ByRef $iTypeDefTkn, ByRef $sMethodName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iRelVAddress, ByRef $iImplFlags)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 31)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr", 0, "uint*", 0, "uint*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sMethodName = DllStructGetData($tName, 1)
	If @error Then $sMethodName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iRelVAddress = $aCall[10]
	$iImplFlags = $aCall[11]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetMethodProps

Func IMetaDataImport_GetMethodSemantics($pThis, $iMethodDefTkn, $iEventPropTkn)
	Local $vFailVal = -1
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If BitAND(0xFF000000, $iEventPropTkn) <> $MDT_Property Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 37)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong", $iEventPropTkn, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError(@error, 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_GetMethodSemantics

Func IMetaDataImport_GetModuleFromScope($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMetaDataImport_GetModuleFromScope

Func IMetaDataImport_GetModuleRefProps($pThis, $iModuleRefTkn, ByRef $sName)
	Local $vFailVal = ""
	If BitAND(0xFF000000, $iModuleRefTkn) <> $MDT_ModuleRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 43)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iModuleRefTkn, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iModuleRefTkn, "struct*", $tName, "uint", $aCall[5], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$sName = DllStructGetData($tName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetModuleRefProps

Func IMetaDataImport_GetNameFromToken($pThis, $iToken)
	Local $vFailVal = "", $sName
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 46)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$sName = _WinAPI_MultiByteToWideChar($aCall[3], $CP_UTF8, 0, True)
	If Not $sName Then $sName = ""
	Return SetError($aCall[0], 0, $sName)
EndFunc   ;==>IMetaDataImport_GetNameFromToken

Func IMetaDataImport_GetNativeCallConvFromSig($pThis, $dSignature)
	Local $vFailVal = -1
	If Not IsBinary($dSignature) Or (Not $dSignature) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iSigLen = BinaryLen($dSignature)
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $iSigLen))
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 64)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tSig, "uint", $iSigLen, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_GetNativeCallConvFromSig

Func IMetaDataImport_GetNestedClassProps($pThis, $iTypeDefTkn)
	Local $vFailVal = -1
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 63)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMetaDataImport_GetNestedClassProps

Func IMetaDataImport_GetParamForMethodIndex($pThis, $iMethodDefTkn, $iSequence)
	Local $vFailVal = 0
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iSequence < 0 Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 53)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "uint", $iSequence, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_GetParamForMethodIndex

Func IMetaDataImport_GetParamProps($pThis, $iParamDefTkn, ByRef $iMethodDefTkn, ByRef $iSequence, ByRef $sParamName, ByRef $iAttribFlags, ByRef $iValueType, ByRef $vValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iParamDefTkn) <> $MDT_ParamDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 60)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iParamDefTkn, "ulong*", 0, "uint*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[7]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iParamDefTkn, "ulong*", 0, "uint*", 0, "struct*", $tName, "uint", $aCall[7], "uint*", 0, "dword*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iMethodDefTkn = $aCall[3]
	$iSequence = $aCall[4]
	$sParamName = DllStructGetData($tName, 1)
	If @error Then $sParamName = ""
	$iAttribFlags = $aCall[8]
	$iValueType = $aCall[9]
	Local $tValue
	Switch $aCall[9]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[11]), $aCall[10])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[9]], $aCall[10])
	EndSwitch
	$vValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetParamProps

Func IMetaDataImport_GetPermissionSetProps($pThis, $iPermTkn, ByRef $iAction, ByRef $dSignature)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iPermTkn) <> $MDT_Permission Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 41)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPermTkn, "ulong*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[5]), $aCall[4])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iAction = $aCall[3]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetPermissionSetProps

Func IMetaDataImport_GetPinvokeMap($pThis, $iToken, ByRef $iMapFlags, ByRef $sImportName, ByRef $iImportDllTkn)
	Local $vFailVal = False
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If $iTokenType <> $MDT_MethodDef And $iTokenType <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 49)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "dword*", 0, "wstr", "", "uint", 0, "uint*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "dword*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iMapFlags = $aCall[3]
	$sImportName = DllStructGetData($tName, 1)
	If @error Then $sImportName = ""
	$iImportDllTkn = $aCall[7]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetPinvokeMap

Func IMetaDataImport_GetPropertyProps($pThis, $iPropertyTkn, ByRef $iTypeDefTkn, ByRef $sPropertyName, ByRef $iPropertyFlags, ByRef $dSignature, ByRef $iDefValueType, ByRef $vDefValue, ByRef $iMthdTknSetter, ByRef $iMthdTknGetter, ByRef $aMthdTknsOther, $iMaxOtherMethods)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iPropertyTkn) <> $MDT_Property Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxOtherMethods)) Or ($iMaxOtherMethods < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 59)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPropertyTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "ulong*", 0, "ulong*", 0, "ptr", 0, "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxOtherMethods))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPropertyTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "ulong*", 0, "ulong*", 0, "struct*", $tTokens, "uint", $iMaxOtherMethods, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sPropertyName = DllStructGetData($tName, 1)
	If @error Then $sPropertyName = ""
	$iPropertyFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iDefValueType = $aCall[10]
	Local $tValue
	Switch $aCall[10]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[12]), $aCall[11])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[10]], $aCall[11])
	EndSwitch
	$vDefValue = DllStructGetData($tValue, 1)
	$iMthdTknSetter = $aCall[13]
	$iMthdTknGetter = $aCall[14]
	Local $aTokens[$aCall[17]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, $i + 1)
	Next
	$aMthdTknsOther = $aTokens
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetPropertyProps

Func IMetaDataImport_GetRVA($pThis, $iToken, ByRef $iRVA, ByRef $iImplFlags)
	Local $vFailVal = False
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If $iTokenType <> $MDT_MethodDef And $iTokenType <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 40)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ulong*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iRVA = $aCall[3]
	$iImplFlags = $aCall[4]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetRVA

Func IMetaDataImport_GetScopeProps($pThis, ByRef $sName, ByRef $sModuleVers)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", "", "ulong", 0, "ulong*", 0, "ptr", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	If $aCall[4] Then
		Local $tBuffer = DllStructCreate(StringFormat("wchar[%d]", $aCall[4]))
		Local $tModuleVers = DllStructCreate($tagGUID)
		$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tBuffer, "ulong", $aCall[4], "ulong*", 0, "struct*", $tModuleVers)
		If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
		$sModuleVers = _WinAPI_StringFromGUID($tModuleVers)
		$sName = DllStructGetData($tBuffer, 1)
	Else
		$sName = ""
		$sModuleVers = ""
	EndIf
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetScopeProps

Func IMetaDataImport_GetSigFromToken($pThis, $iToken)
	Local $vFailVal = Binary("0x")
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 42)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[4]), $aCall[3])
	Local $dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	Return SetError(@error, 0, $dSignature)
EndFunc   ;==>IMetaDataImport_GetSigFromToken

Func IMetaDataImport_GetTypeDefProps($pThis, $iTypeDefTkn, ByRef $sTypeName, ByRef $iFlags, ByRef $iExtendsTkn)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tTypeName = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "struct*", $tTypeName, "uint", $aCall[5], "uint*", 0, "dword*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iFlags = $aCall[6]
	$iExtendsTkn = $aCall[7]
	$sTypeName = DllStructGetData($tTypeName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetTypeDefProps

Func IMetaDataImport_GetTypeRefProps($pThis, $iTypeRefTkn, ByRef $iResScopeTkn, ByRef $sTypeName)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tTypeName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "ulong*", 0, "struct*", $tTypeName, "uint", $aCall[6], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iResScopeTkn = $aCall[3]
	$sTypeName = DllStructGetData($tTypeName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetTypeRefProps

Func IMetaDataImport_GetTypeSpecFromToken($pThis, $iTypeSpecTkn)
	Local $vFailVal = Binary("0x")
	If BitAND(0xFF000000, $iTypeSpecTkn) <> $MDT_TypeSpec Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 45)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeSpecTkn, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[4]), $aCall[3])
	Return SetError($aCall[0], 0, DllStructGetData($tSig, 1))
EndFunc   ;==>IMetaDataImport_GetTypeSpecFromToken

Func IMetaDataImport_GetUserString($pThis, $iStringTkn)
	Local $vFailVal = ""
	If BitAND(0xFF000000, $iStringTkn) <> $MDT_String Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 48)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iStringTkn, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tString = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iStringTkn, "struct*", $tString, "uint", $aCall[5], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, DllStructGetData($tString, 1))
EndFunc   ;==>IMetaDataImport_GetUserString

Func IMetaDataImport_IsGlobal($pThis, $iToken)
	Local $vFailVal
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 65)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[3] = True))
EndFunc   ;==>IMetaDataImport_IsGlobal

Func IMetaDataImport_IsValidToken($pThis, $iToken)
	Local $vFailVal = False
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 62)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("bool", $pFunc, "ptr", $pThis, "ulong", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return ($aCall[0] = True)
EndFunc   ;==>IMetaDataImport_IsValidToken

Func IMetaDataImport_ResetEnum($pThis, $pEnum, $iPos)
	Local $vFailVal = False
	If (Not IsInt($iPos)) Or ($iPos < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pEnum, "uint", $iPos)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMetaDataImport_ResetEnum

Func IMetaDataImport_ResolveTypeRef($pThis, $iTypeRefTkn, $sRefIID, ByRef $pIScope, ByRef $iTypeDefTkn)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tRefIID = _WinAPI_GUIDFromString($sRefIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "struct*", $tRefIID, "ptr*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pIScope = $aCall[4]
	$iTypeDefTkn = $aCall[5]
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IMetaDataImport_ResolveTypeRef

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetConnection($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMiracastReceiverMediaSourceCreatedEventArgs_GetConnection

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetCursorImageChannelSettings($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMiracastReceiverMediaSourceCreatedEventArgs_GetCursorImageChannelSettings

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetDeferral($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMiracastReceiverMediaSourceCreatedEventArgs_GetDeferral

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IMiracastReceiverMediaSourceCreatedEventArgs_GetMediaSource

Func IRandomAccessStreamReference_OpenReadAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IRandomAccessStreamReference_OpenReadAsync

Func IRoSimpleMetaDataBuilder_SetDelegate($pThis, $sIID)
	Local $vFailVal = False
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 2)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "struct*", $tIID)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetDelegate

Func IRoSimpleMetaDataBuilder_SetEnum($pThis, $sName, $sBaseType)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $sBaseType And Not IsString($sBaseType) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "wstr", $sBaseType)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetEnum

Func IRoSimpleMetaDataBuilder_SetInterfaceGroupParameterizedDefault($pThis, $sName, $asDefaultInterfaceNameElements)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsArray($asDefaultInterfaceNameElements) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iElementCount = UBound($asDefaultInterfaceNameElements)
	Local $atBuffers[$iElementCount]
	Local $tDefaultInterfaceNameElements = DllStructCreate(StringFormat("ptr[%d]", $iElementCount))
	For $i = 0 To $iElementCount - 1
		$atBuffers[$i] = DllStructCreate(StringFormat("wchar[%d]", StringLen($asDefaultInterfaceNameElements[$i]) + 1))
		DllStructSetData($atBuffers[$i], 1, $asDefaultInterfaceNameElements[$i])
		DllStructSetData($tDefaultInterfaceNameElements, 1, DllStructGetPtr($atBuffers[$i]), $i + 1)
	Next
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "int", $iElementCount, "struct*", $tDefaultInterfaceNameElements)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetInterfaceGroupParameterizedDefault

Func IRoSimpleMetaDataBuilder_SetInterfaceGroupSimpleDefault($pThis, $sName, $sDefaultInterfaceName, $sDefaultInterfaceIID)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 3)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $sDefaultInterfaceName And Not IsString($sDefaultInterfaceName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sDefaultInterfaceIID)
	If @error Then $tIID = 0
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "wstr", $sDefaultInterfaceName, IsDllStruct($tIID) ? "struct*" : "ptr", $tIID)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetInterfaceGroupSimpleDefault

Func IRoSimpleMetaDataBuilder_SetParameterizedDelegate($pThis, $sPIID, $iNumArgs)
	Local $vFailVal = False
	Local $tIID = _WinAPI_GUIDFromString($sPIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $iNumArgs And Not IsInt($iNumArgs) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "struct*", $tIID, "int", $iNumArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetParameterizedDelegate

Func IRoSimpleMetaDataBuilder_SetParameterizedInterface($pThis, $sPIID, $iNumArgs)
	Local $vFailVal = False
	Local $tIID = _WinAPI_GUIDFromString($sPIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $iNumArgs And Not IsInt($iNumArgs) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "struct*", $tIID, "int", $iNumArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetParameterizedInterface

Func IRoSimpleMetaDataBuilder_SetRuntimeClassParameterizedDefault($pThis, $sName, $asDefaultInterfaceNameElements)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsArray($asDefaultInterfaceNameElements) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iElementCount = UBound($asDefaultInterfaceNameElements)
	Local $atBuffers[$iElementCount]
	Local $tDefaultInterfaceNameElements = DllStructCreate(StringFormat("ptr[%d]", $iElementCount))
	For $i = 0 To $iElementCount - 1
		$atBuffers[$i] = DllStructCreate(StringFormat("wchar[%d]", StringLen($asDefaultInterfaceNameElements[$i]) + 1))
		DllStructSetData($atBuffers[$i], 1, $asDefaultInterfaceNameElements[$i])
		DllStructSetData($tDefaultInterfaceNameElements, 1, DllStructGetPtr($atBuffers[$i]), $i + 1)
	Next
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "int", $iElementCount, "struct*", $tDefaultInterfaceNameElements)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetRuntimeClassParameterizedDefault

Func IRoSimpleMetaDataBuilder_SetRuntimeClassSimpleDefault($pThis, $sName, $sDefaultInterfaceName, $sDefaultInterfaceIID)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $sDefaultInterfaceName And Not IsString($sDefaultInterfaceName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sDefaultInterfaceIID)
	If @error Then $tIID = 0
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "wstr", $sDefaultInterfaceName, IsDllStruct($tIID) ? "struct*" : "ptr", $tIID)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetRuntimeClassSimpleDefault

Func IRoSimpleMetaDataBuilder_SetStruct($pThis, $sName, $asFieldTypeNames)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sName And Not IsString($sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsArray($asFieldTypeNames) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iNumFields = UBound($asFieldTypeNames)
	Local $atBuffers[$iNumFields]
	Local $tFieldTypeNames = DllStructCreate(StringFormat("ptr[%d]", $iNumFields))
	For $i = 0 To $iNumFields - 1
		$atBuffers[$i] = DllStructCreate(StringFormat("wchar[%d]", StringLen($asFieldTypeNames[$i]) + 1))
		DllStructSetData($atBuffers[$i], 1, $asFieldTypeNames[$i])
		DllStructSetData($tFieldTypeNames, 1, DllStructGetPtr($atBuffers[$i]), $i + 1)
	Next

	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "wstr", $sName, "int", $iNumFields, "struct*", $tFieldTypeNames)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)

	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetStruct

Func IRoSimpleMetaDataBuilder_SetWinRtInterface($pThis, $sIID)
	Local $vFailVal = False
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 1)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis, "struct*", $tIID)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>IRoSimpleMetaDataBuilder_SetWinRtInterface

Func IStorageFile2_OpenAsync($pThis, $iAccessMode, $iOptions)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iAccessMode) And (Not IsInt($iAccessMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iOptions) And (Not IsInt($iOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iAccessMode, "ulong", $iOptions, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageFile2_OpenAsync

Func IStorageFile2_OpenTransactedWriteAsync($pThis, $iOptions)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iOptions) And (Not IsInt($iOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iOptions, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile2_OpenTransactedWriteAsync

Func IStorageFile_CopyAndReplaceAsync($pThis, $pFileToReplace)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile_CopyAndReplaceAsync

Func IStorageFile_CopyAsync($pThis, $pDestinationFolder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile_CopyAsync

Func IStorageFile_CopyAsync2($pThis, $pDestinationFolder, $sDesiredNewName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageFile_CopyAsync2

Func IStorageFile_CopyAsync3($pThis, $pDestinationFolder, $sDesiredNewName, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ulong", $iOption, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFile_CopyAsync3

Func IStorageFile_GetContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageFile_GetContentType

Func IStorageFile_GetFileType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageFile_GetFileType

Func IStorageFile_MoveAndReplaceAsync($pThis, $pFileToReplace)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 18)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile_MoveAndReplaceAsync

Func IStorageFile_MoveAsync($pThis, $pDestinationFolder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile_MoveAsync

Func IStorageFile_MoveAsync2($pThis, $pDestinationFolder, $sDesiredNewName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageFile_MoveAsync2

Func IStorageFile_MoveAsync3($pThis, $pDestinationFolder, $sDesiredNewName, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 17)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ulong", $iOption, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFile_MoveAsync3

Func IStorageFile_OpenAsync($pThis, $iAccessMode)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iAccessMode) And (Not IsInt($iAccessMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iAccessMode, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFile_OpenAsync

Func IStorageFile_OpenTransactedWriteAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IStorageFile_OpenTransactedWriteAsync

Func IStorageFilePropertiesWithAvailability_GetIsAvailable($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageFilePropertiesWithAvailability_GetIsAvailable

Func IStorageFileStatics2_GetFileFromPathForUserAsync($pThis, $pUser, $sPath)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUser And IsInt($pUser) Then $pUser = Ptr($pUser)
	If $pUser And (Not IsPtr($pUser)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sPath) And (Not IsString($sPath)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPath = _WinRT_CreateHString($sPath)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUser, "handle", $hPath, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hPath)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageFileStatics2_GetFileFromPathForUserAsync

Func IStorageFileStatics_CreateStreamedFileAsync($pThis, $sDisplayNameWithExtension, $pDataRequested, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDisplayNameWithExtension) And (Not IsString($sDisplayNameWithExtension)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDisplayNameWithExtension = _WinRT_CreateHString($sDisplayNameWithExtension)
	If $pDataRequested And IsInt($pDataRequested) Then $pDataRequested = Ptr($pDataRequested)
	If $pDataRequested And (Not IsPtr($pDataRequested)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDisplayNameWithExtension, "ptr", $pDataRequested, "ptr", $pThumbnail, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDisplayNameWithExtension)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFileStatics_CreateStreamedFileAsync

Func IStorageFileStatics_CreateStreamedFileFromUriAsync($pThis, $sDisplayNameWithExtension, $pUri, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDisplayNameWithExtension) And (Not IsString($sDisplayNameWithExtension)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDisplayNameWithExtension = _WinRT_CreateHString($sDisplayNameWithExtension)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDisplayNameWithExtension, "ptr", $pUri, "ptr", $pThumbnail, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDisplayNameWithExtension)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFileStatics_CreateStreamedFileFromUriAsync

Func IStorageFileStatics_GetFileFromApplicationUriAsync($pThis, $pUri)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFileStatics_GetFileFromApplicationUriAsync

Func IStorageFileStatics_GetFileFromPathAsync($pThis, $sPath)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sPath) And (Not IsString($sPath)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPath = _WinRT_CreateHString($sPath)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hPath, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hPath)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageFileStatics_GetFileFromPathAsync

Func IStorageFileStatics_ReplaceWithStreamedFileAsync($pThis, $pFileToReplace, $pDataRequested, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pDataRequested And IsInt($pDataRequested) Then $pDataRequested = Ptr($pDataRequested)
	If $pDataRequested And (Not IsPtr($pDataRequested)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr", $pDataRequested, "ptr", $pThumbnail, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFileStatics_ReplaceWithStreamedFileAsync

Func IStorageFileStatics_ReplaceWithStreamedFileFromUriAsync($pThis, $pFileToReplace, $pUri, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr", $pUri, "ptr", $pThumbnail, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageFileStatics_ReplaceWithStreamedFileFromUriAsync

Func IStorageItem2_GetParentAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IStorageItem2_GetParentAsync

Func IStorageItem2_IsEqual($pThis, $pItem)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pItem And IsInt($pItem) Then $pItem = Ptr($pItem)
	If $pItem And (Not IsPtr($pItem)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pItem, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItem2_IsEqual

Func IStorageItem_DeleteAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IStorageItem_DeleteAsync

Func IStorageItem_DeleteAsync2($pThis, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iOption, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItem_DeleteAsync2

Func IStorageItem_GetAttributes($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 14, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItem_GetAttributes

Func IStorageItem_GetBasicPropertiesAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IStorageItem_GetBasicPropertiesAsync

Func IStorageItem_GetDateCreated($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItem_GetDateCreated

Func IStorageItem_GetName($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItem_GetName

Func IStorageItem_GetPath($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItem_GetPath

Func IStorageItem_IsOfType($pThis, $iType)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iType) And (Not IsInt($iType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iType, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItem_IsOfType

Func IStorageItem_RenameAsync($pThis, $sDesiredName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDesiredName) And (Not IsString($sDesiredName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredName = _WinRT_CreateHString($sDesiredName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDesiredName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItem_RenameAsync

Func IStorageItem_RenameAsync2($pThis, $sDesiredName, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDesiredName) And (Not IsString($sDesiredName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredName = _WinRT_CreateHString($sDesiredName)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDesiredName, "ulong", $iOption, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageItem_RenameAsync2

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync($pThis, $iMode)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItemProperties2_GetScaledImageAsThumbnailAsync

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync2($pThis, $iMode, $iRequestedSize)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageItemProperties2_GetScaledImageAsThumbnailAsync2

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync3($pThis, $iMode, $iRequestedSize, $iOptions)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iOptions) And (Not IsInt($iOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ulong", $iOptions, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageItemProperties2_GetScaledImageAsThumbnailAsync3

Func IStorageItemProperties_GetDisplayName($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItemProperties_GetDisplayName

Func IStorageItemProperties_GetDisplayType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItemProperties_GetDisplayType

Func IStorageItemProperties_GetFolderRelativeId($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItemProperties_GetFolderRelativeId

Func IStorageItemProperties_GetProperties($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItemProperties_GetProperties

Func IStorageItemProperties_GetThumbnailAsync($pThis, $iMode)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IStorageItemProperties_GetThumbnailAsync

Func IStorageItemProperties_GetThumbnailAsync2($pThis, $iMode, $iRequestedSize)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IStorageItemProperties_GetThumbnailAsync2

Func IStorageItemProperties_GetThumbnailAsync3($pThis, $iMode, $iRequestedSize, $iOptions)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iOptions) And (Not IsInt($iOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ulong", $iOptions, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc   ;==>IStorageItemProperties_GetThumbnailAsync3

Func IStorageItemPropertiesWithProvider_GetProvider($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IStorageItemPropertiesWithProvider_GetProvider

Func IUIElement10_GetActualOffset($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 7, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement10_GetActualOffset

Func IUIElement10_GetActualSize($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 8, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement10_GetActualSize

Func IUIElement10_GetShadow($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement10_GetShadow

Func IUIElement10_GetUIContext($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement10_GetUIContext

Func IUIElement10_GetXamlRoot($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement10_GetXamlRoot

Func IUIElement10_SetShadow($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 13, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement10_SetShadow

Func IUIElement10_SetXamlRoot($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement10_SetXamlRoot

Func IUIElement2_CancelDirectManipulations($pThis)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IUIElement2_CancelDirectManipulations

Func IUIElement2_GetCompositeMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement2_GetCompositeMode

Func IUIElement2_SetCompositeMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement2_SetCompositeMode

Func IUIElement3_AddHdlrDragStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 11, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_AddHdlrDragStarting

Func IUIElement3_AddHdlrDropCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_AddHdlrDropCompleted

Func IUIElement3_GetCanDrag($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_GetCanDrag

Func IUIElement3_GetTransform3D($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_GetTransform3D

Func IUIElement3_RemoveHdlrDragStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 12, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_RemoveHdlrDragStarting

Func IUIElement3_RemoveHdlrDropCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_RemoveHdlrDropCompleted

Func IUIElement3_SetCanDrag($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_SetCanDrag

Func IUIElement3_SetTransform3D($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement3_SetTransform3D

Func IUIElement3_StartDragAsync($pThis, $pPointerPoint)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pPointerPoint And IsInt($pPointerPoint) Then $pPointerPoint = Ptr($pPointerPoint)
	If $pPointerPoint And (Not IsPtr($pPointerPoint)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pPointerPoint, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUIElement3_StartDragAsync

Func IUIElement4_AddHdlrAccessKeyDisplayDismissed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_AddHdlrAccessKeyDisplayDismissed

Func IUIElement4_AddHdlrAccessKeyDisplayRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 21, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_AddHdlrAccessKeyDisplayRequested

Func IUIElement4_AddHdlrAccessKeyInvoked($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_AddHdlrAccessKeyInvoked

Func IUIElement4_AddHdlrContextCanceled($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 19, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_AddHdlrContextCanceled

Func IUIElement4_AddHdlrContextRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 17, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_AddHdlrContextRequested

Func IUIElement4_GetAccessKey($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_GetAccessKey

Func IUIElement4_GetAccessKeyScopeOwner($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_GetAccessKeyScopeOwner

Func IUIElement4_GetContextFlyout($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_GetContextFlyout

Func IUIElement4_GetExitDisplayModeOnAccessKeyInvoked($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_GetExitDisplayModeOnAccessKeyInvoked

Func IUIElement4_GetIsAccessKeyScope($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_GetIsAccessKeyScope

Func IUIElement4_RemoveHdlrAccessKeyDisplayDismissed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_RemoveHdlrAccessKeyDisplayDismissed

Func IUIElement4_RemoveHdlrAccessKeyDisplayRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 22, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_RemoveHdlrAccessKeyDisplayRequested

Func IUIElement4_RemoveHdlrAccessKeyInvoked($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_RemoveHdlrAccessKeyInvoked

Func IUIElement4_RemoveHdlrContextCanceled($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 20, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_RemoveHdlrContextCanceled

Func IUIElement4_RemoveHdlrContextRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 18, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_RemoveHdlrContextRequested

Func IUIElement4_SetAccessKey($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 16, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_SetAccessKey

Func IUIElement4_SetAccessKeyScopeOwner($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_SetAccessKeyScopeOwner

Func IUIElement4_SetContextFlyout($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_SetContextFlyout

Func IUIElement4_SetExitDisplayModeOnAccessKeyInvoked($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_SetExitDisplayModeOnAccessKeyInvoked

Func IUIElement4_SetIsAccessKeyScope($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement4_SetIsAccessKeyScope

Func IUIElement5_AddHdlrGettingFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 28, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_AddHdlrGettingFocus

Func IUIElement5_AddHdlrLosingFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 30, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_AddHdlrLosingFocus

Func IUIElement5_AddHdlrNoFocusCandidateFound($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 32, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_AddHdlrNoFocusCandidateFound

Func IUIElement5_GetHighContrastAdjustment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 24, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetHighContrastAdjustment

Func IUIElement5_GetKeyTipHorizontalOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetKeyTipHorizontalOffset

Func IUIElement5_GetKeyTipPlacementMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetKeyTipPlacementMode

Func IUIElement5_GetKeyTipVerticalOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetKeyTipVerticalOffset

Func IUIElement5_GetLights($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetLights

Func IUIElement5_GetTabFocusNavigation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetTabFocusNavigation

Func IUIElement5_GetXYFocusDownNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetXYFocusDownNavigationStrategy

Func IUIElement5_GetXYFocusKeyboardNavigation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 14, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetXYFocusKeyboardNavigation

Func IUIElement5_GetXYFocusLeftNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetXYFocusLeftNavigationStrategy

Func IUIElement5_GetXYFocusRightNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetXYFocusRightNavigationStrategy

Func IUIElement5_GetXYFocusUpNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_GetXYFocusUpNavigationStrategy

Func IUIElement5_RemoveHdlrGettingFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 29, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_RemoveHdlrGettingFocus

Func IUIElement5_RemoveHdlrLosingFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 31, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_RemoveHdlrLosingFocus

Func IUIElement5_RemoveHdlrNoFocusCandidateFound($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 33, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_RemoveHdlrNoFocusCandidateFound

Func IUIElement5_SetHighContrastAdjustment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 25, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetHighContrastAdjustment

Func IUIElement5_SetKeyTipHorizontalOffset($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetKeyTipHorizontalOffset

Func IUIElement5_SetKeyTipPlacementMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetKeyTipPlacementMode

Func IUIElement5_SetKeyTipVerticalOffset($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 13, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetKeyTipVerticalOffset

Func IUIElement5_SetTabFocusNavigation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 27, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetTabFocusNavigation

Func IUIElement5_SetXYFocusDownNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetXYFocusDownNavigationStrategy

Func IUIElement5_SetXYFocusKeyboardNavigation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 15, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetXYFocusKeyboardNavigation

Func IUIElement5_SetXYFocusLeftNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 21, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetXYFocusLeftNavigationStrategy

Func IUIElement5_SetXYFocusRightNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetXYFocusRightNavigationStrategy

Func IUIElement5_SetXYFocusUpNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement5_SetXYFocusUpNavigationStrategy

Func IUIElement5_StartBringIntoView($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 34)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement5_StartBringIntoView

Func IUIElement5_StartBringIntoView2($pThis, $pOptions)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 35)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pOptions And IsInt($pOptions) Then $pOptions = Ptr($pOptions)
	If $pOptions And (Not IsPtr($pOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pOptions)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement5_StartBringIntoView2

Func IUIElement7_AddHdlrCharacterReceived($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_AddHdlrCharacterReceived

Func IUIElement7_AddHdlrPreviewKeyDown($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 12, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_AddHdlrPreviewKeyDown

Func IUIElement7_AddHdlrPreviewKeyUp($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 14, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_AddHdlrPreviewKeyUp

Func IUIElement7_AddHdlrProcessKeyboardAccelerators($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_AddHdlrProcessKeyboardAccelerators

Func IUIElement7_GetKeyboardAccelerators($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_GetKeyboardAccelerators

Func IUIElement7_RemoveHdlrCharacterReceived($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_RemoveHdlrCharacterReceived

Func IUIElement7_RemoveHdlrPreviewKeyDown($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 13, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_RemoveHdlrPreviewKeyDown

Func IUIElement7_RemoveHdlrPreviewKeyUp($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 15, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_RemoveHdlrPreviewKeyUp

Func IUIElement7_RemoveHdlrProcessKeyboardAccelerators($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement7_RemoveHdlrProcessKeyboardAccelerators

Func IUIElement7_TryInvokeKeyboardAccelerator($pThis, $pArgs)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pArgs And IsInt($pArgs) Then $pArgs = Ptr($pArgs)
	If $pArgs And (Not IsPtr($pArgs)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement7_TryInvokeKeyboardAccelerator

Func IUIElement8_AddHdlrBringIntoViewRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_AddHdlrBringIntoViewRequested

Func IUIElement8_GetKeyboardAcceleratorPlacementMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_GetKeyboardAcceleratorPlacementMode

Func IUIElement8_GetKeyboardAcceleratorPlacementTarget($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_GetKeyboardAcceleratorPlacementTarget

Func IUIElement8_GetKeyTipTarget($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_GetKeyTipTarget

Func IUIElement8_RemoveHdlrBringIntoViewRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_RemoveHdlrBringIntoViewRequested

Func IUIElement8_SetKeyboardAcceleratorPlacementMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_SetKeyboardAcceleratorPlacementMode

Func IUIElement8_SetKeyboardAcceleratorPlacementTarget($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_SetKeyboardAcceleratorPlacementTarget

Func IUIElement8_SetKeyTipTarget($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement8_SetKeyTipTarget

Func IUIElement9_GetCanBeScrollAnchor($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetCanBeScrollAnchor

Func IUIElement9_GetCenterPoint($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 25, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement9_GetCenterPoint

Func IUIElement9_GetOpacityTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetOpacityTransition

Func IUIElement9_GetRotation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "float")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetRotation

Func IUIElement9_GetRotationAxis($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 27, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement9_GetRotationAxis

Func IUIElement9_GetRotationTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetRotationTransition

Func IUIElement9_GetScale($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 19, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement9_GetScale

Func IUIElement9_GetScaleTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetScaleTransition

Func IUIElement9_GetTransformMatrix($pThis)
	Local $tagValue = "float;float;float;float;float;float;float;float;float;float;float;float;float;float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 23, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement9_GetTransformMatrix

Func IUIElement9_GetTranslation($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 11, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement9_GetTranslation

Func IUIElement9_GetTranslationTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_GetTranslationTransition

Func IUIElement9_SetCanBeScrollAnchor($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetCanBeScrollAnchor

Func IUIElement9_SetCenterPoint($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 26, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetCenterPoint

Func IUIElement9_SetOpacityTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetOpacityTransition

Func IUIElement9_SetRotation($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "float", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetRotation

Func IUIElement9_SetRotationAxis($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 28, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetRotationAxis

Func IUIElement9_SetRotationTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetRotationTransition

Func IUIElement9_SetScale($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 20, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetScale

Func IUIElement9_SetScaleTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 22, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetScaleTransition

Func IUIElement9_SetTransformMatrix($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 24, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetTransformMatrix

Func IUIElement9_SetTranslation($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 12, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetTranslation

Func IUIElement9_SetTranslationTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement9_SetTranslationTransition

Func IUIElement9_StartAnimation($pThis, $pAnimation)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 29)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAnimation And IsInt($pAnimation) Then $pAnimation = Ptr($pAnimation)
	If $pAnimation And (Not IsPtr($pAnimation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAnimation)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement9_StartAnimation

Func IUIElement9_StopAnimation($pThis, $pAnimation)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 30)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAnimation And IsInt($pAnimation) Then $pAnimation = Ptr($pAnimation)
	If $pAnimation And (Not IsPtr($pAnimation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAnimation)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement9_StopAnimation

Func IUIElement_AddHandler($pThis, $pRoutedEvent, $pHandler, $bHandledEventsToo)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 97)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRoutedEvent And IsInt($pRoutedEvent) Then $pRoutedEvent = Ptr($pRoutedEvent)
	If $pRoutedEvent And (Not IsPtr($pRoutedEvent)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHandler And IsInt($pHandler) Then $pHandler = Ptr($pHandler)
	If $pHandler And (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($bHandledEventsToo) And (Not IsBool($bHandledEventsToo)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRoutedEvent, "ptr", $pHandler, "bool", $bHandledEventsToo)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_AddHandler

Func IUIElement_AddHdlrDoubleTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 76, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrDoubleTapped

Func IUIElement_AddHdlrDragEnter($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 50, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrDragEnter

Func IUIElement_AddHdlrDragLeave($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 52, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrDragLeave

Func IUIElement_AddHdlrDragOver($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 54, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrDragOver

Func IUIElement_AddHdlrDrop($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 56, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrDrop

Func IUIElement_AddHdlrGotFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 46, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrGotFocus

Func IUIElement_AddHdlrHolding($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 78, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrHolding

Func IUIElement_AddHdlrKeyDown($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrKeyDown

Func IUIElement_AddHdlrKeyUp($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 42, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrKeyUp

Func IUIElement_AddHdlrLostFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 48, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrLostFocus

Func IUIElement_AddHdlrManipulationCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 90, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrManipulationCompleted

Func IUIElement_AddHdlrManipulationDelta($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 88, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrManipulationDelta

Func IUIElement_AddHdlrManipulationInertiaStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 84, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrManipulationInertiaStarting

Func IUIElement_AddHdlrManipulationStarted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 86, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrManipulationStarted

Func IUIElement_AddHdlrManipulationStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 82, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrManipulationStarting

Func IUIElement_AddHdlrPointerCanceled($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 70, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerCanceled

Func IUIElement_AddHdlrPointerCaptureLost($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 68, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerCaptureLost

Func IUIElement_AddHdlrPointerEntered($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 64, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerEntered

Func IUIElement_AddHdlrPointerExited($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 66, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerExited

Func IUIElement_AddHdlrPointerMoved($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 60, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerMoved

Func IUIElement_AddHdlrPointerPressed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 58, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerPressed

Func IUIElement_AddHdlrPointerReleased($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 62, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerReleased

Func IUIElement_AddHdlrPointerWheelChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 72, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrPointerWheelChanged

Func IUIElement_AddHdlrRightTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 80, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrRightTapped

Func IUIElement_AddHdlrTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 74, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_AddHdlrTapped

Func IUIElement_Arrange($pThis, $tFinalRect)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 93)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tFinalRect) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tFinalRect)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_Arrange

Func IUIElement_CapturePointer($pThis, $pValue)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 94)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUIElement_CapturePointer

Func IUIElement_GetAllowDrop($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetAllowDrop

Func IUIElement_GetCacheMode($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetCacheMode

Func IUIElement_GetClip($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetClip

Func IUIElement_GetDesiredSize($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 7, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement_GetDesiredSize

Func IUIElement_GetIsDoubleTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetIsDoubleTapEnabled

Func IUIElement_GetIsHitTestVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetIsHitTestVisible

Func IUIElement_GetIsHoldingEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetIsHoldingEnabled

Func IUIElement_GetIsRightTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetIsRightTapEnabled

Func IUIElement_GetIsTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetIsTapEnabled

Func IUIElement_GetManipulationMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 39, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetManipulationMode

Func IUIElement_GetOpacity($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetOpacity

Func IUIElement_GetPointerCaptures($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetPointerCaptures

Func IUIElement_GetProjection($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetProjection

Func IUIElement_GetRenderSize($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 24, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement_GetRenderSize

Func IUIElement_GetRenderTransform($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetRenderTransform

Func IUIElement_GetRenderTransformOrigin($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 18, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc   ;==>IUIElement_GetRenderTransformOrigin

Func IUIElement_GetTransitions($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetTransitions

Func IUIElement_GetUseLayoutRounding($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetUseLayoutRounding

Func IUIElement_GetVisibility($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_GetVisibility

Func IUIElement_InvalidateArrange($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 101)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_InvalidateArrange

Func IUIElement_InvalidateMeasure($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 100)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_InvalidateMeasure

Func IUIElement_Measure($pThis, $tAvailableSize)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 92)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tAvailableSize) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tAvailableSize)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_Measure

Func IUIElement_ReleasePointerCapture($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 95)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_ReleasePointerCapture

Func IUIElement_ReleasePointerCaptures($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 96)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_ReleasePointerCaptures

Func IUIElement_RemoveHandler($pThis, $pRoutedEvent, $pHandler)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 98)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRoutedEvent And IsInt($pRoutedEvent) Then $pRoutedEvent = Ptr($pRoutedEvent)
	If $pRoutedEvent And (Not IsPtr($pRoutedEvent)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHandler And IsInt($pHandler) Then $pHandler = Ptr($pHandler)
	If $pHandler And (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRoutedEvent, "ptr", $pHandler)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_RemoveHandler

Func IUIElement_RemoveHdlrDoubleTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 77, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrDoubleTapped

Func IUIElement_RemoveHdlrDragEnter($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 51, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrDragEnter

Func IUIElement_RemoveHdlrDragLeave($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 53, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrDragLeave

Func IUIElement_RemoveHdlrDragOver($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 55, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrDragOver

Func IUIElement_RemoveHdlrDrop($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 57, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrDrop

Func IUIElement_RemoveHdlrGotFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 47, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrGotFocus

Func IUIElement_RemoveHdlrHolding($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 79, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrHolding

Func IUIElement_RemoveHdlrKeyDown($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrKeyDown

Func IUIElement_RemoveHdlrKeyUp($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 43, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrKeyUp

Func IUIElement_RemoveHdlrLostFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 49, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrLostFocus

Func IUIElement_RemoveHdlrManipulationCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 91, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrManipulationCompleted

Func IUIElement_RemoveHdlrManipulationDelta($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 89, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrManipulationDelta

Func IUIElement_RemoveHdlrManipulationInertiaStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 85, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrManipulationInertiaStarting

Func IUIElement_RemoveHdlrManipulationStarted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 87, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrManipulationStarted

Func IUIElement_RemoveHdlrManipulationStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 83, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrManipulationStarting

Func IUIElement_RemoveHdlrPointerCanceled($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 71, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerCanceled

Func IUIElement_RemoveHdlrPointerCaptureLost($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 69, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerCaptureLost

Func IUIElement_RemoveHdlrPointerEntered($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 65, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerEntered

Func IUIElement_RemoveHdlrPointerExited($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 67, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerExited

Func IUIElement_RemoveHdlrPointerMoved($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 61, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerMoved

Func IUIElement_RemoveHdlrPointerPressed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 59, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerPressed

Func IUIElement_RemoveHdlrPointerReleased($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 63, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerReleased

Func IUIElement_RemoveHdlrPointerWheelChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 73, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrPointerWheelChanged

Func IUIElement_RemoveHdlrRightTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 81, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrRightTapped

Func IUIElement_RemoveHdlrTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 75, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_RemoveHdlrTapped

Func IUIElement_SetAllowDrop($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 9, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetAllowDrop

Func IUIElement_SetCacheMode($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 30, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetCacheMode

Func IUIElement_SetClip($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 13, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetClip

Func IUIElement_SetIsDoubleTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 34, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetIsDoubleTapEnabled

Func IUIElement_SetIsHitTestVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 21, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetIsHitTestVisible

Func IUIElement_SetIsHoldingEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetIsHoldingEnabled

Func IUIElement_SetIsRightTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 36, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetIsRightTapEnabled

Func IUIElement_SetIsTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 32, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetIsTapEnabled

Func IUIElement_SetManipulationMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 40, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetManipulationMode

Func IUIElement_SetOpacity($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetOpacity

Func IUIElement_SetProjection($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 17, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetProjection

Func IUIElement_SetRenderTransform($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 15, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetRenderTransform

Func IUIElement_SetRenderTransformOrigin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 19, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetRenderTransformOrigin

Func IUIElement_SetTransitions($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 28, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetTransitions

Func IUIElement_SetUseLayoutRounding($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 26, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetUseLayoutRounding

Func IUIElement_SetVisibility($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElement_SetVisibility

Func IUIElement_TransformToVisual($pThis, $pVisual)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 99)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pVisual And IsInt($pVisual) Then $pVisual = Ptr($pVisual)
	If $pVisual And (Not IsPtr($pVisual)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pVisual, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUIElement_TransformToVisual

Func IUIElement_UpdateLayout($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 102)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElement_UpdateLayout

Func IUIElementOverrides7_GetChildrenInTabFocusOrder($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IUIElementOverrides7_GetChildrenInTabFocusOrder

Func IUIElementOverrides7_OnProcessKeyboardAccelerators($pThis, $pArgs)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pArgs And IsInt($pArgs) Then $pArgs = Ptr($pArgs)
	If $pArgs And (Not IsPtr($pArgs)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementOverrides7_OnProcessKeyboardAccelerators

Func IUIElementOverrides8_OnBringIntoViewRequested($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementOverrides8_OnBringIntoViewRequested

Func IUIElementOverrides8_OnKeyboardAcceleratorInvoked($pThis, $pArgs)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pArgs And IsInt($pArgs) Then $pArgs = Ptr($pArgs)
	If $pArgs And (Not IsPtr($pArgs)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementOverrides8_OnKeyboardAcceleratorInvoked

Func IUIElementOverrides9_PopulatePropertyInfoOverride($pThis, $sPropertyName, $pAnimationPropertyInfo)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sPropertyName) And (Not IsString($sPropertyName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPropertyName = _WinRT_CreateHString($sPropertyName)
	If $pAnimationPropertyInfo And IsInt($pAnimationPropertyInfo) Then $pAnimationPropertyInfo = Ptr($pAnimationPropertyInfo)
	If $pAnimationPropertyInfo And (Not IsPtr($pAnimationPropertyInfo)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hPropertyName, "ptr", $pAnimationPropertyInfo)
	Local $iError = @error
	_WinRT_DeleteHString($hPropertyName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementOverrides9_PopulatePropertyInfoOverride

Func IUIElementOverrides_FindSubElementsForTouchTargeting($pThis, $tPoint, $tBoundingRect)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tPoint) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsDllStruct($tBoundingRect) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tPoint, "struct", $tBoundingRect, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IUIElementOverrides_FindSubElementsForTouchTargeting

Func IUIElementOverrides_OnCreateAutomationPeer($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IUIElementOverrides_OnCreateAutomationPeer

Func IUIElementOverrides_OnDisconnectVisualChildren($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementOverrides_OnDisconnectVisualChildren

Func IUIElementStatics10_GetShadowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics10_GetShadowProperty

Func IUIElementStatics2_GetCompositeModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics2_GetCompositeModeProperty

Func IUIElementStatics3_GetCanDragProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics3_GetCanDragProperty

Func IUIElementStatics3_GetTransform3DProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics3_GetTransform3DProperty

Func IUIElementStatics3_TryStartDirectManipulation($pThis, $pValue)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUIElementStatics3_TryStartDirectManipulation

Func IUIElementStatics4_GetAccessKeyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics4_GetAccessKeyProperty

Func IUIElementStatics4_GetAccessKeyScopeOwnerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics4_GetAccessKeyScopeOwnerProperty

Func IUIElementStatics4_GetContextFlyoutProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics4_GetContextFlyoutProperty

Func IUIElementStatics4_GetExitDisplayModeOnAccessKeyInvokedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics4_GetExitDisplayModeOnAccessKeyInvokedProperty

Func IUIElementStatics4_GetIsAccessKeyScopeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics4_GetIsAccessKeyScopeProperty

Func IUIElementStatics5_GetHighContrastAdjustmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetHighContrastAdjustmentProperty

Func IUIElementStatics5_GetKeyTipHorizontalOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetKeyTipHorizontalOffsetProperty

Func IUIElementStatics5_GetKeyTipPlacementModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetKeyTipPlacementModeProperty

Func IUIElementStatics5_GetKeyTipVerticalOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetKeyTipVerticalOffsetProperty

Func IUIElementStatics5_GetLightsProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetLightsProperty

Func IUIElementStatics5_GetTabFocusNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetTabFocusNavigationProperty

Func IUIElementStatics5_GetXYFocusDownNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetXYFocusDownNavigationStrategyProperty

Func IUIElementStatics5_GetXYFocusKeyboardNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetXYFocusKeyboardNavigationProperty

Func IUIElementStatics5_GetXYFocusLeftNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetXYFocusLeftNavigationStrategyProperty

Func IUIElementStatics5_GetXYFocusRightNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetXYFocusRightNavigationStrategyProperty

Func IUIElementStatics5_GetXYFocusUpNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics5_GetXYFocusUpNavigationStrategyProperty

Func IUIElementStatics6_GetGettingFocusEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics6_GetGettingFocusEvent

Func IUIElementStatics6_GetLosingFocusEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics6_GetLosingFocusEvent

Func IUIElementStatics6_GetNoFocusCandidateFoundEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics6_GetNoFocusCandidateFoundEvent

Func IUIElementStatics7_GetCharacterReceivedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics7_GetCharacterReceivedEvent

Func IUIElementStatics7_GetPreviewKeyDownEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics7_GetPreviewKeyDownEvent

Func IUIElementStatics7_GetPreviewKeyUpEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics7_GetPreviewKeyUpEvent

Func IUIElementStatics8_GetBringIntoViewRequestedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics8_GetBringIntoViewRequestedEvent

Func IUIElementStatics8_GetContextRequestedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics8_GetContextRequestedEvent

Func IUIElementStatics8_GetKeyboardAcceleratorPlacementModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics8_GetKeyboardAcceleratorPlacementModeProperty

Func IUIElementStatics8_GetKeyboardAcceleratorPlacementTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics8_GetKeyboardAcceleratorPlacementTargetProperty

Func IUIElementStatics8_GetKeyTipTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics8_GetKeyTipTargetProperty

Func IUIElementStatics8_RegisterAsScrollPort($pThis, $pElement)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IUIElementStatics8_RegisterAsScrollPort

Func IUIElementStatics9_GetCanBeScrollAnchorProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics9_GetCanBeScrollAnchorProperty

Func IUIElementStatics_GetAllowDropProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetAllowDropProperty

Func IUIElementStatics_GetCacheModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 40)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetCacheModeProperty

Func IUIElementStatics_GetClipProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 32)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetClipProperty

Func IUIElementStatics_GetDoubleTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetDoubleTappedEvent

Func IUIElementStatics_GetDragEnterEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetDragEnterEvent

Func IUIElementStatics_GetDragLeaveEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetDragLeaveEvent

Func IUIElementStatics_GetDragOverEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 28)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetDragOverEvent

Func IUIElementStatics_GetDropEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetDropEvent

Func IUIElementStatics_GetHoldingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetHoldingEvent

Func IUIElementStatics_GetIsDoubleTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 42)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetIsDoubleTapEnabledProperty

Func IUIElementStatics_GetIsHitTestVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetIsHitTestVisibleProperty

Func IUIElementStatics_GetIsHoldingEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 44)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetIsHoldingEnabledProperty

Func IUIElementStatics_GetIsRightTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 43)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetIsRightTapEnabledProperty

Func IUIElementStatics_GetIsTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetIsTapEnabledProperty

Func IUIElementStatics_GetKeyDownEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetKeyDownEvent

Func IUIElementStatics_GetKeyUpEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetKeyUpEvent

Func IUIElementStatics_GetManipulationCompletedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationCompletedEvent

Func IUIElementStatics_GetManipulationDeltaEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationDeltaEvent

Func IUIElementStatics_GetManipulationInertiaStartingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationInertiaStartingEvent

Func IUIElementStatics_GetManipulationModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 45)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationModeProperty

Func IUIElementStatics_GetManipulationStartedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationStartedEvent

Func IUIElementStatics_GetManipulationStartingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetManipulationStartingEvent

Func IUIElementStatics_GetOpacityProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetOpacityProperty

Func IUIElementStatics_GetPointerCanceledEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerCanceledEvent

Func IUIElementStatics_GetPointerCaptureLostEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerCaptureLostEvent

Func IUIElementStatics_GetPointerCapturesProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 46)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerCapturesProperty

Func IUIElementStatics_GetPointerEnteredEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerEnteredEvent

Func IUIElementStatics_GetPointerExitedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerExitedEvent

Func IUIElementStatics_GetPointerMovedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerMovedEvent

Func IUIElementStatics_GetPointerPressedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerPressedEvent

Func IUIElementStatics_GetPointerReleasedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerReleasedEvent

Func IUIElementStatics_GetPointerWheelChangedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetPointerWheelChangedEvent

Func IUIElementStatics_GetProjectionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetProjectionProperty

Func IUIElementStatics_GetRenderTransformOriginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetRenderTransformOriginProperty

Func IUIElementStatics_GetRenderTransformProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetRenderTransformProperty

Func IUIElementStatics_GetRightTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetRightTappedEvent

Func IUIElementStatics_GetTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetTappedEvent

Func IUIElementStatics_GetTransitionsProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetTransitionsProperty

Func IUIElementStatics_GetUseLayoutRoundingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 38)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetUseLayoutRoundingProperty

Func IUIElementStatics_GetVisibilityProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc   ;==>IUIElementStatics_GetVisibilityProperty

Func IUIElementWeakCollectionFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IUIElementWeakCollectionFactory_CreateInstance

Func IUnknown_AddRef($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 2)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return $aCall[0]
EndFunc   ;==>IUnknown_AddRef

Func IUnknown_QueryInterface($pThis, $sIID)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 1)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tIID = _WinAPI_GUIDFromString($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUnknown_QueryInterface

Func IUnknown_Release($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 3)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return $aCall[0]
EndFunc   ;==>IUnknown_Release

Func IWindowsXamlManagerStatics_InitializeForCurrentThread($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IWindowsXamlManagerStatics_InitializeForCurrentThread

Func IMediaPlaybackSession_AddHdlrBufferingEnded($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 15, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrBufferingProgressChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 17, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrBufferingStarted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrDownloadProgressChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 19, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrNaturalDurationChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 21, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrNaturalVideoSizeChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrPlaybackRateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrPlaybackStateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrPositionChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_AddHdlrSeekCompleted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 11, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetBufferingProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 37, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetCanPause($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetCanSeek($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 32)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetDownloadProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 38, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetIsProtected($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetNaturalDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 28, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetNaturalVideoHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 39, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetNaturalVideoWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 40, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetNormalizedSourceRect($pThis)
	Local $tagValue = "float;float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 41, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IMediaPlaybackSession_GetPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 35, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetPlaybackState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 31, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 29, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_GetStereoscopicVideoPackingMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 43, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrBufferingEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 16, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrBufferingProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 18, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrBufferingStarted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrDownloadProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 20, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrNaturalDurationChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 22, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrNaturalVideoSizeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrPlaybackRateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrPlaybackStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrPositionChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_RemoveHdlrSeekCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 12, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_SetNormalizedSourceRect($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 42, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_SetPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 36, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_SetPosition($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 30, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession_SetStereoscopicVideoPackingMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 44, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_AddHdlrBufferedRangesChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_AddHdlrPlayedRangesChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_AddHdlrSeekableRangesChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 11, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_AddHdlrSupportedPlaybackRatesChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_GetBufferedRanges($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 18)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IMediaPlaybackSession2_GetIsMirroring($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_GetPlayedRanges($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 19)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IMediaPlaybackSession2_GetSeekableRanges($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 20)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IMediaPlaybackSession2_GetSphericalVideoProjection($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_IsSupportedPlaybackRateRange($pThis, $fRate1, $fRate2)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 21)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($fRate1) And (Not IsNumber($fRate1)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($fRate2) And (Not IsNumber($fRate2)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "double", $fRate1, "double", $fRate2, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IMediaPlaybackSession2_RemoveHdlrBufferedRangesChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_RemoveHdlrPlayedRangesChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_RemoveHdlrSeekableRangesChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 12, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_RemoveHdlrSupportedPlaybackRatesChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession2_SetIsMirroring($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 17, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession3_GetOutputDegradationPolicyState($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IMediaPlaybackSession3_GetPlaybackRotation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlaybackSession3_SetPlaybackRotation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
