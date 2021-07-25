import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filtered = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filtered[index].id,
            title: filtered[index].title,
            imageUrl: filtered[index].imageUrl,
            affordability: filtered[index].affordability,
            complexity: filtered[index].complexity,
            duration: filtered[index].duration,
          );
        },
        itemCount: filtered.length,
      ),
    );
  }
}
