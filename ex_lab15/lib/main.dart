import 'package:flutter/material.dart';
import 'widgets/pokemon_info.dart';
import 'package:provider/provider.dart';
import 'states/screen_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TotalScore(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Flutter Exercise by Dol Hinta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/Quiz': (context) => const PokemonInfo(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              const Image(
                image: AssetImage("images/quiz.jpg"),
                width: 300,
                height: 300,
              ),
              const Text(
                "Welcome to the Quiz App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Text(
                "By Dol Hinta 623040188-0",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/Quiz'),
                child: const Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
