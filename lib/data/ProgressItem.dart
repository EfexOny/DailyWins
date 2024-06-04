import 'package:flutter/material.dart';

class ProgressItem {
  final String title;
  final Color color;
  final int currentValue;
  final int maxValue;
  final bool completed;

  ProgressItem({
    required this.title,
    required this.color,
    required this.currentValue,
    required this.maxValue,
    this.completed = false,
  });
}