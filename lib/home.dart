import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.backspace_outlined)),
        title: Text('Test succefully'),
      ),
      body: const SizedBox(
        child: Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
