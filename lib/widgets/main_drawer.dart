import 'package:flutter/material.dart';
import 'package:inf_random/data/projects.dart';

class MainDrawer extends StatelessWidget {
  final int index;

  const MainDrawer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        itemCount: projectList.length,
        itemBuilder: (context, idx) {
          return ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            title: Center(child: Text(projectList[idx].projectTitle)),
            selected: index == idx,
            onTap: () {
              if (index == idx) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => projectList[idx].projectScreen,
                ));
              }
            },
          );
        },
      ),
    );
  }
}
