import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/finished/SectionIV/provider/meal_provider.dart';

enum Filters {
  gluten,
  lactosen,
  vergantian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.gluten: false,
          Filters.lactosen: false,
          Filters.vegan: false,
          Filters.vergantian: false,
        });
  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

// Lay ra danh sach cach mon an da duoc filter

final filteredMeals = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilter[Filters.gluten]! && meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filters.lactosen]! && meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filters.vergantian]! && meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filters.vegan]! && meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
