import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      child: child,
    );
  }

  Widget buildContain(Widget title, Widget container) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          title,
          container,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      selectedMeal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            buildContain(
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Row(
                    children: [
                      Icon(Icons.keyboard_arrow_right),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Text(
                                selectedMeal.ingredients[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildContain(
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          child: Text(
                            '# ${index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
