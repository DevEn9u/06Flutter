import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

typedef _Fn = void Function();

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
      home: const MyHomePage(title: 'Record Widget'),
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
  FlutterSoundPlayer? _mPlayer;
  FlutterSoundRecorder? _mRecorder;

  final Codec _codec = Codec.aacMP4;
  final String _mPath = 'tau_file.mp4';
  bool _mPlayerisInited = false;
  bool _mRecorderisInited = false;
  bool _mPlaybackReady = false;

  @override
  void initState() {
    _mPlayer = FlutterSoundPlayer();
    _mRecorder = FlutterSoundRecorder();

    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerisInited = true;
      });
    });

    openTheRecorder().then((value) {
      print('dddd');
      _mRecorderisInited = true;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // stopPlayer();
    _mPlayer!.closePlayer();
    _mPlayer = null;

    // stopRecorder();
    _mRecorder!.closeRecorder();
    _mRecorder = null;

    super.dispose();
  }

  Future<void> openTheRecorder() async {
    print('aaaa');
    await Permission.microphone.request().then((status) {
      if (status != PermissionStatus.granted) {
        print('bbbb : $status');
        throw RecordingPermissionException('Microphone permission not granted');
      }
    });
    await _mRecorder!.openRecorder().then((value) {
      print('cccc');
      _mRecorderisInited = true;
    });
  }

  // #### recording and playback ###

  void record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: AudioSource.microphone,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        // var url = value;
        _mPlaybackReady = true;
      });
    });
  }

  void play() {
    _mPlayer!.startPlayer(
      fromURI: _mPath,
      codec: Codec.aacADTS,
      whenFinished: () {
        setState(() {});
      },
    );
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }

  // ### UI ###

  _Fn? getRecorderFn() {
    if (!_mRecorderisInited || !_mPlayer!.isStopped) {
      print('mRecorderIsInited : $_mRecorderisInited');
      print('_mPlayer!.isStopped : ${_mPlayer!.isStopped}');
      return null;
    }
    return _mRecorder!.isStopped ? record : stopRecorder;
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerisInited || !_mPlaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
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
            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: getRecorderFn(),
                    child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    _mRecorder!.isRecording
                        ? 'Recording in progress'
                        : 'Recorder is stopped',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: getPlaybackFn(),
                    child: Text(_mRecorder!.isRecording ? 'Stop' : 'Play'),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    _mRecorder!.isRecording
                        ? 'Playback in progress'
                        : 'Player is stopped',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
