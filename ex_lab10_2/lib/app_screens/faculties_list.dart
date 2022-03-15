import 'package:flutter/material.dart';
import './faculties_data_model.dart';
import './faculties_detail.dart';

class FacultiesList extends StatefulWidget {
  const FacultiesList({Key? key}) : super(key: key);

  @override
  _FacultiesListState createState() => _FacultiesListState();
}

class _FacultiesListState extends State<FacultiesList> {
  static List<String> facultiesname = [
    "Engineering",
    "Medicine",
    "Architecture"
  ];
  static List<String> facultiesThainame = [
    "วิศวกรรมศาสตร์",
    "แพทยศาสตร์",
    "สถาปัตยกรรมศาสตร์"
  ];
  static List<String> facultieslink = [
    "https://www.en.kku.ac.th/web/",
    "https://md.kku.ac.th/",
    "https://arch.kku.ac.th/web/"
  ];

  static List<String> facultiesimg = [
    "https://www.en.kku.ac.th/web/wp-content/uploads/2018/06/DSC_3445-c%E0%B9%81%E0%B8%81%E0%B9%893000.jpg",
    "https://admissions.kku.ac.th/wp-content/uploads/2021/08/03.jpg",
    "https://www.u-review.in.th/timthumb.php?src=/uploads/contents/20160811142552uE0fuxK.jpg&w=923&h=520"
  ];

  final List<FacultiesDataModel> facultiesData = List.generate(
      facultiesname.length,
      (index) => FacultiesDataModel(facultiesname[index],
          facultiesThainame[index], facultieslink[index], facultiesimg[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KKU Faculties"),
      ),
      body: ListView.builder(
        itemCount: facultiesData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(facultiesData[index].name),
              leading: const Icon(Icons.arrow_right_outlined),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FacultiesDetail(
                          facultiesDataModel: facultiesData[index],
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}
