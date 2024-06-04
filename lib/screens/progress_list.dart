import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/main.dart';

class ProgressTracker extends StatelessWidget {
  final List<ProgressItem> progressItems;

  const ProgressTracker({required this.progressItems});

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Wrap(
        spacing: 10.0, // Add spacing between elements (optional)
        runSpacing: 10.0, // Add spacing between rows (optional)
        children: progressItems.map((item) => _buildProgressItem(item)).toList(),
      ),
    );
  }

  Widget _buildProgressItem(ProgressItem item) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: 50,
            width: 100,
            color: item.color,
          ),
          if (item.completed) 
            Positioned.fill(
              child: Container(
                width: (item.currentValue / item.maxValue) * 100, // Adjust width based on current value
                color: Colors.green, // Adjust color as needed
              ),
            ),
          Text(
            '${item.title}\n${item.currentValue}/${item.maxValue}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}