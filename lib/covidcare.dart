import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Care extends StatelessWidget {
  Future<void> customlaunch(command) async {
    if (await canLaunch(command)) {
      await launch(
        command,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $command';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-Care"),
      ),
      body: Container(
        color: Colors.blue[200],
        width: 380,
        height: 200,
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Toll-free Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      color: Colors.blue[100],
                      onPressed: () {
                        customlaunch('tel: 1075');
                      },
                      child: Text("1075")),
                ),
              ]),
              Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "E-mail ID",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          color: Colors.blue[100],
                          onPressed: () {
                            customlaunch(
                                'mailto:ncov2019@gov.in?subject=test%20subject&body=test%20body');
                          },
                          child: Text("ncov2019@gov.in")),
                    ),
                  ]),
              Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Website",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          color: Colors.blue[100],
                          onPressed: () {
                            customlaunch("https://www.mohfw.gov.in/");
                          },
                          child: Text("https://www.mohfw.gov.in/")),
                    )
                  ])

              //   Text("",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              //   Text("Website",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

              // ],
            ],
          ),
        ),
      ),
    );
  }
}
