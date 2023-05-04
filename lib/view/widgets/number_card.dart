import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NumberCard extends StatelessWidget {
  final String teks;
  final Object data;

  const NumberCard({super.key, required this.teks, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(teks),
        data == '-'
            ? const Text(
                'Tap Increment',
                style: TextStyle(fontSize: 10),
              )
            : Text('$data')
      ],
    );
  }
}
