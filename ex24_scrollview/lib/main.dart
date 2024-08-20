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
      home: const MyHomePage(title: 'ScrollView Widget'),
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
        child: Container(
          // padding, margin을 0으로 설정
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(10.0),
          /* 화면 크기보다 자식이 크면 화면의 크기로 맞춰진다.
          아래 2개의 속성을 적용하면 가로 화면이 꽉 채워진다. */
          // width: 300,
          // height: 500,
          /* padding을 지정하면 여기서 지정한 색이 보인다.
            container의 color 속성은 배경색을 의미한다. */
          color: Colors.cyan,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            // scroll 방향 설정(수직)
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center, // 의미 없음
              children: [
                // 세로 화면을 벗어날 정도의 컨테이너를 추가한 후 테스트
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[700],
                  child: Text(
                    'Entry A',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[500],
                  child: Text(
                    'Entry B',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[300],
                  child: Text(
                    'Entry C',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[100],
                  child: Text(
                    'Entry D',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
