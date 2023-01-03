import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/domain/providers/note_provider.dart';
import 'package:note_app/ui/app_navigator/app_navigator.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryBgColor,
          systemNavigationBarColor: AppColors.primaryBgColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              toolbarHeight: 64,
            ),
          ),
          initialRoute: AppNavigator.initialRoute,
          routes: AppNavigator.routes,
        ),
      ),
    );
  }
}
