import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlotEntries extends StatefulWidget {
  final List slots;
  SlotEntries({this.slots});
  @override
  _SlotEntriesState createState() => _SlotEntriesState();
}

class _SlotEntriesState extends State<SlotEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Slots')),
      body: Container(
        // padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.slots.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.black54,
                elevation: 65,
                // color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white24,
                  height: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Center ID - ' +
                              widget.slots[index]['center_id'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Center Name - ' +
                              widget.slots[index]['name'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Center Address - ' +
                              widget.slots[index]['address'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Divider(),
                        Text(
                          'Vaccine Name - ' +
                              widget.slots[index]['vaccine'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Divider(),
                        Text(
                          'Slots - ' + widget.slots[index]['slots'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
