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
            /* TextField를 멀티라인으로 지정하는 경우 화면 사이즈를 넘어가서
            재대로 표현되지 않는 경우가 생길 때 Expanded로 감싸준다.
            VSCode에서는 Ctrl + . ,
            Android Stuido에서는 Alt + Enter를 사용한다. */
            Expanded(
              child: TextField(
                // 입력할 문자열의 최대 길이 지정
                maxLength: 1000,
                /*
                  정수를 입력하면 지정된 만큼의 높이가 부여된다.
                  즉 '5'라면 5줄의 입력공간이 확보된다.
                  이 경우 5줄만 입력할 수 있는 것은 아니다.
                  엔터키를 통해 5줄 이상이 되면 자동으로 스크롤바가 생성된다.
                  'null'을 부여하면 줄바꿈이 있을 때마다 동적으로
                  높이가 조절된다.
                 */
                maxLines: null,
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
                /*
                 maxLines를 2 이상 지정하면 Enter키를 눌렀을 때 줄바꿈이
                 발생하므로 submit 이벤트는 사용할 수 없다. change 이벤트를 통해
                 업무를 처리해야 한다.
                */
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
