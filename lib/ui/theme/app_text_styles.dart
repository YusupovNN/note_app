import 'package:flutter/cupertino.dart';
import 'package:note_app/ui/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 22,
    height: 1.27,
    color: AppColors.primaryDarkColor,
  );
  static const TextStyle noteTitle = TextStyle(
    fontSize: 16,
    height: 1.18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDarkColor,
  );
  static const TextStyle noteDate = TextStyle(
    fontSize: 14,
    height: 1.42,
    color: Color(0xffCAC4D0),
  );
  static const TextStyle noteStyle = TextStyle(
    fontSize: 14,
    height: 1.14,
    color: AppColors.secondaryDarkColor,
  );
}
