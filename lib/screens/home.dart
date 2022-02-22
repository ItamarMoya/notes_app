import 'package:flutter/material.dart';
import 'package:my_notes_app/screens/create.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Simple Notes App'),
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.yellow,
               title: Text('Happy New yaear', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               subtitle: Text('2021'),
               trailing: Text('02 jan 2021'), 
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Create()));
        } ,
        child: Icon(Icons.add),),
    );
  }
}