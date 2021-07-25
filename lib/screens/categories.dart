import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
        mainAxisSpacing: MediaQuery.of(context).size.width * 0.05,
      ),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ))
          .toList(),
    );
  }
}
