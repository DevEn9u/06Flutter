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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // Row에 배경색을 주고 싶다면 Container로 감싼 후 지정
              color: Colors.yellow,
              // Row의 크기는 Container를 통해 지정
              width: 320, // 지정하지 않으면 부모의 크기로 지정
              height: 100, // 지정하지 않으면 자식의 크기로 지정
              // 가로형 배치 위젯
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button1'),
                  ),
                  // SizedBox(width: 10,), // 지정된 크기만큼 띄움
                  // Spacer(flex: 1,),     // 가중치를 이용해서 간격 조정
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button2'),
                  ),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 1,),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button3'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2, 
            child: Container(
              // Row에 배경색을 주고 싶다면 Container로 감싼 후 지정
              color: Colors.cyan,
              // Row의 크기는 Container를 통해 지정
              width: 320, // 지정하지 않으면 부모의 크기로 지정
              height: 100, // 지정하지 않으면 자식의 크기로 지정
              // 가로형 배치 위젯
              child: Row(
                // 수평방향에서 가운데 정렬
                mainAxisAlignment: MainAxisAlignment.center,
                // 수직방향에서 아래쪽으로 정렬
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button1'),
                  ),
                  // SizedBox(width: 10,), // 지정된 크기만큼 띄움
                  // Spacer(flex: 1,),     // 가중치를 이용해서 간격 조정
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button2'),
                  ),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 1,),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button3'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
