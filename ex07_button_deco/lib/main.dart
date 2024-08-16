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
  // 멤버변수
  String name = '클릭하세요!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            // 텍스트위젯. 각 버튼 클릭시 변화되는 값을 출력
            Text(
              /**
               * 문자열 표현식만 있는 경우에는 '$'를 사용하지 않는 것이 바람직하다.
               다른 문자열과 연결되는 부분이 있는 경우에만 '$'를 사용하는 것을 권장한다.
               */
              '$name',
              // 자동으로 지정되는 영문과 한글의 글자 높이가 달라서 지정
              style: const TextStyle(fontSize: 30, height: 1.5),
            ),
            /* TextButton은 눈에 보이는 테두리(border가 없다.
               HTML에서 <a>태그를 사용한 것과 비슷하다.*/
            TextButton(
              onPressed: () {
                /* 단순히 변수의 값을 변경할 때는 setState가 필요 없지만, 변경과 동시에 화면을 변경해야할 때 사용 */
                setState(() {
                  name = "전우치";
                });
              },
              child: const Text("TextButton",
                  style: TextStyle(fontSize: 24, color: Colors.red)),
            ),
            // 텍스트 + 아이콘이 추가된 버튼
            TextButton.icon(
              onPressed: () {
                setState(() {
                  name = "전우치(icon)";
                });
              },
              icon: const Icon(
                Icons.add_circle,
                size: 24.0,
                // 버튼의 아이콘(+)의 색 변경 가능
                color: Colors.blue,
              ),
              label: const Text(
                'TextButton + icon',
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
              // style: TextButton.styleFrom(backgroundColor: Colors.blue),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  name = "전우치(back-color)";
                });
              },
              child: const Text('TextButton'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                textStyle:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
            /* ElevatedButton과 TextButton 사이의 강도를 가지는 위젯으로
              텍스트 주변의 테두리가 default로 변경됨 */
            OutlinedButton(
                onPressed: () {
                  // 외부에 정의한 함수를 호출
                  _onClick1(1);
                },
                child: const Text(
                  'OutLinedButton',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                )),
            OutlinedButton.icon(
                // 외곽선 + 아이콘
                onPressed: () {
                  _onClick1(2);
                },
                icon: const Icon(
                  Icons.web,
                  size: 24.0,
                ),
                label: const Text(
                  "OutlinedButton",
                  style: TextStyle(fontSize: 24, color: Colors.red),
                )),
            OutlinedButton(
              onPressed: () {
                _onClick1(3);
              },
              child: const Text("Outlinedbutton"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                textStyle:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
            /* Flutter App에서 가장 많이 사용되는 버튼 */
            ElevatedButton(
                onPressed: () => _onClick1(4),
                child: const Text(
                  'ElevatedButton',
                  style: TextStyle(fontSize: 24, color: Colors.black38),
                )),
            // ElevatedButton + 아이콘 버튼
            ElevatedButton.icon(
                onPressed: () => _onClick1(5),
                icon: const Icon(Icons.web, size: 24.0),
                label: const Text(
                  'ElevationButton',
                  style: TextStyle(fontSize: 24, color: Colors.black38),
                )),
            ElevatedButton(
                onPressed: () => _onClick1(6),
                child: const Text('ElevatedButton'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                  shadowColor: Colors.red,
                  elevation: 5,
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                )),
            // 가로형 배치에 사용되는 레이아웃 위젯
            Row(
              children: [
                IconButton(
                  onPressed: _onClick2,
                  icon: const Icon(Icons.add_box),
                  iconSize: 60.0,
                  color: Colors.blue,
                  /* 버튼을 롱 클릭시 툴팁이 표시됨. 앱은 손가락을 올리는 순간
                     이벤트가 발생되므로 over와 같은 이벤트는 존재하지 않는다. */
                  tooltip: "툴팁입니다.",
                ),
                // image asset을 이용한 버튼
                IconButton(
                  onPressed: () => _onClick2(),
                  /* image를 활용한 버튼의 크기는 asset 내부에 width 속성으로
                  설정할 수 있다. */
                  icon: Image.asset(
                    "assets/images/300x100.png",
                    width: 150,
                  ),
                  // 이미지 자체의 크기가 있으므로 적용이 안됨.
                  // iconSize: 60.0,
                  tooltip: "툴팁입니다.",
                ),
              ],
            ),
          ],
        ),
        // Flutter 프로젝트 생성시 기본형으로 생성되는 플로팅 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onClick3(),
          tooltip: "앱에서는 롱터치에 툴팁을 보여줍니다.",
          child: const Icon(Icons.add),
        ));
  }

  void _onClick1(int kind) {
    setState(() {
      switch (kind) {
        case 1:
          name = "홍길동";
          break;
        case 2:
          name = "홍길동(icon)";
          break;
        case 3:
          name = "홍길동(back-color)";
          break;
        case 4:
          name = "손오공";
          break;
        case 5:
          name = "손오공(icon)";
          break;
        case 6:
          name = "손오공(back-color)";
          break;
        default:
      }
    });
  }

  void _onClick2() {
    setState(() {
      name = "해리포터";
    });
  }

  void _onClick3() {
    setState(() {
      name = "클릭하세요!";
    });
  }
}
