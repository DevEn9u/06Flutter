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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
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
  // 데이터로 사용할 List로 생성
  late List<Person> persons;

  // Widget 초기화 시 State를 초기화하는 수명주기 메서드
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
      // 3. ListView.separated를 사용해서 Lazy하게 생성. 아이템 사이에 구분자도 lazy하게 생성.
      body: ListView.separated(
        // 아이템 빌더 내에서 출력할 Tile 생성
        itemBuilder: (BuildContext context, int index) {
          // Person 인스턴스 외 추가 데이텅진 index 사용
          return PersonTile(persons[index], index);
        },
        // 구분선 표시
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black,
            // color: Colors.transparent,
            /* 구분선은 아래 속성에 따라 다른 결과를 출력하므로 선택해서
            사용한다. */
            height: 1,
            // thickness: 1.0,
          );
        },
        // 아이템 개수
        itemCount: persons.length,
      ),
    );
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
          // 타일을 1차로 가로형 배치한다.
          child: Row(
            children: [
              // 좌측 : SizedBox로 아이콘 표시
              SizedBox(
                width: 100,
                height: 150,
                child: Icon(
                  Icons.account_box,
                  size: 50.0,
                ),
              ),
              // 우측 : 남은 부분 전체를 이름, 버튼 등을 배치
              Expanded(
                // 타일을 2차로 수직형 배치한다.
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  // 3차로 타일을 가로형 배치한다.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 타일의 인덱스 번호
                      Text(
                        '$index번 타일',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // ElevatedButton 추가. 클릭시 외부 메서드 호출.
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          child: const Text(
                            'ElevatedButton',
                            style: TextStyle(fontSize: 24),
                          ),
                          // click시 람다형식으로 외부 메서드 호출
                          onPressed: () => _onClick(index),
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }

  void _onClick(int index) {
    print('$index번째 index 클릭됨');
  }
}
