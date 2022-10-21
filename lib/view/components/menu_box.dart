import 'package:flutter/material.dart';
import 'package:seclob_agent/view/providers/colors.dart';

class MenuBox extends StatelessWidget {
   const MenuBox({
    Key? key,
    required this.count,
    required this.title,
    this.bgColor = primaryColor,
    this.textColor = primaryTextcolor,
     this.titleColor = primaryTextcolor,
  }) : super(key: key);

  final String count, title;
   final Color bgColor, textColor, titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 56, color: Colors.white),
          ),
          Text(
            title,
            style:  TextStyle(
                fontWeight: FontWeight.w600, fontSize: 13, color: titleColor),
          )
        ],
      ),
    );
  }
}
