import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class DetaileCard extends StatelessWidget {
  const DetaileCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        child: Text(
          'Name: $title',
          maxLines: 2,
          style: TextStyle(color: kPrimaryColor, fontSize: 16),
        ),
      ),
    );
  }
}
