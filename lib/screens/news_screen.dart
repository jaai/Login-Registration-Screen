import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/models/Items.dart';
import 'package:flutter_starter_app/screens/dashboard_screen.dart';
import 'package:flutter_starter_app/services.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {



Widget listViewWidget(List<Items> article) {
  return Container(
    child: ListView.builder(
        itemCount: article.length,
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (context, position) {
          return Card(
            child: Center(
              child: ListTile(
                title: Center(
                  child: Text('Title: '+
                    '${article[position].title}',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:Column(
                  children: [
                    Text('Publisher: '+
                      '${article[position].publisher}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          ),
                    ), Text('Place Of Publication: '+
                      '${article[position].placeOfPublication}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          ),
                    ),
                  ],
                ) ,

                onTap: () => _onTapItem(context, article[position]),
              ),
            ),
          );
        }),
  );
}
void _onTapItem(BuildContext context, Items article) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => DashboardScreen()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
      body: FutureBuilder(
          future: Services.getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
