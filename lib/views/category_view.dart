import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/category_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  static String id = 'CategoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const AppBarText(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            CategoryCard(categoryName: 'All Medicine'),
            // Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
