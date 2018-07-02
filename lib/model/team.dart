import 'package:cloud_firestore/cloud_firestore.dart';

class Team {
  final DocumentReference reference;
  final String name, description, imageUrl;
  final int numberOfTitles;

  Team(this.name, this.description, this.imageUrl, this.numberOfTitles, {this.reference});

  Team.fromDocumentSnapshot(DocumentSnapshot document) :
      reference = document.reference,
      name = document["name"],
      description = document["description"],
      imageUrl = document["imageUrl"],
      numberOfTitles = document["numberOfTitles"];

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "description": description,
      "numberOfTitles": numberOfTitles,
      "imageUrl": imageUrl
    };
  }
}