import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Todo's"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 11,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text('item $index'),
              );
            })),
      ),
    );
  }
}
