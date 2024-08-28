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
      home: const MyHomePage(title: 'Google Maps - Polyline'),
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
  Completer<GoogleMapController> _controller = Completer();
  // 지도의 최초 중심좌표
  LatLng _myLoc = LatLng(37.5797551550774, 126.97706246296076);
  // Marker와 Polyline의 좌표값을 저장할 List
  List<Marker> _markers = [];
  List<Polyline> _polylines = [];
  // 궁에 대한 위치값 저장
  List<Palace> palaces = [
    Palace("경복궁", LatLng(37.5797551550774, 126.97706246296076)),
    Palace("경희궁", LatLng(37.57136511434671, 126.96815224932355)),
    Palace("덕수궁", LatLng(37.565868063366096, 126.97515644898421)),
    Palace("창덕궁", LatLng(37.57968911285638, 126.99111100341483)),
    Palace("창경궁", LatLng(37.578932311976125, 126.99489126244981)),
  ];

  // Marker에 대한 color 지정
  List<double> hue = [
    // BitmapDescriptor.hueAzure,
    BitmapDescriptor.hueBlue,
    BitmapDescriptor.hueCyan,
    BitmapDescriptor.hueGreen,
    BitmapDescriptor.hueMagenta,
    // BitmapDescriptor.hueOrange,
    BitmapDescriptor.hueRed,
    // BitmapDescriptor.hueRose,
    // BitmapDescriptor.hueViolet,
    // BitmapDescriptor.hueYellow,
  ];

  // 궁의 개수만큼 Marker 객체 생성
  void makeMarkerData() {
    int i = 0;
    for (Palace palace in palaces) {
      final marker = Marker(
        markerId: MarkerId(palace.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(hue[i]),
        position: palace.position,
        infoWindow: InfoWindow(
          title: palace.name, // infoWindow의 제목
          // snippet: "",   // 소제목
          onTap: () {
            print('onTap : ${palace.name}');
          },
        ),
      );
      _markers.add(marker);
      i++;
    }
  }

  // Polyline 표시
  void makePolyline() {
    List<LatLng> coordinates = [];
    for (int i = 0; i < palaces.length; i++) {
      coordinates.add(
        LatLng(palaces[i].position.latitude, palaces[i].position.longitude),
      );
    }
    // Polyline 속성
    Polyline polyline = Polyline(
        polylineId: PolylineId("poly"),
        patterns: [PatternItem.dash(10), PatternItem.gap(10)],
        color: Colors.red,
        width: 3,
        // 앞에서 5개의 궁의 위치를 저장한 List를 points 프로퍼티에 설정
        points: coordinates); 
    // Polyline 추가
    _polylines.add(polyline);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    makeMarkerData();
    makePolyline();
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              // width: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: _myLoc,
                  zoom: 14.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set.from(_markers),
                polylines: Set.from(_polylines),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 궁을 표현하는 DTO 클래스
class Palace {
  // 이름
  late final String name;
  // 위·경도 표시를 위한 인스턴스
  late final LatLng position;
  // 생성자
  Palace(this.name, this.position);
}
