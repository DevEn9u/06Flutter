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
      home: const MyHomePage(title: 'AlertDialog'),
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
  // 멤버변수 private 으로 선언
  String _sPersonName = '';

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
          children: <Widget>[
            ElevatedButton(
              // 버튼을 누르면 람다형식으로 외부 함수 호출함
              onPressed: () => _showAlertDialog(context, 'hello~~'),
              child: const Text(
                'Show AlertDialog',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void showAlertDialog() async {
  Future _showAlertDialog(BuildContext conext, String message) async {
    await showDialog(
      context: context,
      /* 화면의 빈 곳을 눌러도 창이 닫히지 않게 설정. true인 경우 창이 닫힘 */
      barrierDismissible: false, // user must tap button!!
      builder: (BuildContext context) {
        // 대화창의 테마 설정
        return Theme(
          // 배경색
          data: ThemeData(dialogBackgroundColor: Colors.orange),
          child: AlertDialog(
            // 모서리 부분의 라운딩 처리
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            // 대화창의 타이틀
            title: Text('AlertDialog Example'),
            // 내용
            content: Container(
              height: 90,
              child: Column(
                children: [
                  Text(message),
                  TextField(
                    /* 대화창이 열릴 때 자동으로 포커싱된다.
                    이 경우 입력을 위해 키보드가 자동으로 올라온다. */
                    // autofocus: true,
                    // decoration: 입력상자 hint, placeholder와 같은 역할
                    decoration:
                        InputDecoration(labelText: 'Name', hintText: '홍길동'),
                    // 내용의 변경을 감지하는 리스너
                    onChanged: (value) {
                      // 입력된 내용을 멤버변수에 저장
                      _sPersonName = value;
                    },
                  )
                ],
              ),
            ),
            // 대화창의 버튼
   
            actions: [
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭시 대화창 닫힘
                  Navigator.pop(context, 'OK');
                  // 입력한 내용을 콘솔에 출력
                  print('OK = $_sPersonName');
                },
                child: const Text('OK'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭시 대화창 닫힘
                  Navigator.pop(context, 'Cancel');
                  print('Cancel');
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }
}
