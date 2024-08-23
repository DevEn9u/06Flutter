import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // WebView 사용을 위한 Controller 생성
  WebViewController controller = WebViewController()
    /* WebView에서 JavaScript 사용여부 설정 */
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        /* WebView의 Navigation을 제어하고 사용저가 특정 URL로 이동하거나
        page를 load하기 전에 추가적인 작업을 수행 */
        onProgress: (int progress) {/* update loiading bar */},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          print("onPageFinished");
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com')) {
            // 특정 URL로의 이동을 차단
            return NavigationDecision.prevent;
          }
          // 특정 URL로의 이동을 허용
          return NavigationDecision.navigate;
        },
      ),
    )
    // 해당 URL을 WebView에 load한다.
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      /* WebView를 사용할 때는 전체화면을 사용하게 되므로 노치디자인에
        적합하도록 SafeArea 위젯을 사용하는 것이 좋다. */
      body: SafeArea(
        child: Expanded(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
