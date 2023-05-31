import 'package:flutter/material.dart';
import 'package:app_apad/utils/get_color.dart';
import 'package:app_apad/utils/notes_database.dart';
import 'package:app_apad/models/note.dart';
import 'package:app_apad/pages/add_notes.dart';

class DetailNotes extends StatefulWidget {
  final Note note;
  const DetailNotes({Key? key, required this.note}) : super(key: key);

  @override
  State<DetailNotes> createState() => _DetailNotesState();
}

class _DetailNotesState extends State<DetailNotes> {
  late Note note;

  @override
  void initState() {
    note = widget.note;
    super.initState();
  }

  Future refreshNote() async {
    note = await NotesDatabase.instance.readNote(widget.note.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(note.title),
          actions: [
            InkWell(
              child: Icon(Icons.edit_note),
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNotes(note: note)));
                refreshNote();
              },
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () async {
                await NotesDatabase.instance.delete(widget.note.id!);
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    labelText: note.title,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: GetColor.secondarySeedColor))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    labelText: note.detail,
                    alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: GetColor.secondarySeedColor))),
                maxLines: 8,
              ),
            ],
          ),
        ));
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:app_apad/utils/get_color.dart';
// import 'package:app_apad/utils/notes_database.dart';
// import 'package:app_apad/models/note.dart';
// import 'package:app_apad/pages/add_notes.dart';
// import 'package:flutter_quill/flutter_quill.dart' as quill;

// class DetailNotes extends StatefulWidget {
//   final Note note;
//   const DetailNotes({Key? key, required this.note}) : super(key: key);

//   @override
//   State<DetailNotes> createState() => _DetailNotesState();
// }

// class _DetailNotesState extends State<DetailNotes> {
//   late Note note;

//   @override
//   void initState() {
//     note = widget.note;
//     super.initState();
//   }

//   Future refreshNote() async {
//     note = await NotesDatabase.instance.readNote(widget.note.id!);
//     setState(() {});
//   }

//   String _getFormattedDetail(String detail) {
//     try {
//       final decodedJson = quill.Document.fromJson(jsonDecode(detail));
//       // final decodedJson = jsonDecode(detail);
//       // return decodedJson.toString(); // Returnează codul decodat
//       return decodedJson.toPlainText().toString();
//     } catch (e) {
//       return detail; // Returnează șirul de caractere inițial
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(note.title), //Text("Edit/Delete"),
//           actions: [
//             InkWell(
//               child: Icon(Icons.edit_note),
//               onTap: () async {
//                 await Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => AddNotes(note: note)));
//                 refreshNote();
//               },
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               child: Icon(Icons.delete),
//               onTap: () async {
//                 await NotesDatabase.instance.delete(widget.note.id!);
//                 Navigator.of(context).pop();
//               },
//             ),
//             SizedBox(
//               width: 15,
//             )
//           ],
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//           child: ListView(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                     filled: true,
//                     enabled: false,
//                     labelText: note.title,
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 1, color: GetColor.secondarySeedColor))),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     filled: true,
//                     enabled: false,

//                     //labelText: note.detail,
//                     labelText: _getFormattedDetail(note.detail),
//                     alignLabelWithHint: true,
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 1, color: GetColor.secondarySeedColor))),
//                 maxLines: 8,
//               ),
//             ],
//           ),
//         ));
//   }
// }