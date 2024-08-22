import 'package:ex40_route/page1.dart';
import 'package:ex40_route/page2.dart';
import 'package:ex40_route/page3.dart';
import 'package:flutter/material.dart';
// dart파일을 모듈화 하는 경우 경로를 통해 import한다.

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
      /* home과 initialRoute를 동시에 사용하게 될 경우 home 이후 initialRoute
        선언시 initialRoute가 나중에 선언되었기 때문에 home은 무시되나.
        선언 순서가 바뀌면 에러가 발생하지는 않으나,
        실행구조가 꼬이게 되므로 같이 사용하지 말 것. */

      // 일반적인 앱에서 시작 페이지를 지정하는 프로퍼티.
      // home: Page2(data: '시작',),

      // Route 사용시 시작 페이지를 지정하는 프로퍼티
      initialRoute: '/page1',
      /* 각 페이지에 대한 Route 처리는 Map을 사용한다. 각 페이지에 대한
        인스턴스 생성시 data를 통해 파라미터를 전달한다. */
      routes: {
        '/page1': (context) => Page1(data: '시작'),
        '/page2': (context) => Page2(data: '1페이지에서 보냄 (1 => 2)'),
        '/page3': (context) => Page3(data: '1페이지에서 보냄 (1 => 3)'),
      },
    );
  }
}
