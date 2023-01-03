
import 'package:flutter/material.dart';
import 'package:note_app/domain/providers/note_provider.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class AlertDeleteDialog extends StatelessWidget {
  const AlertDeleteDialog({
    Key? key,
    required this.title,
    required this.note,
    required this.index,
  }) : super(key: key);

  final String title;
  final String note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return AlertDialog(
      backgroundColor: AppColors.primaryBgColor,
      title: const Text('Удалить'),
      contentPadding: EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Удалить заметку $title',
            maxLines: 1,
            style: AppTextStyles.noteTitle,
          ),
          const SizedBox(height: 16),
          Text(
            'Заметка: $note',
            maxLines: 2,
            style: AppTextStyles.noteStyle,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <AlertDialogBtn>[
              AlertDialogBtn(
                btnAction: () {
                  Navigator.of(context).pop();
                },
                btnText: 'Отмена',
              ),
              AlertDialogBtn(
                btnAction: () {
                  model.deleteNote(index, context);
                  Navigator.of(context).pop();
                },
                btnText: 'Удалить',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AlertDialogBtn extends StatelessWidget {
  final String btnText;
  final Function btnAction;
  const AlertDialogBtn({
    Key? key,
    this.btnText = 'Удалить',
    required this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(75, 40),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      onPressed: () => btnAction(),
      child: Text(
        btnText,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.btnTextColor,
          height: 1.42,
        ),
      ),
    );
  }
}
