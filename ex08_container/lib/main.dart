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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: const EdgeInsets.all(10.0),
              // margin을 지정한 방향에만 적용
              margin: const EdgeInsets.only(left: 10, top: 10),
              // padding을 4방향 모두 적용
              padding: const EdgeInsets.all(0.0),
              color: Colors.yellow,
              // width: 300, // 크기를 지정하지 않으면 부모의 크기
              height: 100, // 크기를 지정하지 않으면 자식(child)의 크기
              // 정렬은 child 위젯에 설정됨.
              alignment: Alignment.topLeft,
              child: const Text(
                '홍길동',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              // 자식과의 패딩으로 크기가 정해짐
              padding: const EdgeInsets.all(80.0),
              alignment: Alignment.center,
              // 컨테이너의 모양을 결정하는 속성
              decoration: const BoxDecoration(
                // Box의 모양을 circle로 표현
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Text(
                '전우치',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              width: 400, // 크기를 지정하지 않으면 부모의 크기
              height: 100, // 크기를 지정하지 않으면 자식의 크기
              // 자식 위젯을 우측 한다으로 정렬
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                // Box의 모양을 rectangle로 표현
                shape: BoxShape.rectangle,
                color: Colors.brown,
              ),
              child: const Text(
                '손오공',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),

            // Container 사이에 간격을 주기 위해 사용하는 위젯
            const SizedBox(
              height: 5,
            ),
            Container(
              // 이미지버튼의 크기 지정
              width: 100.0,
              height: 40.0,
              // Container에 image를 decoration으로 삽입
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/300x100.png'),
                ),
              ),
              // TextButton으로 마치 이미지 버튼과 같은 효과를 적용
              child: TextButton(
                /* 텍스트를 삽입하면 이미지 위에 보이게 되므로 빈 문자열로 처리 */
                onPressed: (() => _onClick(1)),
                child: const Text(
                  '',
                ),
              ),
            ),
            /*
            InkWell 위젯
            : Text와 같이 제스처 기능을 제공하지 않는 위젯을 래핑하여 
              onTap 기능을 제공함. 터치했을 때 물결모양의 애니메이션 효과가 발생.
            */
            Ink.image(
              image: const AssetImage('assets/images/300x100.png'),
              width: 100.0,
              height: 40.0,
              fit: BoxFit.fill,
              child: InkWell(
                // child: Text(''),
                onTap: () => _onClick(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick(int num) {
    print("Hello~ $num!");
  }
}
