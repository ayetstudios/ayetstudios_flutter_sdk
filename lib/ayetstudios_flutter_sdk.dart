library ayetstudios_flutter_sdk;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AyetOfferwall extends StatelessWidget {
 Integer adslotId;
 String externalIdentifier;

AyetOfferwall({required this.adslotId,required this.externalIdentifier});

  @override
  Widget build(BuildContext context) {
    String owUrl = 'https://www.ayetstudios.com/offers/web_offerwall/'+this.adslotId+'?external_identifier='+this.externalIdentifier;

    return WebView(
          initialUrl: owUrl,
          allowsInlineMediaPlayback: true,
          onWebViewCreated: (controller) {},
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (String url) {
            print('ayeT-Studios Offerwall loading:$url');
          },
          onPageFinished: (String url) {
            print('ayeT-Studios Offerwall loaded:$url');
          },
        );
  }
}

