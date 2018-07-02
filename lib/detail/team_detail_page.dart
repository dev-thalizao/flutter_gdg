import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamDetailPage extends StatelessWidget {

  final DocumentSnapshot document;

  TeamDetailPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document["name"]),
      ),
      body: Container(
        child: Center(
          child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                teamImage,
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Text(document["name"]),
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text("Número de títulos: ${document["numberOfTitles"].toString()}")
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Text(document["description"]),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

            ),
          ),
        ),
      ),
    );
  }

  Widget get teamImage {
    return Hero(
      tag: document.reference,
      child: Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(document["imageUrl"]),
            fit: BoxFit.scaleDown
          )
        ),
      ),
    );
  }
}