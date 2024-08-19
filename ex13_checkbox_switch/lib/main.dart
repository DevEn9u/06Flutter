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
      home: const MyHomePage(title: 'Checkbox, Switch Widget'),
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
  // 체크박스와 스위치에서 체크여부 확인을 위한 멤버변수
  bool _chk1 = false; // Non-Nullable로 선언
  bool? _chk2 = false; // Nullable로 선언, null을 허용하는 변수
  bool _chk3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 체크박스1  : 필수사항만 기술한 상태
            Checkbox(
                // 체크박스에서 사용할 값 설정
                value: _chk1,
                // checked/unchecked시 이벤트 발생
                onChanged: (bool? value) {
                  setState(() {
                    /* 매개변수를 통해 null값이 들어올 수 있으므로
                    Nullable로 선언하고, 변수에 할당시 Null check operataor를 추가하여 null인 경우
                    runtime error를 발생시킨다. */
                    _chk1 = value!;
                  });
                  print('Checkbox1 : $_chk1');
                }),
            // 체크박스2 : 컬러지정
            Checkbox(
                value: _chk2,
                // 체크되었을 때 색
                checkColor: Colors.pink,
                // 체크되었을 때 배경색
                activeColor: Colors.green,
                /* _chk2는 Nullable로 선언되었으므로 null값이 들어와도
                허용되므로 별도의 처리가 필요없음. */
                onChanged: (value) {
                  setState(() {
                    _chk2 = value!;
                  });
                  print('Checkbox2 : $_chk2');
                }),
            // 스위치 위젯    
            Switch(
                value: _chk3,
                // 스위치가 켜졌을 때 색
                activeColor: Colors.red,
                activeTrackColor: Colors.cyan,
                // 스위치가 꺼졌을 때 색
                inactiveThumbColor: Colors.lightGreen,
                inactiveTrackColor: Colors.lightGreen,
                onChanged: (value) {
                  setState(() {
                    _chk3 = value;
                  });
                  print('Switch : $_chk3');
                })
          ],
        ),
      ),
    );
  }
}
