import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter WebView Crash'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Column(
        children: <Widget>[
          Text("Please play the video and wait for playing, then tap on the floating action button"),
          Expanded(
            child: WebView(
              initialUrl: "https://www.youtube.com/watch?v=mlBIpwtNxxE",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPage(context, KeyboardPage()),
        child: Icon(Icons.error),
      ),
    );
  }

  Future _showPage(BuildContext context, Widget page) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}


class KeyboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyBoardState();
  }
}

class _KeyBoardState extends State<KeyboardPage> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    _focusNode ??= FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: Center(
        child: TextField(
          focusNode: _focusNode,
        ),
      ),
    );
  }
}