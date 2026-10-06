import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Full-width primary action button with integrated loading state.
class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textWhite),
              ),
            )
          : Text(text),
    );
  }
}
