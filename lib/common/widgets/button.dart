import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String title;
  const PrimaryButton(
      {super.key,
      this.onPressed,
      required this.title,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:  BoxDecoration(
        color: isLoading == true ? backgroundDark : primaryBlue,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      title,
                      style: AppTextStyles.body1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
