import 'package:flutter/material.dart';

class updateDetails extends StatefulWidget {
  const updateDetails({Key? key}) : super(key: key);

  @override
  State<updateDetails> createState() => _updateDetailsState();
}

class _updateDetailsState extends State<updateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Field Details'),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
