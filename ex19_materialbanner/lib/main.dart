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
      home: const MyHomePage(title: 'Flutter 기본형'),
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
              /* MaterialBanner와 SnackBar의 차이점
              - duration 옵션이 없기 때문에 수동으로 닫아야 한다.
              - SnackBar는 화면 위에 floating되지만, MaterialBanner는 위젯을 밀어낸다.
               */
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text('Hello, I am a Material Banner'),
                    // 좌측의 아이콘
                    leading: const Icon(Icons.info),
                    // 배경색
                    backgroundColor: Colors.yellow,
                    actions: [
                      TextButton(
                        // MaterialBanner를 숨김처리 한다.
                        onPressed: () => ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner(),
                        child: const Text('닫기'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Banner',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
