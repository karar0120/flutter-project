

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webscreanview extends StatelessWidget {
  @override
      String url;
  webscreanview(this.url);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
