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
    // text style을 변수로 선언한 후 위젯에 적용
    var myTextStyle1 = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.red.withOpacity(0.8),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /*
      Column은 위젯의 배치에 사용하는 위젯으로 수직방향으로 배치한다.
      수평방향으로 배치할 때는 Row 위젯을 사용한다.
      */
      body: Column(
        // 메인화면의 축을 기준으로 수직방향에서 가운데 정렬
        // mainAxisAlignment: MainAxisAlignment.center,
        /* 위젯을 2개 이상 배치하기 위해 사용하는 속성으로 주로 List로
           표현한다. */
        children: <Widget>[
          /* Text를 표현하는 위젯으로 형식은 (출력내용, 스타일)과 같이
             사용한다. */
          const Text(
            '0123456789Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontFamily: "D2Coding",
              letterSpacing: 4.0,
            ),
          ),
          const Text(
            '0123456789Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              /* 미리 정의된 상수값 */
              color: Color(0xFF000000),
            ),
          ),
          Text(
            '0123456789Aa가#',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Text(
            '0123456789Aa가#',
            textAlign: TextAlign.left,
            /* 멤버변수로 선언한 스타일을 적용 */
            style: myTextStyle1,
          ),
        ],
      ),
    );
  }
}
