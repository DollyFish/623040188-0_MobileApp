import 'package:flutter/material.dart';
import 'widgets/pokemon_info.dart';
import 'widgets/pokemon_quiz.dart';

void main() {
  runApp(const MyApp());
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
        '/': (context) => const Exercise2(),
        '/Quiz': (context) => const PokemonInfo(),
      },
    );
  }
}

class Exercise2 extends StatelessWidget {
  const Exercise2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 150),
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
