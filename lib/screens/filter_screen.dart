import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_option.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFreeFilterActive = false;
  bool _isLactoseFreeFilterActive = false;
  bool _isVegetarianFilterActive = false;
  bool _isVeganFilterActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your filters")),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "Meals Screen") {
      //       Navigator.of(
      //         context,
      //       ).push(MaterialPageRoute(builder: (context) => BottomTabBar()));
      //     }
      //   },
      // ),
      body: Column(
        children: [
          FilterOption(
            currentActiveFilter: _isGlutenFreeFilterActive,
            onChanged: (isChecked) {
              setState(() {
                _isGlutenFreeFilterActive = isChecked;
              });
            },
            title: "Gluten-free",
            subTitle: "Only include gluten-free meals.",
          ),
          FilterOption(
            currentActiveFilter: _isLactoseFreeFilterActive,
            onChanged: (isChecked) {
              setState(() {
                _isLactoseFreeFilterActive = isChecked;
              });
            },
            title: "Lactose-free",
            subTitle: "Only include lactose-free meals.",
          ),
          FilterOption(
            currentActiveFilter: _isVegetarianFilterActive,
            onChanged: (isChecked) {
              setState(() {
                _isVegetarianFilterActive = isChecked;
              });
            },
            title: "Vegetarian",
            subTitle: "Only include vegetarian meals.",
          ),
          FilterOption(
            currentActiveFilter: _isVeganFilterActive,
            onChanged: (isChecked) {
              setState(() {
                _isVeganFilterActive = isChecked;
              });
            },
            title: "Vegan",
            subTitle: "Only include vegan meals.",
          ),
        ],
      ),
    );
  }
}
