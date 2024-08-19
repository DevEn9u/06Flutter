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
      home: const MyHomePage(title: '### Flutter Basic ###'),
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

  // Text 위젯에 설정한 기본 문자열
  String _myText = '홍길동';
  /* TextField에 입력된 내용을 읽어오기 위해 필요한 인스턴스로
  controller 속성에 추가한다. */
  final ctlMyText1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 최초 실행 시 '홍길동'이 출력됨
            Text(
              _myText,
              style: const TextStyle(
                fontSize: 30.0
              ),
            ),
            // TextField의 가로 사이즈는 SizedBox를 통해 설정한다.
            SizedBox(
              width: 280,
              child: TextField(
                // 컨트롤러 인스턴스가 지정된다.
                controller: ctlMyText1
              ),
            ),
            ElevatedButton(
              child: const Text(
                'ElevatedButton',
                style: TextStyle(
                  fontSize: 24),
              ),
              onPressed: () {
                /* 입력한 텍스트의 상태를 변경하여 렌더링을 다시 한다.
                즉, 사용자가 입력한 내용으로 텍스트 위젯이 변경된다. */
                setState(() {
                  // html의 value 속성과 동일하게 입력 내용을 가져온다.
                  _myText = ctlMyText1.text;
                });
              }
            ),
          ],
        ),
      ),
      // floatingAcitonButton을 누르면 초기 상태로 변경된다.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = '홍길동';
          });
        },
        child: const Icon(
          Icons.undo
        ),
      ),
    );
  }
}
