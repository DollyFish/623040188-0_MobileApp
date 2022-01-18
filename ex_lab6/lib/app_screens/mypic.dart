import 'package:flutter/material.dart';

class MyPicAsset extends StatelessWidget {
  const MyPicAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/mypic.jpg");
    Image image = Image(
      image: assetImage,
      width: 500,
      height: 400,
    );
    return Container(
      child: image,
    );
  }
}
