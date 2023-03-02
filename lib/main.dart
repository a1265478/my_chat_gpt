import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/const/const.dart';
import 'utils/enviroment.dart';
import 'modules/chat/views/chat_view.dart';

void main() async {
  await dotenv.load(fileName: Enviroment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Chat GPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(color: kCardColor),
      ),
      home: const ChatView(),
    );
  }
}
