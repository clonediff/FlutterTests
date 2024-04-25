import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: WebViewController()
        // HTTPS
        // Работает по умолчанию
          ..loadRequest(Uri.parse('https://flutter.dev'))
        // HTTP
        // Необходимо добавить android:usesCleartextTraffic="true" в /android/app/src/main/AndroidManifest.xml
        // Необходимо добавить в /ios/Runner/Info.plist
        /*
        <key>UIViewControllerBasedStatusBarAppearance</key>
        <false/>
        <key>NSAppTransportSecurity</key>
        <dict>
            <key>NSAllowsArbitraryLoads</key>
            <true/>
        </dict>
         */
        //   ..loadRequest(Uri.parse('http://smotret-tv.live/eurosport-1.html'))
          ..setJavaScriptMode(JavaScriptMode.unrestricted),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan, size: 32),
        onPressed: () {},
      ),
    );
  }
}
