import 'package:flutter/material.dart';

class TimeProgressItem {
  final String title;
  final Color color;
  final IconData icon;
  final int minutes;
  final bool completed;

  TimeProgressItem({
    required this.title,
    required this.color,
    required this.icon,
    required this.minutes,
    this.completed = false,
  });
}