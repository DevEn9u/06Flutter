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
      home: const MyHomePage(title: 'ListView 1'),
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
      /*
        방법1 : 명시적으로 ListView의 children으로 List를 넘겨서
          생성한다. ListView가 load될 때 데이터까지 한번에 load되므로
          개수가 적을 때 적합한 방식이다.
       */
      body: ListView(
        // 1단계
        // children: [
        //   ListTile(
        //     // 좌측 아이콘(혹은 이미지)
        //     leading: FlutterLogo(
        //       size: 50.0,
        //     ),
        //     // 타일에 출력할 제목
        //     title: Text('Basic #1'),
        //     // 출력할 내용
        //     subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        //     // 우측 아이콘
        //     trailing: Icon(Icons.more_vert),
        //     // tap했을 때 동작
        //     onTap: () {
        //       print('Basic #1, ListView의 Tile tap');
        //     },
        //   ),
        // ],

        // 2단계
        // children: getMyList1(),

        // 3단계
        children: getMyList2(),
      ),
    );
  }

  // 2단계: body 내에서 작성했던 부분을 별도의 메서드로 구성
  // 메서드의 return 값으로 Scaffold의 body 구성
  List<Widget> getMyList1() {
    List<Widget> myList = [
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #2'),
        subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #2, 2단계: ListView의 Tile tap');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
        // indent는 '들여쓰기' 뜻을 가지고 있다. 좌우측의 여백을 지정하는 속성이다.
        indent: 10,
        endIndent: 10,
      ),
    ];
    return myList;
  }

  // 3단계: data를 이용해서 개수만큼 반복하는 List를 생성
  // 메서드의 return 값으로 Scaffold의 body 구성
  List<Widget> getMyList2() {
    // 데이터로 사용할 리스트 생성
    List<Person> persons = [];
    for (int i = 0; i < 15; i++) {
      persons.add(Person(i + 21, '홍길동$i', true));
    }

    // 앞에서 준비한 데이터를 이용해서 리스트 생성
    List<Widget> myList = [];
    for (int i = 0; i < persons.length; i++) {
      /* 데이터 개수만큼 ListTile을 생성하여 List에 추가한다.
        ListTile은 Widget으로 받을 수 있다. */
      Widget wid = ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #$i'),
        subtitle: Text('${persons[i].name} - ${persons[i].age}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #3, 3단계: ListView의 Tile tap');
        },
      );
      
      // ListTile 인스턴스 생성 후 List에 추가한다.
      myList.add(wid);
    }

    return myList;
  }
}

// 데이터로 사용할 DTO class
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}
