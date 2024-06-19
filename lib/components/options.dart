import 'package:flutter/material.dart';

class CategoryOption extends StatelessWidget {
  final String title;
  final IconData iconName;
  final Color color;

  const CategoryOption(
      {super.key,
      required this.title,
      required this.iconName,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconName,
                  color: color,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData iconName;

  const ProfileOption({
    super.key,
    required this.title,
    required this.hintText,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: width - 50,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(1, 1))
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    iconName,
                    color: title == "Logout" ? Colors.red : Colors.black,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: title == "Logout" ? Colors.red : Colors.black,
                        ),
                      ),
                      Text(
                        hintText,
                        style: TextStyle(
                          fontSize: 12,
                          color: title == "Logout" ? Colors.red : Colors.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: title == "Logout" ? Colors.red : Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
