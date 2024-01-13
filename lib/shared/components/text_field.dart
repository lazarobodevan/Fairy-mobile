import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  bool isObscureText;
  final String hintText;
  final Icon? prefixIcon;
  final bool isShowSuffixIcon;
  final String? label;

  CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.isObscureText = false,
    required this.hintText,
    this.prefixIcon,
    this.isShowSuffixIcon = false,
    this.label,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    Icon suffixIcon = widget.isObscureText
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextFormField(
      style: TypographyStyles.paragraph4(),
      obscureText: widget.isObscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          constraints:
              BoxConstraints(maxHeight: height * 0.065, maxWidth: width),
          hintText: widget.hintText,
          labelStyle: TypographyStyles.paragraph4(),
          labelText: widget.label ?? widget.label,
          border: InputBorder.none,
          filled: true,
          fillColor: ThemeColors.white,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isShowSuffixIcon
              ? IconButton(
                  icon: suffixIcon,
                  onPressed: () {
                    setState(() {
                      widget.isObscureText = !widget.isObscureText;
                      suffixIcon = widget.isObscureText
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined);
                    });
                  },
                )
              : const SizedBox(),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(width: 1, color: ThemeColors.primary3)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(width: 1, color: ThemeColors.gray3)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(width: 1, color: ThemeColors.gray3))),
    );
  }
}
