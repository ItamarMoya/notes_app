class Note{
  final String title;
  final String desc;
  final DateTime createdAT;


  Note({
  required this.title, 
  required this.desc, 
  required this.createdAT});

   @override
  String toString() => 'Note(Title: $title, Description: $desc, CreateAt: $createdAT)';
}