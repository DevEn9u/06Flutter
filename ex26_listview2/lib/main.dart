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
      home: const MyHomePage(title: 'ListView2 Widget'),
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
  // 나중에 초기화될 것임을 명시(late)하여 데이털 사용할 List 선언
  late List<Person> persons;

  /* Widget 초기화시 딱 한번만 호출되는 함수로 State를 초기화한다.
    코드 변경시 Hot reload가 적용되지 않으므로 반드시 Restart해야 한다. */
  @override
  void initState() {
    super.initState(); // must call in v2.0 ~

    // 데이터 초기화
    persons = [];
    // 15개의 Person 인스턴스를 추가한다.
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
      // 2. ListView.builder를 사용해서 Lazy하게 생성
      /* index를 이용하여 Flutter가 알아서 필요한만큼 list를 생성한다.
        전체를 한꺼번에 생성하지 않으므로 메모리가 절약되고, 속도도 빨라진다. */
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        // 컬렉션에 저장된 아이템의 개수만큼 알아서 반복한다.
        itemCount: persons.length,
        // 아이템 개수만큼 Tile을 생성하여 반환한다.
        itemBuilder: (BuildContext context, int index) {
          return PersonTile(persons[index]);
        },
      ),
    );
  }

  // 방식1에서 사용하는 메서드(명시적으로 children 넘기기)
  // List<Widget> getMyList() {
  //   // 클래스로 미리 만들어 놓은 타일을 객체로 만들어 리스트 생성
  //   List<Widget> myList = [];
  //   for (int i = 0; i < persons.length; i++) {
  //     PersonTile personTile = new PersonTile(persons[i]);
  //     myList.add(personTile);
  //   }

  //   return myList;
  // }
}

// ### 데이터로 사용할 VO클래스 ###
class Person {
  // 멤버변수
  int age;
  String name;
  bool isLeftHand;

  // 축약형 생성자
  Person(this.age, this.name, this.isLeftHand);
}

// ### ListView를 구성할 PersonTile 클래스 정의 ###
class PersonTile extends StatelessWidget {
  // 멤버변수와 생성자 정의
  final Person _person; // '_'로 선언하였기에 private으로 선언
  PersonTile(this._person);

  @override
  Widget build(BuildContext context) {
    // 여기서 출력할 타일을 생성한다.
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age}세"),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        print(_person.name);
      },
    );
  }
}
