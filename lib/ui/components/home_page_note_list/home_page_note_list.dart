import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/domain/hive/hive_boxes.dart';
import 'package:note_app/domain/hive/note_data.dart';
import 'package:note_app/ui/app_navigator/app_routes.dart';
import 'package:note_app/ui/components/note_list_item/note_list_item.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';

class HomePageNoteList extends StatelessWidget {
  const HomePageNoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (BuildContext context, Box<NoteData> box, child) {
          final noteList = box.values.toList();
          return HiveBoxes.notes.length > 0
              ? ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => NoteListItem(
                    index: index,
                    note: noteList[index].description,
                    noteTitle: noteList[index].title,
                    noteDate: noteList[index].date,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: noteList.length,
                )
              : const Center(
                  child: Text(
                    'Нет заметок',
                    style: AppTextStyles.appBarTitle,
                  ),
                );
        });
  }
}
