import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';

class BigCard extends StatelessWidget {

  final ProgressItem item;
  const BigCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 250,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.currentValue.toString()),
              Text(item.maxValue.toString()),
            ],
          ),
        ],
      ),
    );
  }
}