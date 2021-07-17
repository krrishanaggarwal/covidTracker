import 'dart:convert';
import './covidcare.dart';

import 'package:corona_version2/faqs.dart';
import 'package:corona_version2/treatment.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'datasourcefile.dart';
import 'activecases.dart';
import 'package:corona_version2/Vaccineslot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'gridtile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Future<void> _launched;
  String _launchUrl =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public';
  String _url =
      "https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html";
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Map countryData;
  fetchCountryData() async {
    http.Response response = await http.get(
        Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries/india'));

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              // margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.blue[50],
                    elevation: 6,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Symptoms",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  _launchInBrowser(_url);
                                },
                                child: SvgPicture.asset(
                                    DataSource.dashButtons[0]))),
                      ],
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              // margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.blue[50],
                    elevation: 6,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Precautions",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  _launchInBrowser(_launchUrl);
                                },
                                child: SvgPicture.asset(
                                    DataSource.dashButtons[1]))),
                      ],
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              // margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.blue[50],
                    elevation: 6,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Stats",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            countryData == null
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                    widthFactor: 4,
                                                  )
                                                : Worldwide(
                                                    countryData: countryData,
                                                  ),
                                      ));
                                },
                                child: SvgPicture.asset(
                                    DataSource.dashButtons[2]))),
                      ],
                    )),
              ),
            ),
            Grids(
              imageIndex: 3,
              text: "Treatment",
              route: Treatment(),
            ),
            Grids(
              imageIndex: 4,
              text: "FAQS",
              route: FAQPage(),
            ),
            Grids(
              imageIndex: 5,
              text: "Covid-Care",
              route: Care(),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          // margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                color: Colors.blue[50],
                elevation: 6,
                child: Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      // alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Text(
                          "Check Vaccine Slot",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                        child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Slots(),
                            ));
                      },
                      child: null,
                    )),
                  ],
                )),
          ),
        )
      ]),
    );
  }
}

class Vaccine {}
