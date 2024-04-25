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
      ..loadRequest(Uri.parse('https://ulearn.me/login'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            this.progress = progress / 100;
            setState(() {});
          },
          onPageStarted: (url) {
            log('Новый сайт: $url');
          },
          onPageFinished: (url) {
            log('Страница полностью загружена');
            // if (url.contains('https://flutter.dev')) {
            //   log('Удаление footer');
            //   await Future.delayed(
            //     const Duration(microseconds: 300),
            //     () => _webController.runJavaScript(
            //         "document.getElementsByTagName('footer')[0].style.display='none';"),
            //   );
            // }
          },
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://m.youtube.com')) {
              log('Навигация заблокирована к ${request.url}');
              return NavigationDecision.prevent;
            }
            log('Навигация разрешена к $request');

            return NavigationDecision.navigate;
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
          onPressed: () async {
            const email = 'someemail@example.com';
            const pass = 'somepass';
            _webController.runJavaScript(
              "document.getElementById('UserName').value='$email';",
            );
            _webController.runJavaScript(
              "document.getElementById('Password').value='$pass';",
            );
            await Future.delayed(const Duration(seconds: 1));
            await _webController.runJavaScript(
              "document.forms[1].submit()",
            );

            // final currentUrl = await _webController.currentUrl();
            // log('Предыдущий сайт: $currentUrl');
            // _webController.loadRequest(Uri.parse('https://www.youtube.com'));
            // await _webController.runJavaScript("document.getElementsByTagName('footer')[0].style.display='none';");
          },
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
