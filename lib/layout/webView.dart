import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWidget extends StatelessWidget {
  final String url;

  MyWidget(this.url);

  // MyWidget(articles);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: WebView(initialUrl: url),
    );
  }
}
