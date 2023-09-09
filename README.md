<div align="center">
  <img src="https://d1mys92jzce605.cloudfront.net/assets/cmsfiles_4d7238de7f07a45bd3ddbf9cfea8ba5eb6b62bbd.png" width="300" height="50"/>
  <br/>
</div>
<br/>

# ayeT-Studios Flutter Publisher SDK

<br/>



### Preparations
Before going forward with the implementation, you should create a *web placement* and a *web offerwall adslot* in your publisher account at [ayetstudios.com](https://www.ayetstudios.com).


### How to integrate the ayeT-Studios Offerwall in your app

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

### Example App Screenshots
<br/>
<p float="left">
  <img src="https://github.com/ayetstudios/ayetstudios-website-ng/assets/48547524/2f62f07b-2a4d-4772-aec6-1188dd058d9d" width="100" />
  <img src="https://github.com/ayetstudios/ayetstudios-website-ng/assets/48547524/b7839fd8-c499-4204-a785-8b66a36a0df8" width="100" /> 
</p>