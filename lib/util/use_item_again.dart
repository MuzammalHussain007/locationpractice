import 'package:flutter/material.dart';

class UseItemAgain extends StatelessWidget {
  String title;
  UseItemAgain(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}
