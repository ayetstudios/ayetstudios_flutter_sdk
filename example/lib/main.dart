import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ayetstudios_flutter_sdk/ayetstudios_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.teal),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OwPage()));
              },
              child: Text('Open AyeT-Studios Web Offerwall'),
            ),
             TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SdkPage()));
              },
              child: Text('Open AyeT-Studios Flutter Offerwall'),
            ),
          ],
        ),
      ),
    );
  }
}
class OwPage extends StatefulWidget {
  @override
  _OwPageState createState() => _OwPageState();
}

class SdkPage extends StatefulWidget {
  @override
  _sdkPageState createState() => _sdkPageState();
}
class _sdkPageState extends State<SdkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Offerwall opened using AyeT-Studios Flutter SDK'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: AyetOfferwall(
          adslotId: 14114,
          externalIdentifier: 'your-user-id-123',
          onClose:(){
            print('ayeT-Studios Flutter SDK onClose called');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
          }
        ),
      ),
    );
  }
}

class _OwPageState extends State<OwPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('AyeT-Studios Offerwall'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height ,
          child: WebView(
            initialUrl: 'https://www.ayetstudios.com/offers/web_offerwall/14114/desktop_web_offerwall?external_identifier=your-user-id-123',
            allowsInlineMediaPlayback: true,
            onWebViewCreated: (controller) {},
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) async {
              final Uri url = Uri.parse(request.url);
              if (request.url.contains('https://www.ayetstudios.com/offers/')) {
                return NavigationDecision.navigate;
              } else {
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('ayeT-Studios Offerwall couldnt load outside link');
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.prevent;
              }
            },
            onPageStarted: (String url) {
              print('ayeT-Studios Offerwall loading:$url');
            },
            onPageFinished: (String url) {
              print('ayeT-Studios Offerwall loaded:$url');
            },
          ),
        )
      ),
    );
  }
}