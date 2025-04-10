import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(_navigationDelegate())
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (!didPop) {
          if (await _controller.canGoBack()) {
            _controller.goBack();
          } else {
            if (!context.mounted) return;
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: BackButton(onPressed: () => Navigator.pop(context)),
          actions: [
            IconButton(
              onPressed: () => _controller.reload(),
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(widget.url))) {
                  await launchUrl(
                    Uri.parse(widget.url),
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              icon: const Icon(Icons.open_in_browser),
            ),
            IconButton(
              onPressed: () => Share.share(widget.url),
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        body: Stack(
          children: [
            if (_hasError)
              const Center(
                child: Text('Không thể tải trang. Vui lòng thử lại sau.'),
              )
            else
              RefreshIndicator(
                color: Colors.greenAccent,
                backgroundColor: Colors.white,
                strokeWidth: 2.5,
                displacement: 64,
                onRefresh: () async => _controller.reload(),
                child: WebViewWidget(controller: _controller),
              ),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  NavigationDelegate _navigationDelegate() {
    return NavigationDelegate(
      onPageStarted:
          (_) => setState(() {
            _isLoading = true;
            _hasError = false;
          }),
      onPageFinished: (_) => setState(() => _isLoading = false),
      onWebResourceError:
          (_) => setState(() {
            _hasError = true;
            _isLoading = false;
          }),
    );
  }
}
