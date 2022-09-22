import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            _buildCard(context)
          ],
        ),
      ),
    );
  }

  Card _buildCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          Padding(padding: const EdgeInsets.only(right: 16),
            child: Text('N', style: Theme.of(context).textTheme.headline6,),
          )
        ],
      ),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
          )
      ),
    );
  }
}
