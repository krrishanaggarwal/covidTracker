import 'package:flutter/material.dart';
// import './secondpage.dart';
import './datasourcefile.dart';
import './thirdpage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              elevation: 6,
              child: Image(
                image: AssetImage('assets/ew.png'),
              ),
              color: Colors.white60,
            ),
            Center(
              child: Card(
                color: Colors.lightBlue[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DataSource.starterText[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ));
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.blue,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
