import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'custom_text_field.dart';

/// Specialized password input field with built-in obscure toggle.
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.controller,
    super.key,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.textInputAction = TextInputAction.done,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon: Icons.lock_outline_rounded,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.textSecondary,
          size: 20,
        ),
        onPressed: _toggleObscure,
      ),
    );
  }
}
