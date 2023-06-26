import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async{
  // main関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();

  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();

  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras.first;

  // 取得できているか確認
  print(firstCamera);

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.camera,
  }):super(key: key);

  final CameraDescription camera;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera Prc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TakePictureScreen(camera: camera),
    );
  }
}

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key,
    required this.camera,
  }): super(key: key);



  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      //　解像度を指定
      ResolutionPreset.medium,
    );
    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize().then((_){
      setState(() {});
    });
  }

  void dispose(){
    // ウィジェットが破棄されたらコントローラーを破棄
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return CameraPreview(_controller);
            }else{
              return const CircularProgressIndicator();
            }
          },
            ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 写真を撮る
          final image = await _controller.takePicture();
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(imagePath: image.path),
              fullscreenDialog: true,
            ),
          );
    },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// 撮影した写真を表示する画面
class DisplayPictureScreen extends StatelessWidget{
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath
  }): super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('撮れた写真')),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
