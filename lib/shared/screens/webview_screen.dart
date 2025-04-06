import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({super.key, required this.title, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    _controller =
        WebViewController()
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (_) {
                setState(() {
                  _isLoading = true;
                  _hasError = false;
                });
              },
              onPageFinished: (_) {
                setState(() => _isLoading = false);
              },
              onWebResourceError: (error) {
                setState(() {
                  _hasError = true;
                  _isLoading = false;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Stack(
        children: [
          if (_hasError)
            const Center(
              child: Text('Không thể tải trang. Vui lòng thử lại sau.'),
            )
          else
            WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
