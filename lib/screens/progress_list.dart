import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/main.dart';
import 'package:tracker/screens/others/bigcard.dart';
import 'package:tracker/screens/others/smallcard.dart';

class ProgressTracker extends StatelessWidget {
  final List<ProgressItem> progressItems;

  const ProgressTracker({required this.progressItems});

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Wrap(
        spacing: 5.0, 
        runSpacing: 5.0, 
        children: progressItems.map((item) => _buildProgressItem(item)).toList(),
      ),
    );
  }

  Widget _buildProgressItem(ProgressItem item) {
    return Expanded(
      child: Stack(
        children: [
          BigCard(item: item,),
        ],
      ),
    );
  }
}