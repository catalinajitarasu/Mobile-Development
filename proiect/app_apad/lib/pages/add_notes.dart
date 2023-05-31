import 'package:flutter/material.dart';
import 'package:app_apad/utils/get_color.dart';
import 'package:app_apad/utils/notes_database.dart';
import 'package:app_apad/models/note.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class AddNotes extends StatefulWidget {
  final Note? note;

  const AddNotes({Key? key, this.note}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final _form = GlobalKey<FormState>();
  final _controller = QuillController.basic();
  late FocusNode _focusNode;

  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      _controller.document.insert(0, widget.note!.detail);
    }
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> addNote() async {
    final note = Note(
      title: titleController.text,
      detail: _controller.document.toPlainText().toString(),
      dateTime: DateTime.now(),
    );
    await NotesDatabase.instance.create(note);
    Navigator.of(context).pop();
  }

  Future<void> editNote() async {
    final note = widget.note!.copyWith(
      title: titleController.text,
      detail: _controller.document.toPlainText().toString(),
    );

    await NotesDatabase.instance.update(note);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.note != null
            ? const Text("Update Notes")
            : const Text("Add New Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter note title";
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: titleController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Title",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: GetColor.secondarySeedColor),
                      ),
                    ),
                  ),
                  QuillToolbar.basic(
                    controller: _controller,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  QuillEditor(
                    controller: _controller,
                    focusNode: _focusNode,
                    readOnly: false,
                    autoFocus: false,
                    placeholder: "Detail notes",
                    minHeight: 200,
                    scrollController: ScrollController(),
                    scrollable: true,
                    padding: EdgeInsets.zero,
                    expands: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 270,
                    child: ElevatedButton(
                      child: Text(widget.note != null ? "Update" : "Save"),
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          if (widget.note != null) {
                            await editNote();
                          } else {
                            await addNote();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:app_apad/utils/get_color.dart';
// import 'package:app_apad/utils/notes_database.dart';
// import 'package:app_apad/models/note.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import 'package:flutter_quill/flutter_quill.dart' as quill hide Text;

// class AddNotes extends StatefulWidget {
//   final Note? note;

//   const AddNotes({Key? key, this.note}) : super(key: key);

//   @override
//   State<AddNotes> createState() => _AddNotesState();
// }

// class _AddNotesState extends State<AddNotes> {
//   final _form = GlobalKey<FormState>();
//   final _controller = QuillController.basic();
//   late FocusNode _focusNode;

//   TextEditingController titleController = TextEditingController();

//   @override
//   void initState() {
//     if (widget.note != null) {
//       titleController.text = widget.note!.title;
//       _controller.document.insert(
//           0,
//           quill.Document.fromJson(jsonDecode(widget.note!.detail))
//               .toPlainText()
//               .toString());
//     } else {
//       // Dacă este o notă existentă, preluăm detaliile din baza de date
//       _fetchNoteDetails();
//     }
//     _focusNode = FocusNode();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchNoteDetails() async {
//     if (widget.note != null) {
//       try {
//         final note = await NotesDatabase.instance.readNote(widget.note!.id!);
//         setState(() {
//           titleController.text = note.title;
//           _controller.document.insert(
//               0,
//               quill.Document.fromJson(jsonDecode(widget.note!.detail))
//                   .toPlainText()
//                   .toString());
//         });
//       } catch (e) {
//         // Tratează eroarea în mod corespunzător
//         print('Eroare la citirea notelor din baza de date: $e');
//       }
//     }
//   }

//   Future<void> addNote() async {
//     var result = jsonEncode(_controller.document.toDelta().toJson());
//     final note = Note(
//       title: titleController.text,
//       detail: result,
//       dateTime: DateTime.now(),
//     );
//     await NotesDatabase.instance.create(note);
//     Navigator.of(context).pop();
//   }

//   Future<void> editNote() async {
//     var result = jsonEncode(_controller.document.toDelta().toJson());
//     final note = widget.note!.copyWith(
//       title: titleController.text,
//       detail: result,
//     );

//     await NotesDatabase.instance.update(note);
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: widget.note != null
//             ? const Text("Update Notes")
//             : const Text("Add New Notes"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//         child: ListView(
//           children: [
//             Form(
//               key: _form,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Enter note title";
//                       }
//                       return null;
//                     },
//                     autofocus: true,
//                     controller: titleController,
//                     maxLines: 1,
//                     decoration: InputDecoration(
//                       hintText: "Title",
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 1, color: GetColor.secondarySeedColor),
//                       ),
//                     ),
//                   ),
//                   QuillToolbar.basic(
//                     controller: _controller,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   QuillEditor(
//                     controller: _controller,
//                     focusNode: _focusNode,
//                     readOnly: false,
//                     autoFocus: false,
//                     placeholder: "Detail notes",
//                     minHeight: 200,
//                     scrollController: ScrollController(),
//                     scrollable: true,
//                     padding: EdgeInsets.zero,
//                     expands: false,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   SizedBox(
//                     width: 270,
//                     child: ElevatedButton(
//                       child: Text(widget.note != null ? "Update" : "Save"),
//                       onPressed: () async {
//                         if (_form.currentState!.validate()) {
//                           if (widget.note != null) {
//                             await editNote();
//                           } else {
//                             await addNote();
//                           }
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

