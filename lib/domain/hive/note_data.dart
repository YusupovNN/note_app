import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'note_data.g.dart';
// HiveType - id нашего класса
@HiveType(typeId: 0)
class NoteData {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  late String date;

  NoteData({required this.title, required this.description}) {
    //  DateTime.now() - получение корректной даты которая установлена на устройстве
    final DateTime nowTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(nowTime);
  }
}
