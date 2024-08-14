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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/900.png',
            // 사이즈만 지정하면 자동으로 설정됨.
            fit: BoxFit.fill,
            alignment: Alignment.topLeft,
            // 원래 사이즈가 비율대로 줄어든다.
            width: 100.0,
          ),
          // SizedBox를 통해 위젯 사이에 약간의 여백을 지정함.
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/900.png',
            // cover 옵션은 큰쪽을 맞추고 작은쪽은 잘린다.
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/900.png',
            // 사이즈에 이미지를 맞춤. 이미지의 왜곡이 생길 수도 있다.
            fit: BoxFit.fill,
            alignment: Alignment.topLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/900.png',
            // 작은쪽에 이미지를 맞춘다. 즉 큰쪽에 여백이 남는다.
            fit: BoxFit.contain,
            alignment: Alignment.topLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/900.png',
            // fit: BoxFit.contain,
            alignment: Alignment.topLeft,
            width: 100.0,
            height: 50.0,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/900.png',
            // 화면 배열에 영향을 받지 않고 원본 그대로 출력한다. 
            fit: BoxFit.none,
            alignment: Alignment.topLeft,
            // 이미지의 크기가 900이므로 우측, 아래쪽이 모두 잘린다.
            width: 320.0,
            height: 80.0,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
