import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CannotQuery(),
    );
  }
}

class CannotQuery extends StatelessWidget {
  const CannotQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      appBar: screenW <= 600
          ? AppBar(
              title: const Text("MobileApp"), backgroundColor: Colors.redAccent)
          : null,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _LandScapeContainer();
          } else {
            return _PortaitContainer();
          }
        },
      ),
    );
  }
}

Widget _LandScapeContainer() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildStack(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCard(),
            _buildPacking(),
          ],
        ),
      ],
    ),
  );
}

Widget _PortaitContainer() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStack(),
        _buildCard(),
        _buildPacking(),
      ],
    ),
  );
}

Widget _buildStack() {
  return Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://asianwiki.com/images/b/b4/Kang_Han-Na-p1.jpg"),
        radius: 150,
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: const Text(
          "Kang Han-Na",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Widget _buildCard() {
  return SizedBox(
    height: 210,
    width: 410,
    child: Card(
      child: Column(
        children: const [
          ListTile(
              title: Text(
                "Han-Na",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Korean, CA99984"),
              leading: Icon(
                Icons.apartment,
                color: Colors.redAccent,
              )),
          Divider(),
          ListTile(
            title: Text(
              "090-848-5155",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.redAccent,
            ),
          ),
          ListTile(
            title: Text(
              "Han-Na@mail.com",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPacking() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      // Icon(
      //   Icons.star,
      //   color: Colors.green,
      // ),
      // Icon(
      //   Icons.star,
      //   color: Colors.green,
      // ),
      // Icon(
      //   Icons.star,
      //   color: Colors.green,
      // ),
      // Icon(
      //   Icons.star,
      //   color: Colors.green,
      // ),
      // Icon(
      //   Icons.star,
      //   color: Colors.black,
      // ),
      Tabstar(),
      Tabstar(),
      Tabstar(),
      Tabstar(),
      Tabstar(),
    ],
  );
}

class Tabstar extends StatefulWidget {
  const Tabstar({Key? key}) : super(key: key);

  @override
  _TabstarState createState() => _TabstarState();
}

class _TabstarState extends State<Tabstar> {
  bool _active = false;

  void _handleTop() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTop,
      child: Icon(
        Icons.star,
        color: _active ? Colors.blue : Colors.white,
      ),
    );
  }
}
