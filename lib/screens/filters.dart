import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Filters extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
