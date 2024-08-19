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
      // theme: ThemeData.dark(),
      theme: ThemeData(
        // 24년 현재 사용되고 있는 테마(기본형에 저장)
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,

        // App bar와 전반적인 컬러로 테마 구성(구 버전 default)
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.orange,

        // App bar의 theme 설정
        // appBarTheme: const AppBarTheme(
        //   color: Colors.deepPurple,
        // ),

        // 선택되지 않은 위젯 color
        unselectedWidgetColor: Colors.green,
        // scaffold 배경 color
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 235, 231),

        fontFamily: 'D2Coding',

        // 기본 텍스트 테마 설정
        textTheme: const TextTheme(
          // bodyText2: TextStyle( => deprecated되었음
          bodyMedium: TextStyle(
            fontSize: 30,
            height: 1.5,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Theme Use'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 열거형 상수 선언
enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {
  // 멤버변수 선언
  Fruit _myGroup = Fruit.banana;
  bool _chk1 = false;
  bool _chk2 = false;

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
            const Text(
              'default theme 적용된 글자',
            ),
            TextButton(
              onPressed: 1 != 2 ? null : () => print('aaa'),
              child: const Text('TextButton 0'),
            ),
            ElevatedButton(
              onPressed: () {
                print('bbb');
              },
              child: const Text('default theme - button 0',
                  style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                print('ccc');
              },
              child: const Text('글자색 변경 - button 0',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                // 아래 2개의 속성은 deprecated.
                // primary: Colors.green,
                // onPrimary: Colors.white,
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            RadioListTile<Fruit>(
              title: const Text('사과'),
              value: Fruit.apple,
              groupValue: _myGroup,
              onChanged: (Fruit? value) {
                setState(() {
                  _myGroup = value!;
                  print(_myGroup);
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.indigo,
              ),
              child: RadioListTile<Fruit>(
                title: const Text('바나나'),
                value: Fruit.banana,
                groupValue: _myGroup,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    _myGroup = value!;
                    print(_myGroup);
                  });
                },
              ),
            ),
            Checkbox(
              value: _chk1,
              checkColor: Colors.pink,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _chk1 = value!;
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.indigo,
              ),
              child: Checkbox(
                value: _chk2,
                checkColor: Colors.pink,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _chk2 = value!;
                  });
                },
              ),
            ),
            const TextField(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.thumb_up),
        label: const Text("Approve"),
        tooltip: 'Increment',
        backgroundColor: Colors.purple,
        onPressed: () {
          print('ddd');
        },
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme:
      //         ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      //   ),
      //   child: FloatingActionButton(
      //       child: const Icon(Icons.add),
      //       tooltip: 'Increment',
      //       onPressed: () => print('ddd')),
      // ),
    );
  }
}
