import 'dart:ffi';

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
   List<Note> notes=[];

   Future<Note?> _getNote(BuildContext context,{Note? note}) async =>Navigator.of(context).push<Note>(MaterialPageRoute(builder: (_)=> Create(note:note,)));
   

    Future<void>  _createNote(BuildContext context)async{
      final note= await _getNote(context);
         if(note!=null){
            notes.add(note);
            setState(() {
              
            });
         }
    }

    void _deleteNote(Note note){
        //IMPERATIVA mutable
              // for(int i=0;i<notes.length;i++){
                // final currentNote= notes[i];
                // if(currentNote.title==note.title){
                  // notes.removeAt(i);
                  // setState(() {
                    // 
                  // });
                //  break;
                // }
              // }

             //declarativa e inmutabl


             final newNotes= notes.where((currentNote) =>currentNote.title!=note.title).toList();
                notes=newNotes;
                setState(() {});
    }

    Future<void> _updateNote( Note note)async{
      Navigator.pop(context);//quitar el bottom
              final upDatenote=await _getNote(context, note: note);
              if(upDatenote!= null){
                // for(int i=0;i<notes.length;i++){
                // final currentNote= notes[i];
                // if(currentNote.title==note.title){
                  // notes[i]=upDatenote;
                  // setState(() {
                    // 
                  // });
                //  break;
                // }
            //  }
            //declarativa
            final filterNotes= notes.where((currentNote) =>currentNote.title!=note.title).toList();
            notes=[upDatenote,...filterNotes];
            setState(() {
              
            });
              }
    }

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
             return _NoteItem(note, 
             delete: () => _deleteNote(note), 
             
             upDate: () =>_updateNote(note)
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>_createNote(context),
        child: Icon(Icons.add),),
    );
  }
}

class _NoteItem extends StatelessWidget {

  final Note note;
  final void Function() delete;
  final void Function() upDate;
  const _NoteItem(this.note,{Key? key, required this.delete, required this.upDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        tileColor: Colors.yellow,
       title: Text(note.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
       subtitle: Text(note.desc),
       trailing: Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(note.createdAT)), 
       onTap: (){
         _showModal(context, delete,upDate);
       },
      ),
    );
  }

  void _showModal(context, void Function() delete,void Function()upDate) {
    final style=TextStyle(fontSize: 20);
    showModalBottomSheet(context: context, builder: (BuildContext context){
        return Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextButton(onPressed: (){
                    upDate();
                    //Navigator.pop(context);

                  }, child: Text('Update',style: style,)),
                  TextButton(onPressed:(){
                    delete();
                    Navigator.pop(context);
                  }, 
                  child: Text('Delete',style: style,)),
                  
                 
                ],
              ),
            ),
          ],
        );
    });
  }
}