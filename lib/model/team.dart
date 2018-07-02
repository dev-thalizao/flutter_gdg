import 'package:cloud_firestore/cloud_firestore.dart';

class Team {
  final DocumentReference reference;
  final String name, description, imageUrl;
  final int numberOfTitles;

  Team(this.reference, this.name, this.description, this.imageUrl, this.numberOfTitles);

  Team.fromDocumentSnapshot(DocumentSnapshot document) :
      reference = document.reference,
      name = document["name"],
      description = document["description"],
      imageUrl = document["imageUrl"],
      numberOfTitles = document["numberOfTitles"];
}