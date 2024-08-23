import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      home: const MyHomePage(title: 'sqlite1'),
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
  // Sqlite 사용을 위한 Database 인스턴스 변수
  late Future<Database> database;
  // sequence로 사용할 변수
  int seqNum = 0;
  // Text 필드에 입력된 내용을 읽어오기 위한 컨트롤러 인스턴스
  final ctlMyText1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 앱이 최초 시작할 때 데이터베이스 생성
    createDatabase();
  }

  // 각 플랫폼별로 database의 경로를 생성하여 DB파일 추가
  void createDatabase() async {
    database = openDatabase(
      /* Table과 Record를 저장하기 위한 DB파일 생성. 오라클이라면
        새로운 계정을 생성하는 것과 동일하다. */
      // `path` 패키지의 `join` 함수 사용
      join(await getDatabasesPath(), 'telbook.db'),
      onCreate: (db, version) {
        // 전화번호부를 담은 테이블 생성.
        return db.execute(
          "CREATE TABLE telbook( " +
              "  id INTEGER PRIMARY KEY, name TEXT, telnum TEXT)",
        );
      },
      // onCreate()에 DB 업그레이드와 다운그레이드를 위한 경로 제공
      version: 1,
    );
  }

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
          children: <Widget>[
            ElevatedButton(
              onPressed: () => doInsert(),
              child: const Text(
                'Insert',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => doSelectAll(),
              child: const Text(
                'Select All',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            // 텍스트 필드 외부에서 Sizedbox를 통해 너비 지정
            SizedBox(
              width: 240,
              // 입력을 위한 TextField 생성 및 controller 추가
              child: TextField(
                controller: ctlMyText1,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TextField에 입력한 값을 얻어온다.
                var sNum = ctlMyText1.text;
                // 값을 int형으로 변환한다.
                int nNum = int.parse(sNum);
                // 메서드 호출시 인수로 전달한다.
                doSelectOne(nNum);
              },
              child: const Text(
                'Select One',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            /* 수정, 삭제도 동일하게 입력된 값을 얻어온 후 메서드 호출 */
            ElevatedButton(
              onPressed: () {
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doUpdate(nNum);
              },
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doDelete(nNum);
              },
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => doDeleteAll(),
              child: const Text(
                'Delete All',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Record 전체 조회
  void doSelectAll() async {
    // 데이터베이스 reference 얻기
    final Database db = await database;

    List<Map> datas = await db.rawQuery('SELECT * FROM telbook');
    if (datas.length > 0) {
      for (int i = 0; i < datas.length; i++) {
        int id = datas[i]['id'];
        String name = datas[i]['name'];
        String telnum = datas[i]['telnum'];

        print('$id $name $telnum');
      }
    } else {
      print('SelectAll : 데이터가 없습니다.');
    }
  }

  // 매개변수로 전달된 데이터 1개만 가져오기
  void doSelectOne(int num) async {
    // 데이터베이스 reference 얻기
    final Database db = await database;

    List<Map> datas =
        await db.rawQuery('SELECT * FROM telbook WHERE id = $num');
    if (datas.length > 0) {
      int id = datas[0]['id'];
      String name = datas[0]['name'];
      String telnum = datas[0]['telnum'];

      print('$id $name $telnum');
    } else {
      print('SelectOne : 데이터가 없습니다.');
    }
  }

  Future<void> doInsert() async {
    // 데이터베이스 reference 얻기
    final db = await database;

    seqNum = seqNum + 1;
    var telnum = '010-1234-$seqNum$seqNum$seqNum$seqNum';

    int count = await db.rawInsert(
        'INSERT INTO telbook (id, name, telnum) VALUES (?, ?, ?)',
        [seqNum, '홍길동$seqNum', telnum]);

    print('Insert : $count');
  }

  Future<void> doUpdate(int id) async {
    // 데이터베이스 reference 얻기
    final db = await database;

    int count = await db.rawUpdate(
        'UPDATE telbook SET name = ?, telnum = ? WHERE id = ?',
        ['손오공', '010-1234-xxxx', id]);

    print('Update : $count');
  }

  Future<void> doDelete(int id) async {
    // 데이터베이스 reference 얻기
    final db = await database;

    int count = await db.rawDelete('DELETE FROM telbook WHERE id = ?', [id]);

    print('Delete : $count');
  }

  Future<void> doDeleteAll() async {
    // 데이터베이스 reference 얻기
    final db = await database;
    int count = await db.rawDelete('DELETE FROM telbook');

    print('DeleteAll : $count');
  }
}
