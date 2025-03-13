import 'package:flutter/material.dart';
import 'package:my_app/finished/SectionIV/data/dummy_data.dart';
import 'package:my_app/finished/SectionIV/models/category.dart';
import 'package:my_app/finished/SectionIV/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // So cell tren mot row
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final ct in availableCategories) CategoryGridItem(category: ct)
        ],
      ),
    );
  }
}
