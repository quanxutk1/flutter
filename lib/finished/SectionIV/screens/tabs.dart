import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/finished/SectionIV/data/dummy_data.dart';
import 'package:my_app/finished/SectionIV/models/meal.dart';
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
  final List<Meal> _favouriteMeal = [];

  Map<Filters, bool> _selectFilter = kInitialFilter;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void _toggleFavouriteMealStatus(Meal meal) {
    final isExiting = _favouriteMeal.contains(meal);
    if (isExiting) {
      setState(() {
        _favouriteMeal.remove(meal);
      });
      _showInfoMessage('Meal is removed from favorites');
    } else {
      setState(() {
        _favouriteMeal.add(meal);
      });
      _showInfoMessage('Meal is added from favorites');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilter: _selectFilter,
          ),
        ),
      );

      setState(() {
        _selectFilter = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availabeMeals = meals.where((meal) {
      if (_selectFilter[Filters.gluten]! && meal.isGlutenFree) {
        return false;
      }
      if (_selectFilter[Filters.lactosen]! && meal.isLactoseFree) {
        return false;
      }
      if (_selectFilter[Filters.vergantian]! && meal.isVegetarian) {
        return false;
      }
      if (_selectFilter[Filters.vegan]! && meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onTogleMealStatus: _toggleFavouriteMealStatus,
      availabeMeals: availabeMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeal,
        onTogleMealStatus: _toggleFavouriteMealStatus,
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
