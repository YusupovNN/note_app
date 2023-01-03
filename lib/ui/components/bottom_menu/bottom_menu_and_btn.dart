import 'package:flutter/material.dart';
import 'package:note_app/domain/providers/note_provider.dart';
import 'package:note_app/ui/app_navigator/app_routes.dart';
import 'package:note_app/ui/components/alertdeletedialog_and_alertbtn/alertdeletedialog_and_alertbtn.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class BottomMenuContent extends StatelessWidget {
  final String title;
  final String note;
  final int index;
  const BottomMenuContent({
    Key? key,
    required this.index,
    this.note = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Column(
      children: [
        Container(
          width: 34,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xffDEDEDE),
            borderRadius: BorderRadius.all(
              Radius.circular(19),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: AppTextStyles.noteTitle,
        ),
        const SizedBox(height: 10),
        Text(
          note,
          maxLines: 1,
          style: AppTextStyles.noteStyle.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        BottomMenuContentBtn(
          icon: Icons.edit,
          text: 'Редактировать',
          btnAction: () {
            Navigator.of(context).pushNamed(
              AppRoutes.changePage,
              arguments: index,
            );
            model.setControllers(index: index);
          },
        ),
        BottomMenuContentBtn(
          icon: Icons.backspace,
          text: 'Удалить',
          btnAction: () {
            showDialog(
              context: context,
              builder: (context) => AlertDeleteDialog(
                title: title,
                note: note,
                index: index,
              ),
            );
          },
        ),
      ],
    );
  }
}

class BottomMenuContentBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function btnAction;
  const BottomMenuContentBtn({
    Key? key,
    required this.text,
    required this.icon,
    required this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        onPressed: () => btnAction(),
        icon: Icon(
          icon,
          size: 24,
          color: AppColors.secondaryDarkColor,
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.noteTitle.copyWith(
                height: 1.37,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
