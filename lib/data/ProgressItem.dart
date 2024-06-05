import 'package:flutter/material.dart';

class ProgressItem {
  final String title;
  final Color color;
  final IconData icon;
  final int currTimes;
  final int Maxtimes;
  final bool completed;

  ProgressItem({
    required this.title,
    required this.color,
    required this.icon,
    required this.currTimes,
    required this.Maxtimes,
    this.completed = false,
  });
}