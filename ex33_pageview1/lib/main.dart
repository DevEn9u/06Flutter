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
      home: const MyHomePage(title: 'PageView Widget'),
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
  // PageView를 사용하기 위한 Controller 인스턴스 생성
  final _pageController = PageController(
    // 초기 페이지의 index 지정
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 상단의 TextView는 고정된 상태로 유지
            Text(
              '터치한 후 좌우로 Swipe 하세요.',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            // PageView 위젯을 Wrapping
            Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  /* 페이지 넘김 보정을 끄려면 false로 지정.
                    이 경우 page가 한 장씩 swipe되지 않는다. */
                  // pageSnapping: false,
                  /* 간단한 페이지인 경우 Widget을 반환하는 메서드를 통해
                    구현할 수 있다. 각 page를 List에 추가한다. */
                  children: [
                    page1(),
                    page2(),
                    page3(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  // 각 PageView를 구성할 Page Widget으로 Container를 반환한다.
  Widget page1() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 50.0,
            ),
            Text(
              'Page Index : 0',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget page2() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sunny,
              color: Colors.orange,
              size: 50.0,
            ),
            Text(
              'Page Index : 1',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget page3() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.blue,
              size: 50.0,
            ),
            Text(
              'Page Index : 2',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
