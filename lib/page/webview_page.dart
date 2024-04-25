import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions {
  clearCache,
  clearCookies,
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final WebViewController _webController = WebViewController();
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _webController
      ..loadRequest(Uri.parse('https://flutter.dev'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            this.progress = progress / 100;
            setState(() {});
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        if (await _webController.canGoBack()) {
          await _webController.goBack();
        } else {
          log('Нет записи в истории');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          actions: [
            IconButton(
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  await _webController.goBack();
                } else {
                  log('Нет записи в истории');
                }
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            IconButton(
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  await _webController.goForward();
                } else {
                  log('Нет записи в истории');
                }
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
            IconButton(
              onPressed: () => _webController.reload(),
              icon: const Icon(Icons.replay),
            ),
            PopupMenuButton<MenuOptions>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: MenuOptions.clearCache,
                  child: Text('Удалить кеш'),
                ),
                const PopupMenuItem(
                  value: MenuOptions.clearCookies,
                  child: Text('Удалить Cookies'),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case MenuOptions.clearCache:
                    _onClearCache(_webController, context);
                    break;
                  case MenuOptions.clearCookies:
                    _onClearCookies(context);
                    break;
                }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.black,
            ),
            Expanded(
              child: WebViewWidget(
                controller: _webController,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan, size: 32),
          onPressed: () =>
              _webController.loadRequest(Uri.parse('https://www.youtube.com')),
        ),
      ),
    );
  }

  Future<void> _onClearCookies(BuildContext context) async {
    final bool hasCookies = await WebViewCookieManager().clearCookies();
    String message = 'Cookies удалены';
    if (!hasCookies) message = 'Cookies уже были очщены';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onClearCache(
      WebViewController controller, BuildContext context) async {
    await controller.clearCache();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Кеш очищен')));
  }
}
