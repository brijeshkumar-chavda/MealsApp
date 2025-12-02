import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() {
    return _BottomTabBarState();
  }
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedScreenIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMealStatus(Meal meal) {
    final bool isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer a favorite.");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Meal is added to favorite list!");
      });
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "Filters Screen") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavoriteMeal: _toggleFavoriteMealStatus,
    );
    var activeScreenTitle = "Categories";

    if (_selectedScreenIndex == 1) {
      activeScreen = MealsScreen(
        title: "Favorites",
        meals: _favoriteMeals,
        onToggleFavoriteMeal: _toggleFavoriteMealStatus,
      );
      activeScreenTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
    );
  }
}
