import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: MyHomePage(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  AudioPlayer player = AudioPlayer();
                  final _playlistConcatenated =
                      ConcatenatingAudioSource(children: createPlaylist());
                  print('hier');
                  player
                      .setAudioSource(_playlistConcatenated)
                      .then((value) => print('fertig'));
                },
                child: Text('load playlist')),
            ElevatedButton(
                onPressed: () {
                  print('fertig');
                  Navigator.pop(context);
                },
                child: Text('pop page'))
          ],
        ));
      }));
    });
    return Container(
      child: Center(child: Text('homepage')),
    );
  }
}

List<AudioSource> createPlaylist() {
  List<AudioSource> result = [];
  for (int i = 0; i < 100000; i++) {
    result.add(AudioSource.uri(Uri.parse('asset:///assets/1.mp3')));
  }
  return result;
}
