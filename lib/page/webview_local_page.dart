import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewLocalPage extends StatefulWidget {
  const WebViewLocalPage({super.key});

  @override
  State<WebViewLocalPage> createState() => _WebViewLocalPageState();
}

class _WebViewLocalPageState extends State<WebViewLocalPage> {
  final WebViewControllerPlus _webController = WebViewControllerPlus();

  @override
  void initState() {
    super.initState();
    _webController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAssetServer('assets/index.html')
      ..addJavaScriptChannel(
        'MyJSChannel',
        onMessageReceived: (p0) {
          log('Javascript: ${p0.message}');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                p0.message,
                style: const TextStyle(fontSize: 35),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _webController.runJavaScript(
                      'sendOk()',
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Хорошо'),
                )
              ],
            ),
          );
        },
      );
    // ..loadRequest(Uri.parse('https://flutter.dev'))
    // loadLocalHTML();
    // loadHTMLFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Local'),
      ),
      body: WebViewWidget(
        controller: _webController,
      ),
    );
  }

  Future<void> loadLocalHTML() {
    final url = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    );

    // return _webController.loadRequest(url);
    return _webController.loadHtmlString(html);
  }

  Future<void> loadHTMLFromFile() async {
    final htmlString = await rootBundle.loadString('assets/index.html');
    return _webController.loadHtmlString(htmlString);
  }

  final html = '''<!DOCTYPE html>
  <html>
  <body>  
  
  <h1>This is heading 1</h1>
  <h2>This is heading 2</h2>
  <h3>This is heading 3</h3>
  <h4>This is heading 4</h4>
  <h5>This is heading 5</h5>
  <h6>This is heading 6</h6>
  
  </body>  
  </html>
  ''';
}
