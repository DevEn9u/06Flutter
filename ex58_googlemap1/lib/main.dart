import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  // Map Controller
  Completer<GoogleMapController> _controller = Completer();
  LatLng _myLoc1 = LatLng(37.5797551550774, 126.97706246296076); // 경복궁
  LatLng _myLoc2 = LatLng(37.578932311976125, 126.99489126244981); // 창경궁
  LatLng _myLoc3 = LatLng(37.5691, 126.9845); // 창경궁

  // 여러개의 Marker를 저장할 List 정의
  List<Marker> _markers = [];

  void setMarkerData() {
    final marker1 = Marker(
      markerId: MarkerId('A01'),
      // 위·경도를 가진 LatLng 인스턴스로 설정
      position: _myLoc1,
      // 풍선도움말. 마커 클릭시 상단에 출력됨.
      infoWindow: InfoWindow(
        title: "경복궁",
        snippet: "여기는 경복궁입니다.",
        onTap: () {
          print('경복궁이에욥');
        },
      ),
    );
    // Marker 생성후 List에 추가
    _markers.add(marker1);
    final marker2 = Marker(
      markerId: MarkerId('A02'),
      position: _myLoc2,
      infoWindow: InfoWindow(
        title: "창경궁",
        snippet: "여기는 창경궁입니다.",
        onTap: () {
          print('창경궁이에욥');
        },
      ),
    );
    _markers.add(marker2);
    final marker3 = Marker(
      markerId: MarkerId('A03'),
      position: _myLoc3,
      infoWindow: InfoWindow(
        title: "더조은 컴퓨터 아카데미 별관",
        snippet: "더조은 컴퓨터 아카데미 별관입니다.",
        onTap: () {
          print('Welcome to 더조은');
        },
      ),
    );
    _markers.add(marker3);
  }

  @override
  void initState() {
    super.initState();
    // 최초 앱 실행시 Marker 생성
    setMarkerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // Container 내부에 구글맵 추가
            height: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _myLoc1,
                zoom: 15.0,
              ),
              markers: Set.from(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => goToLocation(_myLoc1),
                child: const Text(
                  '경복궁 이동',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              // SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => goToLocation(_myLoc2),
                child: const Text(
                  '창경궁 이동',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              // SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => goToLocation(_myLoc3),
                child: const Text(
                  '더조은 별관 이동',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> goToLocation(LatLng loc) async {
    final GoogleMapController controller = await _controller.future;

    final CameraPosition pos = CameraPosition(
      target: loc,
      zoom: 15, // zoom level(숫자가 커질수록 확대됨)
      // bearing: 180.0,   // 지도 동서남북 회전
      // tilt: 60.0,       // 지도 눕히기
    );

    // animation 효과 없이 화면 전환하는 카메라
    // controller.moveCamera(CameraUpdate.newCameraPosition(pos));
    // animation 효과가 있는 카메라
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }
}
