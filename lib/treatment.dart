import 'package:flutter/material.dart';
import './datasourcefile.dart';

class Treatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment'),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //         child: Text(
      //       DataSource.treathead[0],
      //     ))
      body: ListView.builder(
          itemCount: DataSource.treatment.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.treatment[index]['heading'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(DataSource.treatment[index]['text']),
                )
              ],
            );
          }),
    );
  }
}
