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
      home: const MyHomePage(title: 'BottomNavigationBar Widget'),
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
  // Navigation에서 사용할 index 선언
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // page 위젯을 반환하는 메서드 호출
        child: getPage(),
      ),
      // 탭바 위젯
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        iconSize: 30,
        // 선택했을 때 color
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        // 선택되지 않았을 때 color
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        // index 설정 (상단의 멤버변수)
        currentIndex: _curIndex,
        onTap: (index) {
          print('선택한 메뉴 : $index');
          /* 매개변수로 전달된 index를 통해 멤버변수의 값을 변경한 후
            화면을 새롭게 렌더링한다. */
          setState(() {
            _curIndex = index;
          });
        },
        // 각 menu는 List를 통해 구성. icon 및 text 설정.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget getPage() {
    // Null safety가 적용되어 Nullable로 선언
    Widget? page;
    switch (_curIndex) {
      case 0:
        page = page1();
        break;
      case 1:
        page = page2();
        break;
      case 2:
        page = page3();
        break;
    }
    // Null Check Operation으로 실행시 Null이련 런타임에러 발생됨
    return page!;
  }

  // 각 page를 반환하는 메서드 정의. Container Widget을 return한다.
  Widget page1() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 50.0,
            ),
            Text(
              'Page index : 0',
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
          children: const [
            Icon(
              Icons.add_circle,
              color: Colors.orange,
              size: 50.0,
            ),
            Text(
              'Page index : 1',
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
          children: const [
            Icon(
              Icons.notifications,
              color: Colors.blue,
              size: 50.0,
            ),
            Text(
              'Page index : 2',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
