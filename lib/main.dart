import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import './screens/categories.dart';
import './screens/category_meals.dart';
import './screens/meal_detail.dart';
import './screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: FlexColorScheme.light(scheme: FlexScheme.hippieBlue).toTheme,
      routes: {
        '/': (ctx) => Tabs(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
