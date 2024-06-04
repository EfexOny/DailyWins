import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';

class SmallCard extends StatelessWidget {

    final ProgressItem item;
    const SmallCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(item.icon, color: Colors.white),
          SizedBox(height: 8),
          Text(
            item.title,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            item.currentValue.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}