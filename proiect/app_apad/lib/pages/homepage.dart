import 'package:flutter/material.dart';
import 'package:app_apad/utils/get_color.dart';
import 'package:app_apad/models/note.dart';
import 'package:app_apad/utils/get_card.dart';
import 'package:app_apad/pages/add_notes.dart';
import 'package:app_apad/utils/notes_database.dart';
import 'package:app_apad/pages/detail_notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  bool isLoading = false;

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    NotesDatabase.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("List of Notes"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DetailNotes(note: notes[index]);
                    }));
                    refreshNotes();
                  },
                  child: GetCard(index: index, note: notes[index]),
                );
              },
              itemCount: notes.length,
              //padding: EdgeInsets.only(left: 20, right: 20),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return const AddNotes(
              note: null,
            );
          }));
          refreshNotes();
        },
        elevation: 6,
        tooltip: "Add new notes",
        backgroundColor: GetColor.secondarySeedColor,
        foregroundColor: GetColor.whiteTextColor,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
    );
  }
}
