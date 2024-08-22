import 'package:flutter/material.dart';
// dependency 설정으로 추가된 package를 현재 문서에 import
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// 3개의 page import
import 'package:ex41_tabbar/page_a1.dart';
import 'package:ex41_tabbar/page_b1.dart';
import 'package:ex41_tabbar/page_c1.dart';

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
  // 탭바 사용을 위한 controller 선언
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // controller 인스턴스 생성 및 첫 페이지(initialIndex로 index 설정) 설정
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    /* 
     TabView 위젯을 사용하면 기본형과는 조금 다른 형태를 가지게 된다.
     Flutter의 기본형은 appBar, body 프로퍼티를 사용하지만
     여기서는 screens에 출력할 화면을 지정한다.
    */
    return PersistentTabView(
      context,
      // TabView 사용을 위한 controller
      controller: _controller,
      // 각 메뉴 클릭시 변경된 페이지 지정(메서드 호출)
      screens: _buildScreens(),
      // TabView에 들어갈 item 지정(메서드 호출)
      items: _navBarsItems(),
      // confineSafeArea: true, // 예전 버젼
      confineToSafeArea: true,
      backgroundColor: Colors.white, // Default color
      handleAndroidBackButtonPress: true, // Default
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default
      // hideNavigationBarWhenKeyboardShows: true, // 예전 버전
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      // TabView 스타일 지정(pub.dev 웹페이지에서 확인 가능)
      navBarStyle: NavBarStyle.style7,
    );
  }

  // TabView를 클릭했을 때 이동할 페이지 선언
  List<Widget> _buildScreens() {
    // List로 만든 후 반환한다.
    return [
      const PageA1(),
      const PageB1(),
      const PageC1(),
    ];
  }

  // TabView의 버튼 생성 및 스타일 설정
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        // 기본 컬러와 반전시의 컬러 저장
        activeColorPrimary: Colors.blue,
        activeColorSecondary: Colors.yellow,
        // 비활성화 상태의 컬러
        inactiveColorPrimary: Colors.grey,
        // 속성은 존재하나 사실상 거의 필요 없음. primary로 충분하다.
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.amber,
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Add",
        activeColorPrimary: Colors.lightGreen,
        activeColorSecondary: Colors.blueGrey,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
    ];
  }
}
