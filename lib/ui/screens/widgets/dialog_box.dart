import 'package:flutter/material.dart';




class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Column(
        children: [
          Text('Take a photo')
        ],
      ),
    );
  }
}
