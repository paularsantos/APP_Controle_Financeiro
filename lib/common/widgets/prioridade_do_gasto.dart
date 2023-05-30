import 'package:flutter/material.dart';

class Priority extends StatelessWidget {

  final int priorityLevel;

  const Priority({required this.priorityLevel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: (priorityLevel > 1) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (priorityLevel > 2) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (priorityLevel > 3) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (priorityLevel > 4) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (priorityLevel > 5) ? Colors.blue : Colors.blue[100]),
      ],
    );
  }
}
