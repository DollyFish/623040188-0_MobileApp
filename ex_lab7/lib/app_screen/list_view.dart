import 'package:flutter/material.dart';

class List_view extends StatelessWidget {
  const List_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        ListTile(
          title: const Text('Engineer'),
          leading: const Icon(Icons.engineering),
          trailing: const Icon(Icons.star),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("EN"))),
        ),
        ListTile(
          title: const Text('Agriculture'),
          leading: const Icon(Icons.agriculture),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("AG"))),
        ),
        ListTile(
          title: const Text('Architecture'),
          leading: const Icon(Icons.architecture),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("AR"))),
        ),
      ],
    );
  }
}
