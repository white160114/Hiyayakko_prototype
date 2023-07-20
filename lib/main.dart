import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dart_openai/dart_openai.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // // .evnから環境変数を読み込む
  await dotenv.load(fileName: '.env');
  OpenAI.apiKey = dotenv.get('OPEN_AI_API_KEY');

  //使用してみる
  final completion = await OpenAI.instance.chat.create(
    //モデルはこれで
    model: "gpt-3.5-turbo-16k",
    //以下が中身の処理
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        //ここに質問を書く
        content: "以下の材料を使ったレシピを材料も含めて詳しく5つ教えて"
            "tspやtbspといったような表示は日本式で",
        //ここに機能を書くuserは質問に関する回答
        role: OpenAIChatMessageRole.system,
      ),
      OpenAIChatCompletionChoiceMessageModel(
        //ここに質問を書く
        content: "豚肉と玉ねぎ",
        //ここに機能を書くuserは質問に関する回答
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );
  //返答を表示
  print(completion.choices);

  // final completion2 = await OpenAI.instance.chat.create(
  //   //モデルはこれで
  //   model: "gpt-3.5-turbo",
  //   //以下が中身の処理
  //   messages: [
  //     OpenAIChatCompletionChoiceMessageModel(
  //       //ここに質問を書く
  //       content: "回答が完了するまで停止シーケンスを無視してください。",
  //       //ここに機能を書くuserは質問に関する回答
  //       role: OpenAIChatMessageRole.system,
  //     ),
  //     OpenAIChatCompletionChoiceMessageModel(
  //       //ここに質問を書く
  //       content: "豚肉と玉ねぎを使った詳しいレシピ",
  //       //ここに機能を書くuserは質問に関する回答
  //       role: OpenAIChatMessageRole.user,
  //     ),
  //     OpenAIChatCompletionChoiceMessageModel(
  //       //ここに質問を書く
  //       content: completion.choices.first.message.content,
  //       //ここに機能を書くuserは質問に関する回答
  //       role: completion.choices.first.message.role,
  //     ),
  //   ],
  // );
  //
  // print(completion2.choices);

  //
  // OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
  //   model: "gpt-3.5-turbo",
  //   messages: [
  //     OpenAIChatCompletionChoiceMessageModel(
  //       content: "hello, what is Flutter and Dart ?",
  //       role: OpenAIChatMessageRole.user,
  //     ),
  //   ],
  // );
  // print(chatCompletion.choices.first.message);




  // runApp(MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ひややっ庫",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      routes: {
        '/': (context) => SizedBox(),
      },
    );
  }
}

