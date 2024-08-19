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

// enum은 열거형 상수로 클래스 내부가 아닌 외부에 선언할 수 있다.
enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _myGroup1 = Fruit.apple; // 첫 번째 그룹 구분에 사용할 변수
  /* 두 번째 그룹 구분에 사용할 변수 : radio는 여러 항목 중 하나만 선택할 수 있으므로 그룹으로 묶어주어야 함 */
  Fruit _myGroup2 = Fruit.banana;

  bool _btn = true;

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
            // 라디오를 정확히 터치해야 선택되는 위젯 
            ListTile(
              title: const Text('사과'),
              leading: Radio<Fruit>(
                // 라디오 위젯의 값
                value: Fruit.apple,
                // 라디오를 하나의 그룹으로 묶을 때 사용하는 속성
                groupValue: _myGroup1,
                // 하나의 항목을 선택했을 때 이벤트 핸들러
                onChanged: (Fruit? value) {
                  /* 매개변수의 null값을 체크하여 상태를 변경한 후
                  새롭게 렌더링한다. */
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('바나나'),
              leading: Radio<Fruit>(
                value: Fruit.banana,
                groupValue: _myGroup1,
                onChanged: (Fruit? value) {
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            // 간격 조정
            const SizedBox(
              height: 50,
            ),
            /* Radio 선택 영역이 넓어지므로 해당 라인 전체를 클릭해도
            선택할 수 있다. */
            RadioListTile<Fruit>(
              title: const Text('사과'),
              value: Fruit.apple,
              groupValue: _myGroup2,
              onChanged: (value) {
                /* 선택한 radio의 값을 출력하고, 아래 ElavatedButton을
                활성/비활성화 하는 기능이 추가되어 있다. */
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  _btn = true;
                });
              },
            ),
            RadioListTile<Fruit>(
              title: const Text('바나나'),
              value: Fruit.banana,
              groupValue: _myGroup2,
              activeColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  _btn = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              /* 이 버튼이 활성화 상태라면 함수를 호출할 수 있다.
              비활성화 상태라면 null이 선택되어 누를 수 없는 상태가 된다. */
              onPressed: _btn ? _onClick1 : null,
              child: const Text(
                'ElevatedButton',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClick1() {
    print('Radio2 : $_myGroup2');
  }
}
