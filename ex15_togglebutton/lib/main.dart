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
                isSelected: isSelected2)
          ],
        ),
      ),
    );
  }
}
