// ignore_for_file: depend_on_referenced_packages, unused_import
/*
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:aplication_pru/jobs/view_csv_data.dart';
import 'package:csv/csv.dart';

class CsvGenerator extends StatelessWidget {
  final EldenLabs _databaseService = Ioc.get<EldenLabs>();

  CsvGenerator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV generate and load'),
        actions: <Widget>[
          InkWell(
            onTap: () => _generateCSVAndView(context),
            child: Align(
              alignment: Alignment.center,
              child: Text('CSV'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: StreamBuilder(
          stream: _databaseService.list(),
          builder: (_, AsyncSnapshot<List<EldenLabs>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "No data found !!!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }

            return ListView(
              children: snapshot.data.map((item) {
                return CrudListItem(
                  item: item,
                  onPressedDelete: (item) {},
                  onPressedEdit: (item) {},
                );
              }).toList(),
            );
          }),
    );
  }

  Future<void> _generateCSVAndView(context) async {
    List<EldenLabs> data = await _databaseService.list().first;
    List<List<String>> csvData = [
      // headers
      <String>['Name'],
      // data
      ...data.map((item) => [item.name]),
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path =
        '$dir/assets/telemeria/000ddb06-dcc8-4bbb-acb8-d457f9f715e1.csv';

    // create file
    final File file = File(path);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoadAndViewCsvPage(path: path),
      ),
    );
  }
}*/
