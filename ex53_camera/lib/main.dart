import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart'; // 갤러리에 저장
import 'package:image_picker/image_picker.dart'; // 앰범과 카메라

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
  final ImagePicker _picker = ImagePicker();
  // image_picker 모듈에서 file 객체 반환. iOS에서 에러
  // late File mPhoto; // 나중에 들어온다.
  File? mPhoto; // null일 수도 있다.
  XFile? image;
  late Widget photo;

  @override
  Widget build(BuildContext context) {
    Widget photo = (mPhoto != null) ? Image.file(mPhoto!) : Text('EMPTY');
    if (mPhoto != null) {
      photo = Image.file(
        mPhoto!,
        fit: BoxFit.contain, // 작은 쪽에 맞춤. 큰 쪽에 여백 남음
        // alignment: Alignment.center, // 현재는 필요 없음
        // width: 300.0,
        // height: 300.0,
      );
    } else {
      photo = const Text('EMPTY');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => takePhoto(ImageSource.gallery),
                  child: const Text(
                    'Album',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () => takePhoto(ImageSource.camera),
                  child: const Text(
                    'Camera',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () => savePhoto(),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            Expanded(
              child: photo,
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // final XFile? image = await _picker.pickImage(source: source);
    image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        mPhoto = File(image!.path);
      });
    } else {
      print('사진 선택이 취소되었습니다.');
    }
  }

  void savePhoto() async {
    if (image != null) {
      GallerySaver.saveImage(image!.path).then((bool? success) {
        print('Image saved on gallery');
        setState(() {
          mPhoto = null;
        });
      });
    }
  }
}
