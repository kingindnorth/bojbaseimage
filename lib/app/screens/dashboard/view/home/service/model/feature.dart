import 'package:flutter/material.dart';

class Feature {
  final IconData icon;
  final String title;
  final String subtitle;

  Feature(this.icon, this.title, this.subtitle);

  // For API usage later:
  factory Feature.fromJson(Map<String, dynamic> j) =>
      Feature(_iconFromName(j['icon'] as String? ?? 'help_outline'),
          j['title'] as String? ?? '',
          j['subtitle'] as String? ?? '');

  static IconData _iconFromName(String name) {
    // map your API icon names to MaterialIcons or custom icons
    switch (name) {
      case 'handshake_outlined': return Icons.handshake_outlined;
      default: return Icons.help_outline;
    }
  }
}


