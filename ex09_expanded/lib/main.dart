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
      home: const MyHomePage(title: 'Expanded 사용'),
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
  // 이미지 위젯에 실행할 변수
  String _image1 = 'assets/images/900.png';
  String _image2 = 'assets/images/placeholder.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // 세로형 배치 위젯
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              // HTML의 %와 같이 위젯의 비율(가중치) 적용
              flex: 5,
              child: Container(
                // margin, paddin, color, alignment 등
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  // Container에 자식으로 이미지 추가
                  _image1,
                  alignment: Alignment.topLeft,
                  // alignment: Alignment.topCenter,
                  // alignment: Alignment.bottomRight,
                  fit: BoxFit.none, // 이미지의 원본 크기로 설정
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),
            Container(
              // marging을 4방향 설정
              margin:
                  const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
              // padding을 전방향 설정
              padding: const EdgeInsets.all(0.0),
              color: Colors.white,
              // width: 300,
              // height: 100,
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // 아이콘 버튼이 가로형으로 배치되고 중간에 간격이 20 띄워짐
                children: [
                  IconButton(
                    // 버튼 클릭시 람다형식으로 함수 호출
                    onPressed: () => _onClick1(),
                    icon: const Icon(Icons.upload_sharp),
                    tooltip: "이미지 위로 이동",
                    iconSize: 50.0,
                  ),
                  // 수평 방향으로 간격 설정
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () => _onClick2(),
                    icon: const Icon(Icons.download_sharp),
                    tooltip: "이미지 아래로 이동",
                    iconSize: 50.0,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.cyan,
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    _image2,
                    alignment: Alignment.topLeft,
                    // 이미지의 사이즈 지정
                    // fit: BoxFit.none,
                    width: 390.0,
                    height: 250.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _onClick1() {
    setState(() {
      _image1 = 'assets/images/900.png';
      _image2 = 'assets/images/placeholder.png';
    });
  }

  void _onClick2() {
    setState(() {
      _image1 = 'assets/images/placeholder.png';
      _image2 = 'assets/images/900.png';
    });
  }
}
