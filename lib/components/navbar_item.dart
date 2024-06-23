import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/initializers.dart';


class CustomNavBarItem extends StatelessWidget {
  final IconData iconName;
  final bool isActive;
  final String title;
  const CustomNavBarItem(
      {super.key,
        required this.iconName,
        required this.isActive,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
              width: isActive ? 100.0 : 40,
              height: 40.0,
              decoration: BoxDecoration(
        color: isActive ? AppColors.highLight : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
              ),
              child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconName,
            size: 24,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: isActive ? 5 : 0,
          ),
          Text(
            isActive ? title : "",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          )
        ],
              ),
            )
        : Icon(
      iconName,
      size: 24,
      color: AppColors.highLight,
    );
  }
}