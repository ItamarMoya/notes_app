import 'package:flutter/material.dart';

class Create extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              
            ),
            SizedBox(height: 8,),
            Expanded(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:(){},
               child: Text('Create')),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}