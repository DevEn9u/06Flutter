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
      // appBar 프로퍼티
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      /* Flutter의 기본 앱은 appBar, body 2개의 프로퍼티로 구성되지만
        여기서는 drawer 프로퍼티를 추가한다. */
      drawer: Drawer(
        // 해당 메뉴는 ListView를 통해 구성한다.
        child: ListView(
          padding: EdgeInsets.zero,
          /* 만약 해당 Widget이 const로 선언되면 메뉴에 onTap()을
            추가했을 때 에러가 발생하므로 주의해야 한다. */
          children: <Widget>[
            // 메뉴 타이틀로 사용되는 header 부분
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // ListTile로 각 메뉴를 구성한다.
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                print('Messages 클릭');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                print('Profile 클릭');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                print('Settings 클릭');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('왼쪽 끝에서 오른쪽으로 드래그해봅니다.'),
          ],
        ),
      ),
    );
  }
}
