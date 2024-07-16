import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool? isSuffixIconVisible;
  final VoidCallback? onTapSuffix;
  final String hintText;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isSuffixIconVisible,
    this.onTapSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundBlue,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          border: InputBorder.none,
          hintStyle: AppTextStyles.caption1.copyWith(
            color: secondary,
          ),
          suffixIcon: isSuffixIconVisible == true
              ? InkWell(
                  onTap: onTapSuffix,
                  child: obscureText == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                )
              : null,
        ),
        style: AppTextStyles.caption1,
      ),
    );
  }
}
