import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './infectedstates.dart';

class Worldwide extends StatefulWidget {
  final Map countryData;

  const Worldwide({Key key, this.countryData}) : super(key: key);

  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  Map stateData;
  fetchstateData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/gov/india'));

    setState(() {
      stateData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchstateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(4, 12, 0, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14, 17, 0, 0),
                alignment: Alignment.topLeft,
                child: Text("INDIA",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    textAlign: TextAlign.left),
              ),
              SingleChildScrollView(
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  children: <Widget>[
                    StatusPanel(
                      title: 'CONFIRMED',
                      textColor: Colors.red,
                      count: widget.countryData['cases'].toString(),
                    ),
                    StatusPanel(
                      title: 'ACTIVE',
                      textColor: Colors.blue[900],
                      count: widget.countryData['active'].toString(),
                    ),
                    StatusPanel(
                      title: 'RECOVERED',
                      textColor: Colors.green,
                      count: widget.countryData['recovered'].toString(),
                    ),
                    StatusPanel(
                      title: 'DEATHS',
                      textColor: Colors.grey[900],
                      count: widget.countryData['deaths'].toString(),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(14),
                  child: Text(
                    "Regional Data",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Active",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recovered",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.red[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Confirmed",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.brown[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Deaths",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// )/;
                  ],
                ),
              ),
              stateData == null
                  ? Text("Unable to fetch Data,Check Your Connection !")
                  : SingleChildScrollView(
                      child: Regions(
                        stateData: stateData,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(3),
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
