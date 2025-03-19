import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/finished/SectionIV/screens/filters.dart';

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
  void setFilters(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());
