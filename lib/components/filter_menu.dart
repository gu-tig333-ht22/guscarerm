import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/todos.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => ['all', 'done', 'undone']
          .map((entry) => PopupMenuItem(
                value: entry,
                child: Text(entry),
              ))
          .toList(),
      onSelected: (String value) {
        Provider.of<Todos>(context, listen: false).filteredBy = value;
      },
    );
  }
}
