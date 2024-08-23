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
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    /* WebView Controller 인스턴스 생성 : 채널을 통해 WebView와
      통신할 수 있도록 설정.
      JS에서 호출시 '채널명.postMessage(인수)' 형태로 사용. */
    controller = WebViewController()
      /* WebView에서 JavaScript 사용 허용 */
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      /* 통신을 위한 채널명(개발자가 정의) */
      ..addJavaScriptChannel(
        "JsFlutter",
        onMessageReceived: (JavaScriptMessage message) {
          // 웹에서 postMessage()로 보낸 메세지를 출력
          // message에 따라 일을 분기하여 처리
          print(message.message);
          // 받은 메세지를 SnackBar로 출력
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      // ..loadRequest(Uri.parse('https://map.kakao.com'));
      /* 내부에 있는 HTML 문서를 WebView에 load */
      ..loadFlutterAsset("assets/html/my.html");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // HTML에 정의된 JavaScript 함수를 Flutter에서 직접 호출
            ElevatedButton(
              onPressed: () => callJavaScript(),
              child: const Text('Flutter에서 JavaScript 실행'),
            ),
            // SizedBox 하위에 WebView 추가
            SizedBox(
              height: 500,
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }

  // WebView Controller를 통해 HTML 페이지의 JavaScript 함수 호출
  void callJavaScript() {
    // controller.runJavaScript('alert("홍길동")');
    controller.runJavaScript('appToJs("안녕하세요~")');
  }
}
