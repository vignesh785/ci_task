import 'package:ci_task/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final TextAlign? titleAlign;
  final VoidCallback? iconOnPressed;
  const CommonListTile({super.key, required this.title, this.icon, this.iconOnPressed, this.titleAlign});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: AppColors.primaryColor,
        title: Text(title ?? '', textAlign: titleAlign ?? TextAlign.center, style: const TextStyle(color: AppColors.whiteColor, fontStyle: FontStyle.normal)),
        trailing: icon == null ? null : IconButton(onPressed: iconOnPressed, icon: Icon(icon, color: AppColors.whiteColor)));
  }
}
