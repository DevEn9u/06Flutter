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
  // 드롭다운 메뉴 초기값을 위한 멤버변수
  String _chosenValue = 'Flutter';

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
            // HTML <select>와 유사한 형태의 위젯
            DropdownButton<String>(
              // 텍스트 스타일 지정
              onChanged: (String? value) {
                /* Null safety 체크가 반드시 필요함. 제거시 에러 발생.
                value로 null이 들어올 수 있음을 명시 */
                popuButtonSelected(value!);
                // 선택한 값으로 변경한 후 화면을 새롭게 렌더링
                setState(() {
                  _chosenValue = value;
                });
              },
              style: const TextStyle(color: Colors.red),
                  // 최초 실행시 선택할 값 지정
              value: _chosenValue,
              // 구성 항목을 List를 통해 지정한 후 map 함수를 통헤 반복
              items: [
                'Android',
                'Ios',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP'
              ].map((value) {
                // 콜백된 각 항목을 인스턴스로 만든 후 반환
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // 드롭다운의 가로크기를 텍스트의 길이로 지정
              hint: const Text(
                "힌트글인데 이걸로 크기 조정을",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // DropdownMenu 버튼과 기능은 유사하지만 UI만 조금 다른 위젯
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                // 각 항목의 텍스트와 값 변환
                const PopupMenuItem(
                  child: Text("child 0"),
                  value: "Value 0",
                ),
                const PopupMenuItem(
                  child: Text("child 1"),
                  value: "Value 1",
                ),
                const PopupMenuItem(
                  child: Text("child 2"),
                  value: "Value 2",
                ),
              ],
              // 항목 선택시 이벤트 처리
              onSelected: popuMenuSelected,
            ),
          ],
        ),
      ),
    );
  }

  void popuButtonSelected(String value) {
    print(value);
  }

  void popuMenuSelected(String value) {
    print(value);
  }
}
