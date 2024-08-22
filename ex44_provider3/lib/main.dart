import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// 데이터로 사용될 VO 클래스 정의
class MyData extends ChangeNotifier {
  // 멤버변수 : 초기값 설정
  String name = '홍길동';
  int age = 25;

  // 데이터 변경시 호출할 메서드 정의
  void change(String name, int age) {
    // 로그 및 값 변경
    print('chagne called... 변화가 일어나는중 두둥');
    this.name = name;
    this.age = age;

    // 데이터 변경 후 호출하면 변경된 값을 반영할 수 있다.
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /* MaterialApp 전체를 wrappin한다. 이를 통해 앱 전체에서
      데이터를 공유할 수 있다. */
    return ChangeNotifierProvider<MyData>(
      // 공유할 데이터 인스턴스 생성
      create: (_) => MyData(),
      // 앱이 시작되면 Page1이 로드된다.
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
  // 차후 초기화 될 것임을 명시하여 멤버변수 생성
  late MyData myData;

  @override
  Widget build(BuildContext context) {
    /* 공유 데이터 사용을 위해 Provider 선언시 변경이 있더라도
      변경에 대한 알림 받지 않도록 false로 선언한다. 이 경우 변경이
      되더라도 즉시 build되지 않는다. */
    myData = Provider.of<MyData>(context, listen: false);
    print('Page 1 빌드됨...');

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
              child: const Text(
                '2페이지 추가',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
            const SizedBox(height: 50),
            /* 아래 2개의 버튼을 클릭하면 기존의 데이터가 변경된다.
              변경을 위해 인스턴스 내부의 change()를 호출한다. */
            ElevatedButton(
              onPressed: () {
                myData.change('전우치1', 30);
              },
              child: const Text(
                '전우치로',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                myData.change('홍길동1', 25);
              },
              child: const Text(
                '홍길동으로',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 50),
            /* 처음 빌드될 때의 데이터로 표시된다. 이 부분이 변경되려면
              Page1 위젯이 새롭게 렌더링되어야 한다. */
            Text(
              '${myData.name} = ${myData.age}',
              style: const TextStyle(fontSize: 30),
            ),
            /* 공유 데이터 사용을 위한 위젯. 데이터 변경이 일어나면 
              builder property에 지정된 익명함수가 호출되고 지정된 위젯만 새롭게 렌더링된다. */
            Consumer<MyData>(builder: (context, myData, child) {
              print('여기도 빌드됨');
              return Text(
                '${myData.name} - ${myData.age}',
                style: const TextStyle(fontSize: 30),
              );
            })
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
  late MyData myData;

  @override
  Widget build(BuildContext context) {
    /* 공유 데이터 사용. 변경에 대한 알림을 받기 위해 true로 설정
      이 경우 데이터의 변경이 있을 때마다 알림을 받아 페이지 전체가
      새롭게 렌더링 된다. */
    myData = Provider.of<MyData>(context, listen: true);
    print('Page2 빌드됨...');

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
              child: const Text(
                '2페이지 제거',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 50),
            /* 변경된 데이터를 처리하기 위해 페이지 전체가 새롭게 렌더링
              되므로 버튼을 누를 때마다 이 부분도 변경된다. */
            ElevatedButton(
              onPressed: () {
                myData.change('전우치2', 31);
              },
              child: const Text(
                '전우치로',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                myData.change('홍길동2', 26);
              },
              child: const Text(
                '홍길동으로',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 50),
            /* 변경된 데이터를 처리하기 위해 페이지 전체가 새롭게
              렌더링 되므로 버튼을 누를 때마다 이 부분도 변경된다. */
            Text(
              '${myData.name} = ${myData.age}',
              style: const TextStyle(fontSize: 30),
            ),
            /* Provider에 의해 변경된 데이터를 확인할 수 있다. */
            Consumer<MyData>(builder: (context, myData, child) {
              print('여기도 빌드됨');
              return Text(
                '${myData.name} - ${myData.age}',
                style: const TextStyle(fontSize: 30),
              );
            })
          ],
        ),
      ),
    );
  }
}
