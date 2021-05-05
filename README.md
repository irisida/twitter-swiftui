# SwiftUI Twitter Clone

iOS clone of the Twitter app using SwiftUI 2, Firebase, MVVM pattern. 


## Adding Firebase to a SwiftUI Project 

#### Firebase console 

1) Go to https://console.firebase.google.com/
2) Create new project, supply title and advance (deselect analytics for tutorials and POCs)
3) add iOS to project. You will be asked for iOS bundle ID which you an find from the .xcodeproj file for your project
4) additional options settings such as app nickname and StoreID can be provided if you have them but are not necessary at this time. 
5) You now need to download the GoogleService-info.plist file that is presented on the next screen
6) add this file to the root of the project.
7) selecting the ‘next’ screen will present the cocoa pods installation details but we won’t use this as we will use the more modern Swift Package Manager or SPM

#### Xcode Swift package manager 

8) in Xcode got File -> Swift Packages -> Add Package Dependency 
9) to add firebase add the link:  `https://github.com/firebase/firebase-ios-sdk.git` and select next to add
10) select the individual packages you need: 
FirebaseAuth
FirebaseFireStore
FirebaseFunctions
FireBaseStorage
FirebaseMessaging
FirebaseInAppMessagingSwift-Beta

#### Update App file to use new config and packages

11) update main app file to import Firebase and add an init block that calls FirebaseApp.configure()

`* additional build time is required due to the volume of new code modes that must be compiled.` 


