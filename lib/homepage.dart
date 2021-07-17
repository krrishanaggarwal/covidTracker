import 'package:flutter/material.dart';
import './secondpage.dart';
import './datasourcefile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
                elevation: 9,
                child: Image(image: AssetImage(DataSource.starterImages[0]))),
            Center(
              child: Card(
                color: Colors.lightBlue[100],
                child: Text(
                  DataSource.starterText[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
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
