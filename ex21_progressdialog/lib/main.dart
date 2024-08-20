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
      home: const MyHomePage(title: 'ProgressDialog'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // 버튼을 누르면 대화창을 띄워 메세지 전달
              onPressed: () => _showProgressDialaog('loading... 로딩중'),
              child: const Text('Show ProgressDialog',
                  style: TextStyle(fontSize: 24)),
            )
          ],
        ),
      ),
    );
  }

  Future _showProgressDialaog(String message) async {
    await showDialog(
        context: context,
        // barrierDismissible: true, // false : user must tap button!
        builder: (BuildContext context) {
          // Test 할 때 3초 후 창 닫기
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context);
          });
          return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: AlertDialog(
                // 대화창의 모서리를 둥글게 처리
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                // 대화창의 외부 크기
                content: SizedBox(
                  // 높이 변경
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80.0,
                          width: 80.0,
                          /*
                           CircularProgressIndicator
                           : 로딩에서 빙글 빙글 도는 것을 칭함.
                           여기서는 모양 및 색 변경 가능
                            */
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.purple),
                            strokeWidth: 5.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // 출력할 메세지
                        Text(
                          message,
                          style: const TextStyle(fontSize: 24, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
