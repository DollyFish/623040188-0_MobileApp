import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PetName extends StatelessWidget {
  final String name;
  final String images;
  const PetName(this.name, this.images);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Image(
              image: NetworkImage(images),
              height: 150,
              width: 110,
            ),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Pet App'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              PetName('Bird',
                  'https://cdn.discordapp.com/attachments/751811900127314011/925228730937376858/1200px-Eopsaltria_australis_-_Mogo_Campground.jpg'),
              PetName('Dog',
                  'https://cdn.discordapp.com/attachments/751811900127314011/925228798503444480/download.jpg'),
              PetName('Cat',
                  'https://cdn.discordapp.com/attachments/751811900127314011/925228730459250718/mock_ST_newSadCat.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
