import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:permission_handler/permission_handler.dart';

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
  // Goodle Cloud console에서 직접 발급 받아서 사용해야 한다.
  final String _apiKey = 'AIzaSyC6zwts5_J_u2n9fgs6oh7lF-bWaeHkqsY';
  // 위·경도와 주소를 상호 변경해주는 인스턴스
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  // 위치에 대한 정보를 제공하는 인스턴스
  late Position _currentPosition;
  String currentAddress = '';
  String lat = '';
  String lon = '';

  // 위도, 경도 구하기
  _getCurrentLocation() async {
    // 권한 설정 요청
    await Permission.location.request().then((status) {
      // 사용자가 요청에 대해 허가를 해주면 ...
      if (status == PermissionStatus.granted) {
        // 내 위치를 가져온다.
        Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best,
                forceAndroidLocationManager: false)
            .then((Position position) {
          _currentPosition = position;
          // 본인의 위·경도를 구해와서 상태 변경
          setState(() {
            lat = '${position.latitude}';
            lon = '${position.longitude}';
          });
        }).catchError((e) {
          print(e);
        });
      } else {
        print('위치 서비스를 사용할 수 없습니다.');
      }
    });
  }

  // 위도, 경도로 주소 구하기
  Future<void> _getAddressFromLatLng() async {
    final address = await geocoder.findAddressesFromCoordinates(
        Coordinates(_currentPosition.latitude, _currentPosition.longitude));
    var message = address.first.addressLine;
    if (message == null) return;

    // 현재 위치를 기반으로 주소를 구한 후 상태를 변경한다.
    setState(() {
      currentAddress = message;
    });
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
            Text("$lat $lon"),
            Text(currentAddress),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: const Text(
                '현재 위치 찾기',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _getAddressFromLatLng();
              },
              child: const Text(
                '현재 주소 구하기',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
