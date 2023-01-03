import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/components/bottom_menu/bottom_menu_and_btn.dart';
import 'package:note_app/ui/components/home_page_note_list/home_page_note_list.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';

class NoteListItem extends StatelessWidget {
  final String noteTitle;
  final String noteDate;
  final String note;
  final int index;
  const NoteListItem({
    Key? key,
    required this.noteTitle,
    required this.index,
    required this.note,
    required this.noteDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            height: 179,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: BottomMenuContent(
              index: index,
              title: noteTitle,
              note: note,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryBgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .3),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        constraints: const BoxConstraints(
          minHeight: 117,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(noteTitle, style: AppTextStyles.noteTitle),
            const SizedBox(height: 5),
            Text(noteDate, style: AppTextStyles.noteDate),
            const SizedBox(height: 9),
            Text(note, style: AppTextStyles.noteStyle),
          ],
        ),
      ),
    );
  }
}