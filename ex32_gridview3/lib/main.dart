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
      home: const MyHomePage(title: 'GridView Widget3'),
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
  late List<Person> persons;

  @override
  void initState() {
    super.initState();

    persons = [];
    for (int i = 0; i < 15; i++) {
      persons.add(Person(i + 21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        /* 화면 전체를 감싸는 Container는 아래와 같이 사이즈를 지정하지
          않는 것이 좋다. 가로는 부모의 크기를 지정하고, 세로는 전체화면으로
          표시된다. */
        // width: double.infinity,
        // height: 400.0,
        // GridView Widget 선언
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          // 수평/수직 방향의 아이템간의 간격 조정
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // 한줄에 표시할 아이템 개수
          crossAxisCount: 3,
          // 아이템의 가로/세로 비율
          childAspectRatio: 0.7,
          // GridView에 출력할 컨테이너를 List로 반환
          children: getGridPage(),
        ),
      ),
    );
  }

  // GridView의 아이템을 출력할 메서드
  List<Widget> getGridPage() {
    // List 선언
    List<Widget> grid = [];
    for (int i = 0; i < persons.length; i++) {
      // 각 항목은 Container로 Wrapping
      Widget myWidget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        color: Colors.blue[100],
        // 항목에 표시할 type을 PersonTile 인스턴스로 생성
        child: PersonTile(persons[i], i),
      );
      // 항목 생성 후 List에 추가한다.
      grid.add(myWidget);
    }
    // GridView Widget으로 반환
    return grid;
  }
}

// ### 데이터로 사용할 VO클래스 ###
class Person {
  int age;
  String name;
  bool isLeftHanded;

  Person(this.age, this.name, this.isLeftHanded);
}

// ### ListTile 생성용인 PersonTile 클래스 ###
class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;

  // 추가 데이터는 생성자를 통해 추가할 수 있다.
  PersonTile(this._person, this.index);

  @override
  Widget build(BuildContext context) {
    // ListTile 대신 Card 위젯을 사용해서 커스텀 디자인 적용
    return Card(
      // 배경색
      color: Colors.amber[100],
      elevation: 0,
      // Card의 border 속성(color, 두께, 원형 적용)
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: InkWell(
        // Card 클릭시 effect: splach되는 색 지정
        splashColor: Colors.blue,
        // Card 클릭시 동작
        onTap: () {
          print('$index번 타일 클릭됨');
        },
        child: SizedBox(
          width: 140,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: Icon(
                        Icons.account_box,
                        size: 30,
                      ),
                    ),
                    // name
                    Text(
                      _person.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // age
                    Text(
                      "${_person.age}세",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text(
                  '보기',
                  style: TextStyle(fontSize: 14),
                ),
                // click시 람다형식으로 외부 메서드 호출
                onPressed: () => _onClick(index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClick(int index) {
    print('$index번째 index 클릭됨');
  }
}
