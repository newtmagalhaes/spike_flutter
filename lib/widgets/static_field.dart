import 'package:flutter/material.dart';

class StaticField extends StatelessWidget {
  final String name;
  final String value;

  const StaticField({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        SizedBox(width: 80, child: Text(name, textAlign: .start)),
        SizedBox(width: 80, child: Text(value, textAlign: .start, softWrap: true,)),
      ],
    );
  }
}
