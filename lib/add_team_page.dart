import 'package:flutter/material.dart';
import 'package:gdg_prod/model/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTeamPage extends StatefulWidget {

  @override
  State createState() {
    return AddTeamPageState();
  }
}

class AddTeamPageState extends State<AddTeamPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberOfTitlesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo time"),
      ),
      body: Container(
        child: Center(
          child: teamForm,
        ),
      ),
    );
  }

  void onPressed(){
    final Team team = Team(
      nameController.text,
      descriptionController.text,
      imageUrlController.text,
      int.parse(numberOfTitlesController.text)
    );

    Firestore.instance.collection("teams").add(team.toMap()).then((onValue){
      Navigator.of(context).pop(onValue);
    });
  }

  Widget get teamForm {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          makeTextInput("Nome da seleção", nameController),
          makeTextInput("Números de títulos da seleção", numberOfTitlesController),
          makeTextInput("Descrição da seleção", descriptionController),
          makeTextInput("Imagem da seleção", imageUrlController),
          Container(height: 16.0,),
          RaisedButton(
            child: Text("Criar"),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }

  Widget makeTextInput(String label, TextEditingController controller){
    return TextField(
      controller: controller,
      onChanged: (text) => controller.text = text,
      decoration: InputDecoration(
        labelText: label
      ),
    );
  }
}