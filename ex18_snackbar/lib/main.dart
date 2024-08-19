import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'SnackBar'),
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
  // SnackBar에서 사용할 message
  String msg = "Hello World!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // 버튼 클릭시 실행항 함수 직접 정의
              onPressed: () {
                // 이 클래스를 통해 직접 스낵바를 띄운다.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    // SnackBar에 표시할 message
                    content: Text(msg),
                    // 닫히는 시간을 1000ms로 설정
                    duration: const Duration(microseconds: 1000),
                  ),
                );
              },
              child: const Text(
                'Snackbak 기본',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => callSnackBar("안녕하세요~ 홍길동님!"),
              child: const Text(
                'SnackBar 옵션',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SnackBak의 옵션 설정
  callSnackBar(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // message 내용. Text에 Style까지 지정
        content: Text(
          msg,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        // SnackBar의 배경색
        backgroundColor: Colors.yellow[800],
        // 닫히는 시간 설정
        duration: const Duration(microseconds: 2000),
        // SnackBar에 별도의 텍스트버튼 추가 가능
        action: SnackBarAction(
          label: '닫기',
          textColor: Colors.black,
          onPressed: () {
            print('스낵바 다힘');
          },
        ),
        // Floating 여부 : 아래 부분에서 살짝 띄워준다.
        behavior: SnackBarBehavior.floating,
        // SnackBar의 모서리 부분을 둥글게 커스텀한다.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
