import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/finished/SectionIV/models/meal.dart';
import 'package:my_app/finished/SectionIV/provider/favourite_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    // required this.onTogleMealStatus,
  });
  final Meal meal;
  // final void Function(Meal meal) onTogleMealStatus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAddes = ref
                  .read(favouriteMealsProvider.notifier)
                  .togleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAddes ? 'Meal added' : 'Meal removed',
                  ),
                ),
              );
              // onTogleMealStatus(meal);
            },
            icon: Icon(isFavourite ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ingredients',
              style: TextTheme.of(context).titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredien in meal.ingredients)
              Text(ingredien,
                  style: TextTheme.of(context).bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: TextTheme.of(context).titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(step,
                    textAlign: TextAlign.center,
                    style: TextTheme.of(context).bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
              ),
          ],
        ),
      ),
    );
  }
}
