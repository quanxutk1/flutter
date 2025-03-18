import 'package:flutter/material.dart';
import 'package:my_app/finished/SectionIV/data/dummy_data.dart';
import 'package:my_app/finished/SectionIV/models/category.dart';
import 'package:my_app/finished/SectionIV/models/meal.dart';
import 'package:my_app/finished/SectionIV/screens/meals.dart';
import 'package:my_app/finished/SectionIV/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onTogleMealStatus,
      required this.availabeMeals});

  final void Function(Meal meal) onTogleMealStatus;
  final List<Meal> availabeMeals;
  void _selectCategory(context, Category category) {
    final List<Meal> filterMeals = availabeMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filterMeals,
        onTogleMealStatus: onTogleMealStatus,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // So cell tren mot row
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final ct in availableCategories)
          CategoryGridItem(
            category: ct,
            onSelectCategory: () {
              _selectCategory(context, ct);
            },
          )
      ],
    );
  }
}
