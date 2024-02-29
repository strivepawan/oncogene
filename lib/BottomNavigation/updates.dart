import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key});

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    _controller = WebViewController();

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('Blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('Allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('URL change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
            _openDialog(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://www.webmd.com/breast-cancer/features/breast-cancer-blogs'));
  }

  Future<void> _openDialog(HttpAuthRequest httpRequest) async {
    final TextEditingController usernameTextController = TextEditingController();
    final TextEditingController passwordTextController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${httpRequest.host}: ${httpRequest.realm ?? '-'}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  autofocus: true,
                  controller: usernameTextController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: passwordTextController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                httpRequest.onCancel();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                httpRequest.onProceed(
                  WebViewCredential(
                    user: usernameTextController.text,
                    password: passwordTextController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Authenticate'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Updates'),
        actions: <Widget>[
          NavigationControls(webViewController: _controller),
        ],
      ),
      body: WebViewWidget(controller: _controller),
      floatingActionButton: _favoriteButton(),
    );
  }

  Widget _favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Favorited $url')),
        );
      },
      child: const Icon(Icons.favorite),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({Key? key, required this.webViewController})
      : super(key: key);

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () async {
            if (await webViewController.canGoForward()) {
              await webViewController.goForward();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            webViewController.reload();
          },
        ),
      ],
    );
  }
}

