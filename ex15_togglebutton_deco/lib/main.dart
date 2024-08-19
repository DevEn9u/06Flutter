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
  // 15번 예제를 복사하고 'fancy'부분을 추가한 것이다.
  // Toggle button선택 항목 구분용 List
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
            // multi-select
            const Text(
              'multi-select',
              textScaleFactor: 2,
            ),
            // 토글 버튼 위젯
            ToggleButtons(
                // 토글버튼은 주로 아이콘으로 표현
                children: const [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                // 이벤트 리스너 : 누른 버튼의 index가 전달됨
                onPressed: (int index) {
                  setState(
                    () {
                      /* 변수 앞에 '!'가 있으므로 not(부정 연산자)으로 사용됨.
                      '!'에 의해 선택한 항목이 토글된다. */
                      isSelected1[index] = !isSelected1[index];
                      // select된 항목 전체를 List로 출력
                      print('isSelected1 : $isSelected1');
                      print('index : $index');
                    },
                  );
                },
                // 각 button의 값으로 사용할 List 설정
                isSelected: isSelected1),
            const SizedBox(
              height: 20,
            ),
            // single select
            const Text(
              'single select',
              textScaleFactor: 2,
            ),
            ToggleButtons(
                children: const [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                onPressed: (int index) {
                  setState(
                    () {
                      // 전체 항목 중 선택한 하나만 토글한다.
                      for (var i = 0; i < isSelected2.length; i++) {
                        if (i == index) {
                          // 사용자가 선택한 항목만 활성화
                          isSelected2[i] = true;
                        } else {
                          // 나머지는 모두 비활성화 처리
                          isSelected2[i] = false;
                        }
                      }
                      print('isSelcted2 : $isSelected2');
                    },
                  );
                },
                isSelected: isSelected2),
            // fancy
            const Text(
              'fancy',
              textScaleFactor: 2,
            ),
            ToggleButtons(
                borderColor: Colors.blueGrey,
                borderWidth: 10,
                // 선택한 button의 테두리
                selectedBorderColor: Colors.blue,
                // button을 누르는 순간 잠깐 보이는 애니메이션 효과의 색
                splashColor: Colors.purple,
                // 선택 상태가 아닐 때의 아이콘 색
                color: Colors.red,
                // 선택한 아이콘의 색
                selectedColor: Colors.green,
                // 선택한 버튼의 배경색
                fillColor: Colors.yellow,
                // disabledColor: Colors.black,
                // borderRadius
                borderRadius: BorderRadius.circular(10),
                children: const [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  // 아이콘 대신 텍스트 사용 가능
                  Text('cake'),
                ],
                onPressed: (int index) {
                  setState(() {
                    // single-select 형태로 기능 구성
                    for (int i = 0; i < isSelected3.length; i++) {
                      if (i == index) {
                        isSelected3[i] = true;
                      } else {
                        isSelected3[i] = false;
                      }
                    }
                    print('isSelected3 : $isSelected3');
                  });
                },
                isSelected: isSelected3)
          ],
        ),
      ),
    );
  }
}
