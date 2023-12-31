<div align="center">
  <img src="https://d1mys92jzce605.cloudfront.net/assets/cmsfiles_4d7238de7f07a45bd3ddbf9cfea8ba5eb6b62bbd.png" width="300" height="50"/>
  <br/>
</div>
<br/>

# ayeT-Studios Flutter Publisher SDK

<br/>

### Preparations

Before going forward with the implementation, you should create a _web placement_ and a _web offerwall adslot_ in your publisher account at [ayetstudios.com](https://www.ayetstudios.com).

### How to integrate the ayeT-Studios Offerwall in your app

**Notice** in order to integrate ayeT-Studios offerwall into your app you dont need this package you could use webView directly, or any other aproach, package is just there to make it easier for you.

For now you would need to download package into your project and use local dependency

```yaml
dependencies:
   flutter:
     sdk: flutter
   ayetstudios_flutter_sdk:
     path: ./ayetstudios_flutter_sdk
```
Note: The ./ayetstudios_flutter_sdk above means that the ayetstudios_flutter_sdk directory containing the pubspec.yaml for the package is a sub-directory of the app.

If you place the package as a directory at the same level as the app, in other words one level higher up in the directory tree, you can use ../ayetstudios_flutter_sdk (note the double dot) or a full path to the package directory.

```dart
import 'package:ayetstudios_flutter_sdk/ayetstudios_flutter_sdk.dart';
```

When calling the `AyetOfferwall` class, a `externalIdentifier` and an `adslotId` has to be passed.
The `externalIdentifier` should be a unique, persistent identifier (alphanumeric) for the user. An example might be a unique user id or the hashed email address of the user.
`adslotId` is the id of the `web_offerwall` adslot created in your publisher dashboard at [ayetstudios.com](https://www.ayetstudios.com).

```dart
AyetOfferwall(
      adslotId: 458,
      externalIdentifier: 'your-user-id-123',
      onClose:(){
            //The `onClose` callback function should be implemented according to your requirements.
            //A common practice is to navigate back to screen from which offerwall was called when `onClose` callback is triggered.
      }
)
```

#### Android setup

If you target Android, add the following snippet to your `AndroidManifest.xml`.

```
<uses-permission android:name="android.permission.INTERNET"/>

<queries>
  <intent>
    <action android:name="android.intent.action.VIEW"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme="https"/>
  </intent>
</queries>
```

### Example App Screenshots

<br/>
<p float="left">
  <img src="https://github.com/ayetstudios/ayetstudios-website-ng/assets/48547524/2f62f07b-2a4d-4772-aec6-1188dd058d9d" width="100" />
  <img src="https://github.com/ayetstudios/ayetstudios-website-ng/assets/48547524/b7839fd8-c499-4204-a785-8b66a36a0df8" width="100" /> 
</p>
