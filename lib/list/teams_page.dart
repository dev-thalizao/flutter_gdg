import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'team_card.dart';
import 'package:gdg_prod/model/team.dart';

class TeamsPage extends StatefulWidget {
  @override
  State createState() => TeamsPageState();
}

class TeamsPageState extends State<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> stream =
        Firestore.instance.collection("teams").snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text("Times da copa 2018"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(

            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, snapshot.data.documents[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return TeamCard(Team.fromDocumentSnapshot(document));
  }
}
