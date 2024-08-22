import 'package:flutter/material.dart';
// dart파일을 모듈화 하는 경우 경로를 통해 import한다.
import 'package:ex39_navigator3/page1.dart';

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
      /* 최초 앱을 실행하여 Page1 인스턴스를 생성한 후 화면에 렌더링 할 때
        '시작'이라는 파라미터를 전달한다. 즉 생성자를 호출하여 인스턴스를
        생성하는 것이다. */
      home: Page1(
        data: '시작',
      ),
    );
  }
}
