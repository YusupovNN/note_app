import 'package:flutter/material.dart';
import 'package:note_app/ui/app_navigator/app_routes.dart';
import 'package:note_app/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:note_app/ui/components/home_page_add_btn/home_page_add_btn.dart';
import 'package:note_app/ui/components/home_page_note_list/home_page_note_list.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomePageAddBtn(),
      appBar: AppBar(
        title: const Text(
          'Заметки',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchPage);
            },
            splashColor: Colors.transparent,
            iconSize: 24,
            splashRadius: 24,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const HomePageNoteList(),
    );
  }
}
