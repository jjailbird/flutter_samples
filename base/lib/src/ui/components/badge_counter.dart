import 'package:flutter/material.dart';

import '../../constants.dart';
import '../extension_widget.dart';

class CounterBadge extends StatelessWidget {
  final int count;

  const CounterBadge({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: colorBadge, borderRadius: BorderRadius.circular(9)),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ).addNeumorphism(
      offset: const Offset(4, 4),
      borderRadius: 4,
      topShadowColor: Colors.white,
      bottomShadowColor: const Color(0xFF30384D).withOpacity(0.3),
    );
  }
}
