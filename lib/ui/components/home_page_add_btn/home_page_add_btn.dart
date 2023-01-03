import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/ui/app_navigator/app_routes.dart';
import 'package:note_app/ui/theme/app_colors.dart';

class HomePageAddBtn extends StatelessWidget {
  const HomePageAddBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.controlPage);
      },
      backgroundColor: AppColors.primaryBgColor,
      elevation: 3,
      child: SvgPicture.asset('assets/icons/icon.svg'),
    );
  }
}
