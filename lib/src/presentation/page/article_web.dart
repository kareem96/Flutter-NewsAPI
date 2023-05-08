import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_scaffold.dart';

class ArticleWebView extends StatefulWidget {
  static const routeName = '/article_web';
  final url;
  bool isLoading = true;

  ArticleWebView({
    Key? key,
    this.url,
    this.isLoading = true,
  }) : super(key: key);

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.url,
            onPageFinished: (finish) {
              setState(() {
                widget.isLoading = false;
              });
            },
          ),
          widget.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
