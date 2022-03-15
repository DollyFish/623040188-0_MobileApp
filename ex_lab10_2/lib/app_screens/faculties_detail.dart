import 'package:flutter/material.dart';
import './faculties_data_model.dart';

class FacultiesDetail extends StatelessWidget {
  final FacultiesDataModel facultiesDataModel;
  const FacultiesDetail({Key? key, required this.facultiesDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(facultiesDataModel.name),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 35,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 25),
                color: Colors.grey[400],
                child: Text(
                  facultiesDataModel.link,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ),
              Text(
                facultiesDataModel.thainame,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Image.network(facultiesDataModel.img),
            ],
          ),
        ));
  }
}
