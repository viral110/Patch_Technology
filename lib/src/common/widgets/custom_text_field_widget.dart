import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patch_task/src/common/constants/color_helper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final double? width;
  final double? height;
  final Function()? onTap;
  final double? textFontSize;
  final Function(String)? onChange;
  final Function()? onEditComplete;
  final int? maxLine;
  final TextInputFormatter? textInputFormatter;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    this.textController,
    this.obscureText,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.maxLength,
    this.readOnly,
    this.textFontSize,
    this.onTap,
    this.onChange,
    this.onEditComplete,
    this.maxLine,
    this.textInputFormatter,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: textController,
        onTap: onTap,
        obscureText: obscureText == null ? false : obscureText!,
        maxLength: maxLength,
        style: GoogleFonts.roboto(
          color: ColorHelper.blackColor,
          fontSize: textFontSize ?? 16,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: keyboardType,
        inputFormatters: textInputFormatter == null ? null : [textInputFormatter!],
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: GoogleFonts.roboto(
            color: ColorHelper.hintTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: ColorHelper.whiteColor,
          counterText: "",
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorHelper.greyColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorHelper.greyColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorHelper.greyColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onTapOutside: (val) {
          FocusScope.of(context).unfocus();
        },
        onChanged: onChange,
        onEditingComplete: onEditComplete,
        maxLines: maxLine ?? 1,
      ),
    );
  }
}
