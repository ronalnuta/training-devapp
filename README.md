
<p align="center">
    <img src="./resources/images/logo.png" width="300px" />
</p>

<h1 style="font-size: 50px;font-weight: bold; text-align:center">Wile Chat</h1>

## **Description**

Wile is a privacy and consent focused group chat and event planning app that seeks to provide a neutral territory for people to connect. Its core functionality is the ability to use it anonymously from any platform (web, iOS, Android) while collecting as little user information as possible.

## **Table Of Contents**

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Deploy](#deploy)
- [Deploy Firebase Functions](#deploy-firebase-functions)
- [Related Links](#related-links)
- [Folder Structure](#folder-structure)
- [Dependencies](#dependencies)
- [Roadmap](#roadmap)
- [Authors And Acknowledgment](#authors-and-acknowledgment)
- [Project Status](#project-status)
- [Visuals](#visuals)

## **Prerequisites**

1. Dart *`>=2.18.4 <3.0.0`* and Flutter *`=3.7.5`*
2. iOS version 12 or higher
3. Android version 8 or higher

## **Installation**

**Step 1:**

Download or clone this repo by using the link below:

```Clone repo
https://gitlab.com/techleadgo/wile.git
```

**Step 2:**

Add file *`upload-keystore.jks`* to `./android/app`

```Add upload-keystore
android/app
├── build.gradle
├── src
└── upload-keystore.jks
```

**Step 3:**

Create a file named `./android/key.properties` that contains a reference to your keystore:

```Create file key.properties
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=upload
storeFile=upload-keystore.jks
```

**Step 4:**

Check file name `.env.example` in `/assets/config/.env.example` then create two files with  the same key and fill in the corresponding values for each ENV:

1. Create file `.env.production` in `./assets/config/.env.production`
2. Create file `.env.staging` in `./assets/config/.env.staging`

**Step 5:**

Ensures that your Flutter and Firebase app configuration is up to date with staging or production environments. We use Makefile to group the changing ENV command, to switch between both, please run the following command:

*`With redirect to staging configuration`*

```copy file
make staging
```

*`With redirect to production configuration`*

```copy file
make production
```

**Step 6:**

Go to project root and execute the following command in console to get the required dependencies:

```Pub get
flutter pub get 
```

**Step 7:**

This project uses `flutter_localizations` and `auto_route`  library that works with code generation, execute the following command to generate files:

```run build_runner
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```run build_runner with synced automatically
flutter packages pub run build_runner watch
```

**Step 8:**

Run the app with Mobile

```run with mobile
flutter run
```

And with Website

```run with website
flutter run -d chrome --web-renderer html
```

## **Deploy**

> :warning: **Please check source, branch and environment before deploying**: Be very careful here!

Create WILE branch from main, any branch that starts with wile/. e.g., wile/1.1.2, sit/1.1.3

Make sure version is correct. Will use current version in project. Build number will auto-increment based from firebase last build

Push branch

### **Website:**

**Step 1:**

To build release website run:

```build web app
flutter build web --web-renderer html --release
```

**Step 2:**

Go to `buckets` in [AWS](https://s3.console.aws.amazon.com/s3/buckets) then select the environment to deploy and delete all files.

**Step 3:**

Upload all file in `./build/web`

**Step 4:**

Go to the cloudfront you want to deploy and select the `invalidation` tab and create invalidation with object path as `./` and wait for creation to complete

(Also you can setup aws cli to upload)

**Step 5:**

Announce new build with release notes in Slack channel.

### **iOS:**

**Step 1:**

In command line run:

```pod install
cd ios && pod install
```

**Step 2:**

`Open xcode` and select `product` -> `archive`

Wait for the application archive to complete and distribute the application

**Step 3:**

Go to app in [App Store Connect](https://appstoreconnect.apple.com/)

Waiting to be uploaded on TestFlight

Check if the build is stable after the app uploaded

**Step 4:**

Push the build to the store

Updated release and release notes for other testers.

**Step 5:**

Announce new build with release notes in Slack channel.

### **Android:**

**Step 1:**

In command line run

```build app android
flutter build appbundle
```

**Step 2:**

Check if build is stable in `./build/app/outputs/app-bundle`

Go to `production` in [Google Play Console](https://play.google.com/)

Create a new release and upload file

**Step 3:**

Push the build to the store

Update release notes and release to other testers.

**Step 4:**

Announce new build with release notes in Slack channel.

## **Deploy Firebase Functions**

**Step 1:**

In command line run:

```cd functions
cd functions
```

**Step 2:**

Check file name `.env.example` in `/functions/.env.example` then create two files with  the same key and fill in the corresponding values for each ENV:

1. Create file `.env.production` in `./functions/.env.production`
2. Create file `.env.staging` in `./functions/.env.staging`

**Step 3:**

Deploy in command line run:

```deploy functions
npm install & npm run deploy
```

## **Related Links**

1. Firebase - [production](https://console.firebase.google.com/u/0/project/wile-chat/) and [staging](https://console.firebase.google.com/u/0/project/wile-staging)
2. Could function - [production](https://console.firebase.google.com/u/0/project/wile-chat/functions) and [staging](https://console.firebase.google.com/u/0/project/wile-staging/functions)
3. MapBox - [here](https://www.mapbox.com/)
4. Stream chat - [here](https://getstream.io/chat/)
5. AWS - [here](https://aws.amazon.com/)
6. App Store - [here](https://wile.chat/)
7. Play Store - [here](https://play.google.com/store/apps/details?d=com.wile.app)
8. Website - [production](https://wile.chat/) and [staging](https://staging.wile.chat/)
9. Design - [here](https://xd.adobe.com/view/cd675124-3cd0-4b25-8818-a7a1b5fe7b39-9834/grid/)
10. Task management - [here](https://trello.com/b/Uh7gBXVS/wile)

## **Folder Structure**

Here is the core folder structure which flutter provides.

```Tree of wile folder
wile/
├── android
├── assets
├── functions
├── ios
├── lib
├── resources
├── test
└── web
```

Here is the folder structure we have been using in this project

```Tree of lib folder
lib/
├── _dev
├── main.dart
├── packages
├── src
└── widgets
```

Now, lets dive into the *`lib`* folder which has the main code for the application.

```lib folder description
1- _dev - Contains screens of developer-only widgets that are not visible to users.
2- packages - customize the libraries added to the project.
3- src - This is the main source to start coding with flutter containing features and data. 
4- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
5- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### **Source**

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```Tree of src folder
src/
├── app.dart
├── config
├── dialogs
├── fcm_config.dart
├── features
├── firebase_options.dart
├── firebase_options_staging.dart
├── localization
├── locator.dart
├── network
├── router
├── services
├── theme
└── utils
```

Now, lets dive into the *`src`* folder which has the main code for the application.

```src folder description
1. app.dart - Where the app's general setting and config.
2- config - All application-level constants are defined in this directory along with the directory where the data is taken from env.
3- dialogs - This contains custom dialog widgets.
4- fcm_config - Contains functions for config Firebase Could Message.
5- features - Contains the screen, widget and state manager of each feature.
6- firebase_options - Contains functions for config Firebase with production environment.
7- firebase_options_staging - Contains functions for config Firebase with staging environment.
8- localization - Store the text localization.
9- locator.dart - Initialize application including like Firebase ,SystemChrome , dependency injection, ...
10- network - All the business logic of your application will go into this directory, it represents the data layer of your application. The communication between UI and data layer is handled by using central repository.
11- router - Generate everything needed for navigation inside of your App.
12- services - Contains function codes for each service.
13- theme - Custom themes for app-wide use.
14- utils - Contains the common file(s) and utilities used in a project.
```

## **Dependencies**

The main dependencies that the project is using:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): This package abstracts reactive aspects of the pattern allowing developers to focus on writing the business logic.
- [auto_route](https://pub.dev/packages/url_launcher): It’s a Flutter navigation package, it allows for strongly-typed arguments passing, effortless deep-linking and it uses code generation to simplify routes setup.
- [firebase_core](https://pub.dev/packages/logger): A Flutter plugin to use the Firebase Core API, which enables connecting to multiple Firebase apps.
- [stream_chat_flutter](https://pub.dev/packages/logger): This library includes both a low-level chat SDK and a set of reusable and customizable UI components.
- [flutter_map](https://pub.dev/packages/url_launcher): Mapping package for Flutter. Simple and easy to learn, yet completely customizable and configurable, it's the best choice for mapping in your Flutter app.
- [responsive_framework](https://pub.dev/packages/logger): Responsive Framework adapts your UI to different screen sizes automatically. Create your UI once and have it display pixel perfect on mobile, tablet, and desktop.
- [lottie](https://pub.dev/packages/url_launcher): Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with Bodymovin and renders them natively on mobile!

## **Roadmap**

To build the first MVP with core functionalities as sign up, login, create group chat, set start and expired time, group chat information, add friends. Release first MVP to App store and Play store

## **Authors And Acknowledgment**

***UTH***

***TITKUL***

## **Project Status**

Release first MVP to App store and Play store, fix bug if required.

## **Visuals**

| **Home Screen** | **Chat Screen** |
|------------|-------------|
|  <img src="./resources/images/demo_1.jpg" width=70% height=70%> |  <img src="./resources/images/demo_2.jpg" width=70% height=70%> |

| **Holding Screen** | **Join Group Screen** |
|------------|-------------|
|  <img src="./resources/images/demo_3.jpg" width=70% height=70%> |  <img src="./resources/images/demo_4.jpg" width=70% height=70%> |
