import 'dart:io';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key, String initialUrl}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News View'),
      ),
      body: const Background(
        initialUrl: 'https://flutter.dev',
        child: null,
      ),
    );
  }
}

class WebView {
  static AndroidWebView platform;
}

class AndroidWebView {}
