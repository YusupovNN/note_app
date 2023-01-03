import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/domain/hive/hive_boxes.dart';
import 'package:note_app/domain/hive/note_data.dart';
import 'package:note_app/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:note_app/ui/components/home_page_note_list/home_page_note_list.dart';
import 'package:note_app/ui/components/note_list_item/note_list_item.dart';
import 'package:note_app/ui/pages/home_page/home_page.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  List<NoteData> filteredNotes = <NoteData>[];
  TextEditingController searchController = TextEditingController();

  void _searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NoteData noteList) {
        return noteList.title.toLowerCase().contains(query.toLowerCase()) ||
            noteList.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 24,
            splashRadius: 24,
            splashColor: Colors.transparent,
            onPressed: () {
              if (searchController.text.isNotEmpty) {
                searchController.clear();
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.close),
          ),
        ],
        flexibleSpace: const AppBarShadow(),
        title: TextField(
          controller: searchController,
          style: AppTextStyles.appBarTitle,
          cursorColor: AppColors.secondaryDarkColor,
          decoration: const InputDecoration(
            hintText: 'Поиск...',
            hintStyle: AppTextStyles.appBarTitle,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NoteData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final note = filteredNotes[index];
              return NoteListItem(
                noteTitle: note.title,
                index: index,
                note: note.description,
                noteDate: note.description,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: filteredNotes.length,
          );
        },
      ),
    );
  }
}
