import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/models/note.dart';
import 'package:my_notes_app/screens/create.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Note> notes=[];
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
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, int index){
              final  note= notes[index];
             return _NoteItem(note);
            }
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
         final note= await Navigator.of(context).push<Note>(MaterialPageRoute(builder: (_)=>Create()));
         if(note!=null){
            notes.add(note);
            setState(() {
              
            });
         }
        } ,
        child: Icon(Icons.add),),
    );
  }
}

class _NoteItem extends StatelessWidget {

  final Note note;

  const _NoteItem(this.note,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        tileColor: Colors.yellow,
       title: Text(note.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
       subtitle: Text(note.desc),
       trailing: Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(note.createdAT)), 
      ),
    );
  }
}