import 'package:flutter/material.dart';

class NavigationCardViewModel {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;
  final VoidCallback? onTap;

  NavigationCardViewModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
    this.onTap,
  });

  NavigationCardViewModel copyWith({
    String? title,
    String? description,
    IconData? icon,
    Widget? destination,
    VoidCallback? onTap,
  }) {
    return NavigationCardViewModel(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      destination: destination ?? this.destination,
      onTap: onTap ?? this.onTap,
    );
  }
}