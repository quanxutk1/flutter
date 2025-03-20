import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/finished/SectionIV/data/dummy_data.dart';
import 'package:my_app/finished/SectionIV/models/meal.dart';
import 'package:my_app/finished/SectionIV/provider/favourite_provider.dart';
import 'package:my_app/finished/SectionIV/provider/filters_provider.dart';
import 'package:my_app/finished/SectionIV/provider/meal_provider.dart';
import 'package:my_app/finished/SectionIV/screens/categories.dart';
import 'package:my_app/finished/SectionIV/screens/filters.dart';
import 'package:my_app/finished/SectionIV/screens/meal_details.dart';
import 'package:my_app/finished/SectionIV/screens/meals.dart';
import 'package:my_app/finished/SectionIV/widgets/main_drawer.dart';

const kInitialFilter = {
  Filters.gluten: false,
  Filters.lactosen: false,
  Filters.vergantian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availabeMeals = ref.watch(filteredMeals);
    Widget activePage = CategoriesScreen(
      availabeMeals: availabeMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
