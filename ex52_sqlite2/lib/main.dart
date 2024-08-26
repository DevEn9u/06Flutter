import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

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
      home: const MyHomePage(title: 'SQLite 2'),
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
  // 데이터베이스 인스턴스 선언
  late Future<Database> database;

  @override
  void initState() {
    super.initState();
    // 앱 실행시 데이터베이스 인스턴스를 얻어옴
    database = getDB();
  }

  Future<Database> getDB() async {
    // 시스템(루트) 경로를 얻어온 후 mytest.db를 찾는다.
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'mytest.db');
    // 생성된 DB가 있는지 확인
    var exists = await databaseExists(path);
    // 없다면 우리가 준비한 DB 사용.
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      // 우리가 준비한 DB는 assets 디렉토리 하위에 존재함
      var data = await rootBundle.load(join('assets/database', 'original.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }
    // 데이터베이스 파일을 오픈한다.
    return await openDatabase(path);
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
              onPressed: () => doSelecetAll(),
              child: const Text(
                'select',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doSelecetAll() async {
    // family 테이블 조회를 위해 DB를 얻어온다.
    final Database db = await database;
    List<Map> datas = await db.rawQuery('SELECT * FROM family');
    // 레코드가 있다면 개수만큼 반복하여 내용 출력
    if (datas.isNotEmpty) {
      for (int i = 0; i < datas.length; i++) {
        String name = datas[i]['name'];
        int age = datas[i]['age'];
        String sex = datas[i]['sex'];
        String relation = datas[i]['relation'];

        print('$name $age $sex $relation');
      }
    } else {
      print('SelectAll : 데이터가 없습니다.');
    }
  }
}
