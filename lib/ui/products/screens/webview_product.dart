import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewProduct extends StatefulWidget {
  const WebViewProduct({Key? key}) : super(key: key);

  @override
  WebViewProductState createState() => WebViewProductState();
}

class WebViewProductState extends State<WebViewProduct> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
