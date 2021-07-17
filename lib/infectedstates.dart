import 'package:flutter/material.dart';

class Regions extends StatelessWidget {
  final Map stateData;

  const Regions({Key key, this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          padding: EdgeInsets.all(6),
                          child: Text(
                            stateData["states"][index]["state"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.blueGrey,
                            ),
                          )),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            stateData["states"][index]['active'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          Text(
                            stateData["states"][index]['recovered'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            stateData["states"][index]['cases'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            stateData["states"][index]['deaths'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
        itemCount: stateData['states'].length,
      ),
    );
  }
}
