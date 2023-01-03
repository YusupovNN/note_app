import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/domain/hive/hive_keys.dart';
import 'package:note_app/domain/hive/note_data.dart';
import 'package:note_app/ui/app.dart';

void main() async {
  
  
  
  // Hive.initFlutter() - это асихронное операция необходимая для инициализации нащего приложение
  await Hive.initFlutter();
  // openBox - метод для открытия бокса
  // registerAdapter - метод для регистрации адаптера
  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>(HiveKeys.notesKey);
  runApp(const NoteApp());
}
