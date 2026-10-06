import 'package:flutter/material.dart';

/// Centralized border radius design tokens for the entire application.
/// Changing [baseRadiusValue] updates corners across all widgets consistently.
abstract final class AppRadius {
  /// Base radius value in pixels.
  /// Modifying this single number recalculates corner curvature across the entire app.
  static const double baseRadiusValue = 16.0;

  /// Default radius applied to inputs, buttons, cards, containers, etc.
  static const Radius defaultRadius = Radius.circular(baseRadiusValue);
  static const BorderRadius defaultBorderRadius =
      BorderRadius.all(defaultRadius);

  /// Small corner radius (half of base, e.g. 8px) for badges, small chips.
  static const Radius smallRadius = Radius.circular(baseRadiusValue / 2);
  static const BorderRadius smallBorderRadius = BorderRadius.all(smallRadius);

  /// Large corner radius (1.5x of base, e.g. 24px) for dialogs, bottom sheets.
  static const Radius largeRadius = Radius.circular(baseRadiusValue * 1.5);
  static const BorderRadius largeBorderRadius = BorderRadius.all(largeRadius);

  /// Fully rounded pill shape for capsules or avatars.
  static const Radius pillRadius = Radius.circular(999.0);
  static const BorderRadius pillBorderRadius = BorderRadius.all(pillRadius);
}
