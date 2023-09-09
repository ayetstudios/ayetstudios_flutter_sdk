library ayetstudios_flutter_sdk;

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;



class AyetOfferwall extends StatelessWidget {
 int adslotId;
 String externalIdentifier;
 final void Function()? onClose;


AyetOfferwall({required this.adslotId,required this.externalIdentifier,this.onClose});

  @override
  Widget build(BuildContext context) {
    String owUrl = 'https://www.ayetstudios.com/offers/web_offerwall/'+this.adslotId.toString()+'?external_identifier='+this.externalIdentifier+'&sdk=flutter&os_version='+Platform.operatingSystemVersion+'&os='+Platform.operatingSystem;



    return WebView(
          initialUrl: owUrl,
          allowsInlineMediaPlayback: true,
          onWebViewCreated: (controller) {},
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
              name: 'AyeTStudiosFlutterSDK',
              onMessageReceived: (JavascriptMessage message) {
                if (message.message == 'onClose') {
                   if (this.onClose != null) {
                    this.onClose!();
                  }
                }
              },
            ),
          },
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
        );
  }
}

