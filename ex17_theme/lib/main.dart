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
        // 24년 현재 사용되고 있는 테마(기본형에 저장)
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,

        // App bar와 전반적인 컬러로 테마 구성(구 버전 default)
        // primarySwatch: Colors.blue,

        // App bar의 theme 설정
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
        ),

        // 선택되지 않은 위젯 color
        unselectedWidgetColor: Colors.green,
        // scaffold 배경 color
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 234, 230),

        // 폰트 적용
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
  String? _selectedRadio;
  bool _chk1 = false;
  bool _chk2 = true;

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
              'Default Theme 적용된 글자',
            ),
            TextButton(
              onPressed: () {
                print('aaa');
              },
              child: const Text('TextButton'),
            ),
            ElevatedButton(
              onPressed: () {
                print('bbb');
              },
              child: const Text('ElevatedButton(Default)',
                  style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                print('ccc');
              },
              child: const Text('ElevatedButton(테마 변경)',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                // 아래 2개의 속성은 deprecated.
                // primary: Colors.green,
                // onPrimary: Colors.white,
                foregroundColor: Colors.indigo,
                backgroundColor: Colors.green,
                shadowColor: Colors.purple,
                textStyle:
                    const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                elevation: 10,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            RadioListTile<String>(
              title: const Text('Defalut Theme 적용'),
              value: 'Default theme Radio',
              groupValue: _selectedRadio,
              onChanged: (value) {
                setState(() {
                  _selectedRadio = value;
                  print('$value 선택됨');
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                radioTheme: RadioThemeData(
                  fillColor: MaterialStateProperty.all(Colors.pink),
                ),
              ),
              child: RadioListTile<String>(
                title: const Text('Radio Theme 적용'),
                value: 'Theme 변경 Radio',
                groupValue: _selectedRadio,
                onChanged: (value) {
                  setState(() {
                    _selectedRadio = value!;
                    print('$value 선택됨');
                  });
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _chk1,
                  checkColor: Colors.pink,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _chk1 = value!;
                      _chk2 ? print('chk1 checked') : print('chk1 unchecked');
                    });
                  },
                ),
                const Text('Defalut Theme 적용')
              ],
            ),
            Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.blueAccent;
                    }
                    return Colors.red;
                  }),
                  checkColor: MaterialStateProperty.all(Colors.amber),
                ),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _chk2,
                    onChanged: (value) {
                      setState(
                        () {
                          _chk2 = value!;
                          _chk2
                              ? print('chk2 checked')
                              : print('chk2 unchecked');
                        },
                      );
                    },
                  ),
                  const Text('Checkbox Theme 적용'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            splashColor: Colors.purple,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: FloatingActionButton(
          child: const Icon(Icons.thumb_up),
          tooltip: '좋아요',
          onPressed: () => (print('ddd')),
        ),
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
