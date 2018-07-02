import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gdg_prod/detail/team_detail_page.dart';

class TeamCard extends StatefulWidget {

  final DocumentSnapshot document;

  TeamCard(this.document);

  @override
  State createState() => TeamCardState();
}

class TeamCardState extends State<TeamCard> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(widget.document.reference),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(right: 16.0, child: teamDescription),
              Positioned(top: 8.0, child: teamImage),
            ],
          ),
        ),
      ),
      onTap: navigateToDetail,
    );
  }

  Widget get teamDescription {
    return Container(
      height: 115.0,
      width: 290.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
        child: Column(
          children: <Widget>[
            Text(widget.document["name"], style: Theme.of(context).textTheme.headline),
            Text("Número de títulos: ${widget.document["numberOfTitles"].toString()}", style: Theme.of(context).textTheme.subhead),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10.0),

      ),
    );
  }

  Widget get teamImage {
    double size = 90.0;

    Widget placeholder = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400]
      ),
      alignment: Alignment.center,
    );

    Widget image = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(widget.document["imageUrl"]),
          fit: BoxFit.scaleDown
        )
      ),
    );

    return Hero(
      tag: widget.document.reference,
      child: AnimatedCrossFade(
        firstChild: placeholder,
        secondChild: image,
        crossFadeState: widget.document["imageUrl"] == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 1000),
      )
    );
  }

  void navigateToDetail(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return TeamDetailPage(widget.document);
    }));
  }
}