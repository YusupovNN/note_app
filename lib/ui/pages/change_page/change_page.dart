import 'package:flutter/material.dart';
import 'package:note_app/domain/providers/note_provider.dart';
import 'package:note_app/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:note_app/ui/pages/control_page/control_page.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class ChangePage extends StatelessWidget {
  const ChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    //  ModalRoute() - мы можем получить данные с определенной страницы
    final index = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
        title: const Text(
          'Изменить заметку',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NoteAppInput(
            controller: model.titleController,
            title: 'Заголовок',
          ),
          const SizedBox(height: 16),
          NoteAppInput(
            controller: model.noteController,
            title: 'Заметка',
          ),
          const SizedBox(height: 16),
          ControlBtn(
            action: () {
              if (index is int) {
                model.changeNoteData(index, context);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Неверные данные'),
                  ),
                );
              }
            },
            btnText: 'Изменить',
          )
        ],
      ),
    );
  }
}
