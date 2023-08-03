import 'package:flutter/material.dart';
import 'package:inf_random/data/projects.dart';
import 'package:inf_random/widgets/main_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, idx) {
            return ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              title: Center(child: Text(projectList[idx].projectTitle)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => projectList[idx].projectScreen,
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
