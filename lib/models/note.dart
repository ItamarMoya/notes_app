import 'package:flutter/material.dart';

class Note{
  final String title;
  final String desc;
  final DateTime createdAT;
  final String uid;
  final Color color;
  Note({
  required this.color,
  required this.uid,
  required this.title, 
  required this.desc, 
  required this.createdAT});

   @override
  String toString() => 'Note(Title: $title, Description: $desc, CreateAt: $createdAT)';
}