import 'package:flutter/material.dart';
import 'package:my_notes_app/models/note.dart';

class Create extends StatefulWidget {
  final Note? note;

  const Create({Key? key, this.note}) : super(key: key);
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note?.title);
    _descController = TextEditingController(text: widget.note?.desc);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title= widget.note!=null ?'UpDate':'Create';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
               controller:_titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: TextFormField(
                controller: _descController,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: () {
                final title=_titleController.text;
                final desc=_descController.text;
                if(title.isNotEmpty&&desc.isNotEmpty){
                  //crear una nota
                  final note =Note(title: title,
                   desc: desc, 
                   createdAT: widget.note?.createdAT ?? DateTime.now());
                  Navigator.of(context).pop(note);
                }
                else{
                  _showSnackbar(context);
                }
              }, 
              child: Text(title)),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Title or description can´t be empty.')));
  }
}
