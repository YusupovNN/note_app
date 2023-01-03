import 'package:flutter/cupertino.dart';
import 'package:note_app/domain/hive/hive_boxes.dart';
import 'package:note_app/domain/hive/note_data.dart';

class NoteProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  void addNote() async {
    await HiveBoxes.notes.add(
      NoteData(
        title: titleController.text == '' ? 'Нет данных' : titleController.text,
        description:
            noteController.text == '' ? 'Нет данных' : noteController.text,
      ),
    );
    clearControllers();
    notifyListeners();
  }

  void deleteNote(int index, BuildContext context) {
    HiveBoxes.notes.deleteAt(index);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void changeNoteData(int index, BuildContext context) {
    //  Метод добавление по определенному индексу
    HiveBoxes.notes.putAt(
      index,
      NoteData(
        title: titleController.text == '' ? 'Нет данных' : titleController.text,
        description:
            noteController.text == '' ? 'Нет данных' : noteController.text,
      ),
    );
    Navigator.of(context).pop();
    clearControllers();
    notifyListeners();
  }

  void setControllers({int? index}) {
    if (index == null) {
      clearControllers();
    } else {
      titleController.text = HiveBoxes.notes.getAt(index)?.title ?? '';
      noteController.text = HiveBoxes.notes.getAt(index)?.description ?? '';
    }
  }

  void clearControllers() {
    titleController.clear();
    noteController.clear();
  }
}
