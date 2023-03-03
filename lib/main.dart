import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_chat_gpt/modules/chat/cubit/chat_cubit.dart';
import 'package:my_chat_gpt/modules/image_generations/cubit/image_cubit.dart';
import '/const/const.dart';
import 'modules/home/views/home_tab_view.dart';
import 'utils/enviroment.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ChatCubit()),
          BlocProvider(create: (context) => ImageCubit())
        ],
        child: const HomeTabView(),
      ),
    );
  }
}
