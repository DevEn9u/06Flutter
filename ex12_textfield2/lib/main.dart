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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '내용을 입력하세요',
              style: TextStyle(fontSize: 30.0),
            ),
            /* TextField를 멀티라인으로 지정하는 경우 화면 사이즈를 넘어가서 재대로 표현되지 않는 경우가 생길 때 Expanded로
            감싸준다. VSCode에서는 Ctrl + . , Android Stuido에서는
            Alt + Enter를 사용한다. */
            Expanded(
              child: TextField(
                // 입력할 문자열의 최대 길이 지정
                maxLength: 10,
                // 입력라인을 최대  30줄로 지정
                maxLines: 30,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  // labelText : '내용 입력',
                  // 주석처리하면 입력상자 우측 하단에 활성화됨
                  // counterText: "",
                  counterStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                onChanged: (text) {
                  print(text);
                },
                // 해당 예제에는 멀티라인 구조이고 submit 할 버튼이 없어 의미 없는 이벤트이긴 하다.
                onSubmitted: (text) {
                  print('Submitted : $text');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => _onClick(),
              child: const Text(
                '키보드 내리기',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

// 키보드 내리기 : 키보드가 다른 위젯을 가릴 때 유용하게 사용된다.
  void _onClick() {
    FocusScope.of(context).unfocus();
  }
}
