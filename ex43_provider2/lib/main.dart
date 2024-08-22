import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // 2개 이상의 Provider를 사용할 수 있다.
      providers: [
        /* 동일한 Provider가 존재하면 마지막에 기술된 것이 사용된다.
          즉 '홍길동'은 무시된다. */
        Provider<String>.value(value: '홍길동'),
        Provider<String>.value(value: '전우치'),
        Provider<int>.value(value: 20),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Page1(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // 2개의 공유 데이터를 사용하기 위한 멤버변수
  String data = '';
  int number = 0;

  @override
  Widget build(BuildContext context) {
    // 공유 데이터 사용. 변경에 대한 알림을 받도록 설정한다.
    data = Provider.of<String>(context, listen: true);
    number = Provider.of<int>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page2(),
                  ),
                );
              },
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
            ),
            // 공유 데이터 출력
            Text('$data - $number', style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100],
              ),
            ),
            /* Page2에서 Consumer 객체를 이용해서 공유데이터를 사용한다.
              data1, data2에서는 String, int 순으로 데이터가 할당된다. */
            Consumer2<String, int>(
              builder: (context, data1, data2, child) {
                print('111111');
                return Text('$data1 - $data2',
                    style: const TextStyle(fontSize: 30));
              },
            ),
          ],
        ),
      ),
    );
  }
}
