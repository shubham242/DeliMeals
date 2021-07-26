import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitch(
      String title, String subtitle, bool curVal, Function _updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: curVal,
      subtitle: Text(subtitle),
      onChanged: (val) => _updateVal(val),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilters(selectedFilters);
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: Icon(Icons.save),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal section.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitch(
                'Gluten Free',
                'Only include Gluten free Meals',
                _glutenFree,
                (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                },
              ),
              _buildSwitch(
                'Lactose Free',
                'Only include Lactose free Meals',
                _lactoseFree,
                (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                },
              ),
              _buildSwitch(
                'Vegatarian',
                'Only include Vegetarian Meals',
                _vegetarian,
                (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                },
              ),
              _buildSwitch(
                'Vegan',
                'Only include Vegan Meals',
                _vegan,
                (newVal) => {
                  setState(() {
                    _vegan = newVal;
                  })
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
