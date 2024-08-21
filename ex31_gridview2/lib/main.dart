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
      home: const MyHomePage(title: 'GridView Widget2'),
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // 컨테이너로 감싸서 크기를 지정하면 스크롤 가능
                Container(
                  height: 300,
                  // GridView Widget
                  child: GridView.count(
                    // scrollDirection: Axis.vertical, // default값이므로 생략 가능
                    // 한 즐에 출력할 아이템 개수(타일의 크기가 자동으로 계산됨)
                    crossAxisCount: 3,
                    // 가로, 세로 비율을 정한다. 없으면 default로 정사각형
                    childAspectRatio: 1.5,
                    // generate()를 통해 여러개의 아이템을 생성
                    children: List.generate(50, (index) {
                      return Container(
                        child: Card(
                          color: Colors.blue,
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  height: 200,
                  child: GridView.count(
                    // 수평방향으로 스크롤 설정
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2, // 타일의 크기가 자동으로 계산됨
                    childAspectRatio: 1.5, // 가로, 세로 비율을 정한다.
                    children: List.generate(50, (index) {
                      return Container(
                        child: Card(
                          color: Colors.amber,
                          
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
