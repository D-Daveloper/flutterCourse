import 'package:basics_first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const beginFrom = Alignment.topLeft;
const endAt = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.firstColor, this.secondColor, {super.key});

  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: beginFrom,
          end: endAt,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
