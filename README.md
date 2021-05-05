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



## Adding users to your Firebase BE

1) Go to `https://console.firebase.google.com/u/0/project/YOUR-PROJECT-ID/overview` and select the Authentication tab on the left side menu. 

#### Authentication tab

2) Choose the ‘get started’ option from the overview/splash screen
3) Enable the email/password option as your means of Authentication

#### Firestore tab 

4) select the create database option
5) Start in “test mode”
6) Select the server (EU in my case) and proceed. 

#### Storage tab 

7) Go to the rules section 
8) Update the rues tab to allow writing to data where Auth equals null. ` || request.auth == null` which is required for users not yet authenticated to be able to upload a photo as part of a signup profile setting process. 
9) choose ‘publish’ 

You should now be in a good position to allow users to signup to your service with an email and password combo. You are also setup to be able to take additional data and a photo as part of that sign up and be able to process them and store them as the rules update above makes that possible. 
