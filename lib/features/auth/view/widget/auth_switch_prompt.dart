import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Reusable prompt at the bottom of auth screens to toggle between login and sign up.
class AuthSwitchPrompt extends StatelessWidget {
  const AuthSwitchPrompt({
    required this.questionText,
    required this.actionText,
    required this.onActionTap,
    super.key,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
