import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';

class IconsDecorated extends StatelessWidget {
  final IconData icons;
  const IconsDecorated({required this.icons, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icons,
          size: 24.0,
          color: AppColors.highLight,
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  final IconData icons;
  final Color color;
  final bool logout;
  const ProfileIcon({required this.icons, required this.color, super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: color),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          icons,
          size: 24.0,
          color: logout ? AppColors.highLight : AppColors.primaryColor,
        ),
      ),
    );
  }
}
