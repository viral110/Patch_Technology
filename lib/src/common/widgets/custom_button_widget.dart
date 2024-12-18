import 'package:flutter/material.dart';
import 'package:patch_task/src/common/constants/color_helper.dart';

class CustomButtonWidget extends StatelessWidget {

  final double? height;
  final double? width;
  final String name;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final Function() onTap;
  final EdgeInsets? margin;
  final FontWeight? fontWeight;
  final Color? borderColor;

  const CustomButtonWidget({super.key,
    this.height,
    this.width,
    required this.name,
    this.color,
    this.textColor,
    this.textSize,
    required this.onTap,
    this.fontWeight,
    this.margin,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: height ?? 45,
        width: width ?? MediaQuery.of(context).size.width,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? ColorHelper.primaryColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor ?? ColorHelper.primaryColor, width: 1.5),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: textSize ?? 20,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
