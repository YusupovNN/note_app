import 'package:flutter/material.dart';
import 'package:note_app/domain/providers/note_provider.dart';
import 'package:note_app/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of(context);
    final model = context.watch<NoteProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
        title: const Text(
          'Добавить заметку',
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
              model.addNote();
              Navigator.pop(context);
            },
            btnText: 'Добавить',
          )
        ],
      ),
    );
  }
}

class NoteAppInput extends StatelessWidget {
  //
  final String title;
  final TextEditingController controller;
  const NoteAppInput({
    Key? key,
    this.title = '',
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return TextField(
      onSubmitted: (value) {
        model.addNote();
        Navigator.pop(context);
      },
      controller: controller,
      minLines: 1,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: title,
        labelText: title,
        hintStyle: const TextStyle(
          color: AppColors.primaryDarkColor,
          fontSize: 16,
          height: 1.5,
        ),
        labelStyle: const TextStyle(
          color: AppColors.secondaryDarkColor,
          fontSize: 12,
          height: 1.33,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }
}

class ControlBtn extends StatelessWidget {
  final String btnText;
  final Function action;
  const ControlBtn({
    Key? key,
    this.btnText = '',
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FloatingActionButton(
        elevation: 2,
        highlightElevation: 2,
        backgroundColor: AppColors.primaryBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        onPressed: () => action(),
        child: Text(
          btnText,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff6750A4),
            height: 1.42,
          ),
        ),
      ),
    );
  }
}
